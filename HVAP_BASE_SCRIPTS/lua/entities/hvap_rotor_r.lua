
AddCSLuaFile("hvap_rotor_r.lua")

ENT.Base 				= "base_anim"
ENT.Type 				= "anim"

ENT.PrintName			= "HVAP Rear Rotor"
ENT.Author				= hvap.author
ENT.Category			= ""
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""

ENT.Spawnable			= false
ENT.AdminSpawnable		= false
ENT.valid = false

if SERVER then

function ENT:Initialize()
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_NONE)
	self.Phys = self:GetPhysicsObject()
	self.Phys:Wake()
	self.Phys:SetMass(self.Mass)
	self.Phys:EnableGravity(false)
	self.Phys:EnableDrag(false)
	self.Disabled = false
	self.rotorRPM = 0
	self.EngRpm = 0 
	self:SetTrigger(true)	

	self.RotorHPMult = self.aircraft.RotorHPMult
	
	if self.RotorHPMult > 0 then
		self.RotHealth = self.RotHealth*self.RotorHPMult
		self.Unbreakable = false
	else
		self.Unbreakable = true
	end
	
	if self.aircraft.Unbreakable then
		self.Unbreakable = true
	end
	
	self.BaseHealth = self.RotHealth	
	
	local obb = self:OBBMaxs()
	self.RotorWidth = self.Width or (obb.x>obb.y and obb.x or obb.y)
	self.valid = true
end

function ENT:StartTouch(e)
	if self.Disabled or !self.valid then return end
	self:TouchFunc(e, e:GetPos())
end

function ENT:Think()
	if !self.valid then return end
	local crt = CurTime()

	local bodygroup = math.Remap(self.rotorRPM+.4, 0, 1, 0, self:GetNumBodyGroups())
	self:SetBodygroup(1, bodygroup)
	self:SetColor(Color(255,255,255,math.Clamp(1.3-self.rotorRPM,0.1,1)*255))	

	if self.rotorRPM > 0.01 and !self.Disabled then
		for i=0,360, 18/self.rotorRPM do
			local tr = util.TraceLine({
				start 	= self:GetPos(),
				endpos 	= self:GetRight()*math.sin(i)*self.RotorWidth+self:GetForward()*math.cos(i)*self.RotorWidth+self:GetPos()+self:GetUp(),
				filter 	= self.aircraft.Children,
				mask 	= {CONTENTS_SOLID,CONTENTS_WINDOW,CONTENTS_WATER,CONTENTS_MOVEABLE,CONTENTS_HITBOX,MASK_SOLID},
			})
			if tr.Hit and !tr.HitSky  then
				self:TouchFunc(tr.Entity, tr.HitPos)
			end
		end	
	end 	
	if self.RotHealth == 0 and !self.Disabled then
		self:KillRotor()
	end	
	
	self:NextThink(crt+0.08)
	return true	
end

function ENT:PhysicsUpdate(ph)
	if !self:IsValid() or self.LastPhys == CurTime() then return end
	self.rotorVel = ph:GetAngleVelocity()	
	
	local phm = FrameTime()*66

	if !self.Disabled then	
		ph:AddAngleVelocity(Vector(0,-self.aircraft.rotorRpm*640*self.Dir-ph:GetAngleVelocity().y/10,0)*phm)	
		self.rotorRPM = math.Clamp(self.rotorVel:Length()/1600, 0, 1)
	else
		self.rotorRPM = 01
	end
	self.LastPhys = CurTime()
end

function ENT:TouchFunc(ent, pos)
	if !self:IsValid() or self.Disabled then return end
	
	if !table.HasValue(self.aircraft.passengers, ent) and !table.HasValue(self.aircraft.Children, ent) and ent:GetMoveType() != MOVETYPE_NOCLIP then
		local pow = math.pow(self.rotorVel:Length(),2)
		local dmg, mass;
		if ent:GetClass() == "worldspawn" then
			dmg = pow/256000
			mass = 10000
			local effectdata = EffectData()
			effectdata:SetStart(pos)
			effectdata:SetOrigin(pos)
			effectdata:SetScale(1)
			util.Effect( "StunstickImpact", effectdata )
		elseif ent:IsPlayer() then
			dmg=(math.Round(((pow + self:GetVelocity():Length()*self:GetVelocity():Length())/320000), 0))
			mass = ent:GetPhysicsObject():GetMass()
			ent:TakeDamage(dmg*5, self.Entity, self.Entity)
			local effectdata = EffectData()
			effectdata:SetStart(pos)
			effectdata:SetOrigin(pos)
			effectdata:SetScale(1)
			util.Effect( "BloodImpact", effectdata )
		else
			dmg=(math.Round(((pow + self:GetVelocity():Length()*self:GetVelocity():Length())/256000), 0))
			mass = ent:GetPhysicsObject():GetMass()
			ent:TakeDamage(dmg*5, self.Entity, self.Entity)
			local effectdata = EffectData()
			effectdata:SetStart(pos)
			effectdata:SetOrigin(pos)
			effectdata:SetScale(1)
			util.Effect( "StunstickImpact", effectdata )
		end
		self:DamageRotor(dmg/8)
		self:TakeDamage(dmg, IsValid(self.aircraft.passengers[1]) and self.aircraft.passengers[1] or self.aircraft, self.Entity)		
		self.Entity:EmitSound("physics/metal/metal_box_impact_bullet"..math.random(1,3)..".wav", math.Clamp(dmg*40,0,100))			
	end	
end

function ENT:OnTakeDamage(dmg)
	if self.Unbreakable then return end
	if !dmg:IsExplosionDamage() then
		dmg:ScaleDamage(0.064)
	end
	
	local rdmg = dmg:GetDamage()/10
	
	self:DamageRotor(rdmg)
end

function ENT:DamageRotor(amt)
	if amt == 0 or !self:IsValid() or self.Unbreakable then return end
	self.RotHealth = math.Clamp(self.RotHealth - amt, 0, self.BaseHealth)
	self.Phys:AddAngleVelocity(Vector(0,0,(-self.Dir*50*self.rotorRPM*(amt/25))))
end

function ENT:Repair(amt)
	if self.RotHealth < self.BaseHealth and !self.Disabled then
		self.RotHealth = math.Clamp(self.RotHealth + self.BaseHealth/amt, 0, self.BaseHealth )
	end
end

function ENT:ResetRot()
	self.RotHealth = self.BaseHealth
	self.Disabled = false	
	self:SetNoDraw(false)	
	self:SetTrigger(true)
end

function ENT:KillRotor()
	local e = ents.Create("prop_physics")
	e:SetPos(self:GetPos())
	e:SetAngles(self:GetAngles())
	e:SetModel(self:GetModel())
	e:SetSkin(self:GetSkin())
	e:Spawn()
	e:SetBodygroup(0,0)
	e:SetNotSolid(false)
	e.Owner = self.Owner
	local ph = e:GetPhysicsObject()
	if ph:IsValid() then
		ph:SetMass(1000)
		ph:EnableDrag(false)
		ph:AddAngleVelocity(self.rotorVel)
		ph:SetVelocity(self:GetVelocity())
	end
------------------------------------------------------------------------------------
	self:SetNoDraw(true)
	self.Disabled = true
	self:SetTrigger(false)
------------------------------------------------------------------------------------
	timer.Simple(30, function() if e and e:IsValid() then e:Remove() end end)
end

end
