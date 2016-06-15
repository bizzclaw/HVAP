
AddCSLuaFile("hvap_engine_g.lua")

ENT.Base 				= "base_anim"
ENT.Type 				= "anim"

ENT.PrintName			= "HVAP Engine"
ENT.Author				= hvap.author
ENT.Category			= ""
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""

ENT.Spawnable			= false
ENT.AdminSpawnable	= false
ENT.engineRpm = 0
ENT.enginePower = 0
ENT.engineHealth = 0
ENT.FuelSub = 0
ENT.Model = "models/hunter/blocks/cube05x05x05.mdl"
ENT.Disabled = false
ENT.Burning = false
ENT.Smoking = false
ENT.EngineFire = NULL
ENT.HealthScale = 1
ENT.valid = false

if CLIENT then

function ENT:Draw()

end

elseif SERVER then

function ENT:Initialize()
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetSolid(SOLID_NONE)
	self.Entity:SetModel(self.Model)
	self:SetTrigger(false)	 
	self.OnRemoveEntities = {}
	self.valid = true
end

function ENT:Think()
	if !self.valid then return end

	self.HealthScale = self.engineHealth/self.BaseHealth
	local rpmscl = self.engineRpm/self.MaxRPM

	if self.aircraft.active and self.engineHealth > 0 then	
		self.engineRpm = math.Clamp(self.engineRpm+FrameTime()*((self.aircraft.StartSpd+1)*32), 0, self.MaxRPM+(self.MaxRPM*(self.HealthScale-1))/math.random(2,3))	
		self.FuelSub = ((1/rpmscl)*(1/self.HealthScale)/100)*self.Consumption
		if self.Smoking and !self.Burning and self:WaterLevel() == 0 then
			self:CreateSmoke()
		end
		self:CreateEffect()
	else
		self.engineRpm = math.Clamp(self.engineRpm-FrameTime()*(self.aircraft.StartSpd+1)*20, 0, self.MaxRPM)
		self.FuelSub = 0
	end	
	
	if self.Burning and self:WaterLevel() == 0 then
		self:DamageEngine(0.05)
		self:Burn()
		self.Smoking = false
	end

	if self.HealthScale < .90 and !self.Smoking then
		self.Smoking = true	
	end
	
	if self.HealthScale < .25 and !self.Burning then
		self.Burning = true
	else
		self.Burning = false
	end
	
	if self.engineHealth == 0 and !self.Disabled then
		local effectdata = EffectData()
		effectdata:SetStart(self.Entity:GetPos())
		effectdata:SetOrigin(self.Entity:GetPos())
		effectdata:SetScale(1)
		util.Effect("Explosion", effectdata)
		util.Effect("HelicopterMegaBomb", effectdata)
		util.Effect("cball_explode", effectdata)
		util.BlastDamage(self.Entity, self.Entity, self.Entity:GetPos(), 320, 50)	
		self.Disabled = true
	end
	
	self.enginePower = math.Clamp(rpmscl*self.Power+(self.Power*(self.HealthScale-1)/10), 0, self.Power)		
	self:NextThink(CurTime()+0.0512)

	return true
end

function ENT:DamageEngine(dmg)

	if self.Disabled then return end
	self.engineHealth = math.Clamp(self.engineHealth - dmg/4, 0, self.BaseHealth)

	if self.HealthScale <= 0 and !self.Disabled then
	end
	
	if self.HealthScale < .90 and !self.Smoking then
		self.Smoking = true	
	end
	
	if self.HealthScale < .25 and !self.Burning then
		self.Burning = true
	else
		self.Burning = false
	end
	
end

function ENT:CreateSmoke()
	if self.SmokePos and self:IsValid() then
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
	if self.EffectPos and self:IsValid() then
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
	if self.Burning and !self.EngineFire:IsValid() then	
		local fire = ents.Create("env_fire_trail")
		fire:SetPos(self:LocalToWorld(self.FirePos))
		fire:Spawn()
		fire:SetParent(self.Entity)
		self.EngineFire = fire
		self:AddOnRemove(fire)
	end
end

function ENT:Repair(amt)
	if self.engineHealth < self.BaseHealth then
		self.engineHealth = math.Clamp(self.engineHealth + self.BaseHealth/amt, 0, self.BaseHealth )
		self.Disabled = false
		self.Burning = false
		self.Smoking = false
		if self.EngineFire:IsValid() then
			self.EngineFire:Remove()
		end
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
end

end
