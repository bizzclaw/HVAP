
AddCSLuaFile("hvap_engine_p.lua")

ENT.Base 				= "base_anim"
ENT.Type 				= "anim"

ENT.PrintName			= "HVAP Engine"
ENT.Author				= hvap.author
ENT.Category			= ""
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.engineRpm = 0
ENT.enginePower = 0
ENT.engineHealth = 0
ENT.FuelSub = 0
ENT.Disabled = false
ENT.Burning = false
ENT.Smoking = false

ENT.Sounds = {
	burn = "hvap/tank/tank_fire_01.wav",	
}

function ENT:Initialize()
	self.Sounds = {
		burn = "hvap/tank/tank_fire_0"..math.random(1,3)..".wav",	
	}
end

if CLIENT then

elseif SERVER then

function ENT:Initialize()
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetSolid(SOLID_NONE)
	self.Phys = self:GetPhysicsObject()
	self.Phys:Wake()
	self.Phys:SetMass(0)
	self.Phys:EnableGravity(false)
	self.Phys:EnableDrag(false)
	self:SetTrigger(false)
	self.OnRemoveEntities = {}
	self.sounds = {}
	for n, p in pairs(self.Sounds) do
		if n != "BaseClass" then
			self.sounds[n] = CreateSound(self, p)
		end
	end
end

function ENT:Think()
	local crt = CurTime()+0.05
	self.HealthScale = self.engineHealth/self.BaseHealth
	local rpmscl = self.engineRpm/self.MaxRPM
	local powerscl = self.enginePower/self.Power

	if self.aircraft.active and self.HealthScale > 0 and self.aircraft.FuelScl > 0 then	
		self.engineRpm = math.Clamp(self.engineRpm+FrameTime()*(self.aircraft.StartSpd*10), 0, self.MaxRPM+(self.MaxRPM*(self.HealthScale-1))/1.92)	
		self.FuelSub = ((1/rpmscl)*(1/self.HealthScale)/100)*self.Consumption
		if self.Smoking and !self.Burning then
			self:CreateSmoke()
		end
		self:CreateEffect()
	else
		self.engineRpm = math.Clamp(self.engineRpm-FrameTime()*self.aircraft.StartSpd*1.92, 0, self.MaxRPM)
		if self.Disabled then
			self.FuelSub = 10
		else
			self.FuelSub = 0
		end
	end	
	
	if self.Burning then
		self:DamageEngine(0.05)
		self:Burn()
	end		
	
	if self.engineHealth == 0 and !self.Disabled then
		local effectdata = EffectData()
		effectdata:SetStart(self.Entity:GetPos())
		effectdata:SetOrigin(self.Entity:GetPos())
		effectdata:SetScale(1)
		util.Effect("Explosion", effectdata)
		util.Effect("HelicopterMegaBomb", effectdata)
		util.Effect("cball_explode", effectdata)
		util.BlastDamage(self.Entity, self.Entity, self.Entity:GetPos(), 320, 5)	
		self.Disabled = true
	end
	
	self.enginePower = math.Clamp(rpmscl*self.Power+(self.Power*(self.HealthScale-1)/10), 0, self.Power)		
	self:NextThink(crt)
	return true
end

function ENT:DamageEngine(dmg)

	if self.Disabled then return end
	self.engineHealth = math.Clamp(self.engineHealth - dmg/2, 0, self.BaseHealth)
	
	if self.HealthScale < .9 then

	end

	if self.HealthScale < .8 then
		self.Smoking = true	
	end
			
	if self.HealthScale < .7 then
	
	end
	
	if self.HealthScale < .6 then
	
	end
			
	if self.HealthScale < .5 then
	
	end
			
	if self.HealthScale < .4 then
	
	end
	
	if self.HealthScale < .3 then
		self.Burning = true	
	end

	if self.HealthScale < .2 then
						
	end
		
	if self.HealthScale < .1 then
	
	end

	if self.HealthScale <= 0 and !self.Disabled then
	end
end

function ENT:CreateSmoke()
	if self.SmokePos then
		cureffect=0
		cureffect=CurTime()+0.01
		local ed=EffectData()
		local colmod = (math.random(169,171)*self.HealthScale)
		ed:SetEntity(self)
		ed:SetOrigin(self.SmokePos)
		ed:SetMagnitude(100)
		ed:SetRadius(512)
		ed:SetColor(colmod,colmod,colmod,colmod)
		ed:SetScale(1-self.HealthScale)
		smoke = util.Effect(self.SmokeEffect, ed)
		self:AddOnRemove(smoke)
	else return end
end

function ENT:CreateEffect()
	if self.EffectPos then
		cureffect=0
		cureffect=CurTime()+0.01
		local ed=EffectData()
		ed:SetEntity(self)
		ed:SetOrigin(self.EffectPos)
		ed:SetMagnitude(self.engineRpm/self.MaxRPM)
		ed:SetScale(self.HealthScale)
		heatwave = util.Effect(self.EngineEffect, ed)
		self:AddOnRemove(heatwave)
	else return end
end

function ENT:Burn()
	if self.Burning and !self.EngineFire then	
		local fire = ents.Create("env_fire_trail")
		fire:SetPos(self:LocalToWorld(self.FirePos))
		fire:Spawn()
		fire:SetParent(self.Entity)
		self.sounds.burn:Play()
		self.Smoking = false
		self.EngineFire = fire
	end
end

function ENT:AddOnRemove(f)
	if type(f)=="Entity" then
		table.insert(self.OnRemoveEntities,f)
	end
end

function ENT:OnRemove()
	for _,e in pairs(self.OnRemoveEntities) do
		if IsValid(e) then e:Remove() end
	end
	for _, s in pairs(self.sounds) do
		s:Stop()
	end
end

end
