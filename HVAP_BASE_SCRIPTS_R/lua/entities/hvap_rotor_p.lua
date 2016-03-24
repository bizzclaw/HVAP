
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

if CLIENT then
elseif SERVER then

function ENT:Initialize()
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_NONE)
	self.Phys = self:GetPhysicsObject()
	self.Phys:Wake()
	self.Phys:SetMass(self.Mass)
	self.Phys:EnableGravity(false)
	self.Phys:EnableDrag(false)
	self.rotorRPM = 0
	self.EngRpm = 0 
	self:SetTrigger(false)	
	local obb=self:OBBMaxs()
	self.RotorWidth=1
	self.RotorHeight=1
end

function ENT:StartTouch(e)
	self:TouchFunc(e, e:GetPos())
end

function ENT:Think()
	local crt = CurTime()+0.05
	if !self:IsValid() then return end

	local bodygroup = math.Remap(self.rotorRPM, 0, 1, 0, self:GetNumBodyGroups())
	
	self:SetBodygroup(1, bodygroup)

	self:SetColor(Color(255,255,255,math.Clamp(1.3-self.rotorRPM,0.1,1)*255))	
	
	if self.aircraft.CrRotorWash then
		if self.rotorRPM > 0.4 then
			if !self.RotorWash then
				self.RotorWash = ents.Create("env_rotorwash_emitter")
				self.RotorWash:SetPos(self.Entity:GetPos())
				self.RotorWash:SetParent(self.Entity)
				self.RotorWash:Activate()
			end
		else
			if self.RotorWash then
				self.RotorWash:Remove()
				self.RotorWash = nil
			end
		end
	end
	if self.rotorRPM > 0.1 then
		for i=0,360, 36 do
			local trd={}
			trd.start=self:GetPos()
			trd.endpos=self:GetRight()*math.sin(i)*self.RotorWidth+self:GetForward()*math.cos(i)*self.RotorWidth+trd.start+self:GetUp()*self.RotorHeight
			trd.filter={self.aircraft,ents.FindByClass( "hvap_bullet_*")}
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
	
	self:NextThink(crt)
	return true
end

function ENT:PhysicsUpdate()
	if self.LastPhys == CurTime() or !self:IsValid() then return end
	self.angvel = self.Phys:GetAngleVelocity()
	local upvel = self:WorldToLocal(self:GetVelocity()+self:GetPos()).x
	local phm = FrameTime()*66
	
	self.Brake = (
			math.Clamp(math.abs(self.angvel.x)-self.MaxRPM, 0, 100)/10+
			math.pow(1/((math.abs(self.angvel.x))/(self.MaxRPM)), .5)+
			math.abs(self.angvel.x/10000)+(upvel-self.rotorRPM)*(self.aircraft.Throttle)/1000
	)
	self.targetAngVel = Vector((((self.EngRpm*self.MaxRPM/100)+self.angvel:Length()/self.MaxRPM)*self.Dir), 0, 0)-self.angvel*self.Brake/320-Vector(math.Clamp(upvel/4-self.rotorRPM/4,0,16),0,0)
	self.Phys:AddAngleVelocity(self.targetAngVel)
	self.rotorRPM = math.Clamp((self.angvel.x/self.MaxRPM)*self.Dir, -2, 2)
	self.LastPhys = CurTime()
end

function ENT:TouchFunc(touchedEnt, pos)
	if !self:IsValid() then return end
	
	if	not table.HasValue(self.aircraft.passengers, touchedEnt) and !table.HasValue(self.aircraft.entities, touchedEnt)
	and !string.find(touchedEnt:GetClass(), "func*") and !string.find(touchedEnt:GetClass(), "hvap_hc_bullet_*")
	and touchedEnt != self and touchedEnt != self.aircraft and touchedEnt:GetMoveType() != MOVETYPE_NOCLIP then
		local pow = math.pow(self.angvel:Length(),2)
		local dmg, mass;
		if touchedEnt:GetClass() == "worldspawn" then
			dmg = pow/256000
			mass = 10000
			local effectdata = EffectData()
			effectdata:SetStart(pos)
			effectdata:SetOrigin(pos)
			effectdata:SetScale(1)
			util.Effect( "StunstickImpact", effectdata )
		elseif touchedEnt:IsPlayer() then
			dmg=(math.Round(((pow + self:GetVelocity():Length()*self:GetVelocity():Length())/320000), 0))
			mass = touchedEnt:GetPhysicsObject():GetMass()
			touchedEnt:TakeDamage(dmg*5, self.Entity, self.Entity)
			local effectdata = EffectData()
			effectdata:SetStart(pos)
			effectdata:SetOrigin(pos)
			effectdata:SetScale(1)
			util.Effect( "BloodImpact", effectdata )
		else
			dmg=(math.Round(((pow + self:GetVelocity():Length()*self:GetVelocity():Length())/256000), 0))
			mass = touchedEnt:GetPhysicsObject():GetMass()
			touchedEnt:TakeDamage(dmg*5, self.Entity, self.Entity)
			local effectdata = EffectData()
			effectdata:SetStart(pos)
			effectdata:SetOrigin(pos)
			effectdata:SetScale(1)
			util.Effect( "StunstickImpact", effectdata )
		end
		self.Phys:AddVelocity((self:GetPos() - pos)*dmg/mass)
		self:DamageRotor(dmg/10)
		self:TakeDamage(dmg, IsValid(self.aircraft.passengers[1]) and self.aircraft.passengers[1] or self.aircraft, self.Entity)	
		self.Entity:EmitSound("physics/metal/metal_box_impact_bullet"..math.random(1,3)..".wav", math.Clamp(dmg*40,0,100))		
	end	
end

function ENT:DamageRotor(amt)
	if amt == 0 or !self:IsValid() then return end
	self.RotHealth = math.Clamp(self.RotHealth - amt, 0, self.BaseHealth)
	self.Phys:AddAngleVelocity(Vector(0,0,(-100*self.rotorRPM*amt)))

	if self.RotHealth < .9*self.BaseHealth then

	end

	if self.RotHealth < .8*self.BaseHealth then
	
	end
			
	if self.RotHealth < .7*self.BaseHealth then
	
	end
	
	if self.RotHealth < .6*self.BaseHealth then
	
	end
			
	if self.RotHealth < .5*self.BaseHealth then
	
	end
			
	if self.RotHealth < .4*self.BaseHealth then
	
	end
	
	if self.RotHealth < .3*self.BaseHealth then
	
	end

	if self.RotHealth < .2*self.BaseHealth then					
	end
		
	if self.RotHealth < .1*self.BaseHealth then
	
	end

	if self.RotHealth <= 0 then

	end	
	
end

function ENT:KillRotor()
	local e = ents.Create("prop_physics")
	e:SetPos(self:GetPos())
	e:SetAngles(self:GetAngles())
	e:SetModel(self:GetModel())
	e:SetSkin(self:GetSkin())
	e:Spawn()
	e:SetBodygroup(0,0)
	e.hvap_ignore=true
	e:SetNotSolid(false)
	e.Owner = self.Owner
	local ph = e:GetPhysicsObject()
	if ph:IsValid() then
		ph:SetMass(1000)
		ph:EnableDrag(false)
		ph:AddAngleVelocity(self.angvel)
		ph:SetVelocity(self.angvel:Length()*self:GetUp()*0.5 + self:GetVelocity())
	end
	self.rotorRPM = 0
	self:Remove()
	if hvap.aircraft.cvars.removetime:GetFloat() > 0 then
		timer.Simple(hvap.aircraft.cvars.removetime:GetFloat(), function() if e and e:IsValid() then e:Remove() end end)
	end
end

end
