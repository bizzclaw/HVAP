
AddCSLuaFile("hvap_rotor_p.lua")

ENT.Base 				= "base_anim"
ENT.Type 				= "anim"

ENT.PrintName			= "HVAP Rotor"
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
	self.Phys:SetAngleDragCoefficient( 1.024 )
	self.Phys:SetDragCoefficient( 0 )
	self.Disabled = false
	self.rotorRPM = 0
	self.EngRpm = 0 
	self:SetTrigger(true)	
	self.RotorWidth=math.Clamp(self:BoundingRadius()-100, 100, 400)
	self.valid = true
end

function ENT:StartTouch(e)
	if self.Disabled or !self.valid then return end
	self:TouchFunc(e, e:GetPos())
end

function ENT:Think()
	if !self.valid then return end
	local crt = CurTime()+0.16

	if !self.Disabled then
		local bodygroup = math.Remap(self.rotorRPM, 0, 1, 0, self:GetNumBodyGroups())
		self:SetBodygroup(1, bodygroup)
		self:SetColor(Color(255,255,255,math.Clamp(1.3-self.rotorRPM,0.1,1)*255))	
		
		if self.rotorRPM > 0.1 then
			for i=0,360, 22 do
				local trd={}
				trd.start=self:GetPos()
				trd.endpos=self:GetRight()*math.sin(i)*self.RotorWidth+self:GetForward()*math.cos(i)*self.RotorWidth+trd.start+self:GetUp()
				trd.filter={self.aircraft.entities}
				trd.mask=MASK_SHOT
				local tr=util.TraceLine(trd)
				if tr.Hit and !tr.HitSky then
					self:TouchFunc(tr.Entity, tr.HitPos)
				end
			end	
		end 	
		if self.RotHealth == 0 then
			self:KillRotor()
			self.rotorRPM = 0
		end	
	else
		self.rotorRPM = 0
	end
	
	self:NextThink(crt)
	return true
end

function ENT:PhysicsUpdate(ph)
	if !self:IsValid() or self.Disabled then return end
	if self.LastPhys == CurTime() or !self:IsValid() then return end
	self.angvel = ph:GetAngleVelocity()
	local upvel = self:WorldToLocal(self:GetVelocity()+self:GetPos()).x
	local phm = FrameTime()*66
	self.targetAngVel = Vector(((self.aircraft.Throttle^2)*58 + self.EngRpm*3.2)*self.Dir, 0, 0)
	ph:AddAngleVelocity(self.targetAngVel)
	self.rotorRPM = math.Clamp((self.angvel.x/self.MaxRPM)*self.Dir, -2, 2)
	print(	self.rotorRPM)
	self.LastPhys = CurTime()
end

function ENT:TouchFunc(ent, pos)
	if !self:IsValid() or self.Disabled then return end
	
	if !table.HasValue(self.aircraft.passengers, ent) and !table.HasValue(self.aircraft.entities, ent) and !string.find(ent:GetClass(), "func*") and ent:GetMoveType() != MOVETYPE_NOCLIP then
		local pow = math.pow(self.angvel:Length(),2)
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
		self.Phys:AddVelocity((self:GetPos() - pos)*dmg/mass)
		self:DamageRotor(dmg/8)
		self:TakeDamage(dmg, IsValid(self.aircraft.passengers[1]) and self.aircraft.passengers[1] or self.aircraft, self.Entity)	
		self.Entity:EmitSound("physics/metal/metal_box_impact_bullet"..math.random(1,3)..".wav", math.Clamp(dmg*40,0,100))		
	end	
end

function ENT:OnTakeDamage(dmg)

	if !dmg:IsExplosionDamage() then
		dmg:ScaleDamage(0.064)
	end
	
	local rdmg = dmg:GetDamage()/2
	
	self:DamageRotor(rdmg)
end

function ENT:DamageRotor(amt)
	if amt == 0 or !self:IsValid() then return end
	self.RotHealth = math.Clamp(self.RotHealth - amt, 0, self.BaseHealth)
	self.Phys:AddAngleVelocity(Vector(0,0,(-100*self.rotorRPM*amt)))
end

function ENT:Repair(amt)
	if self.RotHealth < self.BaseHealth and !self.Disabled then
		self.RotHealth = math.Clamp(self.RotHealth + self.BaseHealth/amt, 0, self.BaseHealth )
		self:EmitSound("hvap/repair_loop.wav", 100, 100+amt*10)
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
		ph:AddAngleVelocity(self.angvel)
		ph:SetVelocity(self.angvel:Length()*self:GetForward()*0.5 + self:GetVelocity())
	end
	self.rotorRPM = 0
------------------------------------------------------------------------------------
	self:SetNoDraw(true)
	self.Disabled = true
	self:SetTrigger(false)
------------------------------------------------------------------------------------
	timer.Simple(hvap.aircraft.cvars.removetime:GetFloat()+15, function() if e and e:IsValid() then e:Remove() end end)
end

end
