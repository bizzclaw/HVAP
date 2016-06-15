
AddCSLuaFile()

ENT.Base 				= "base_entity"
ENT.Type 				= "point"

ENT.PrintName			= "HVAP Engine"
ENT.Author				= hvap.author
ENT.Category			= ""
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""

ENT.Spawnable			= false
ENT.AdminSpawnable	= false
ENT.engineRpm = 0
ENT.RPMSCL = 0
ENT.enginePower = 0
ENT.engineHealth = 0
ENT.FuelSub = 0
ENT.Disabled = false
ENT.Burning = false
ENT.Smoking = false
ENT.EngineFire = NULL
ENT.HealthScale = 1
ENT.valid = false

if SERVER then

function ENT:Initialize()
	self.OnRemoveEntities = {}
	
	self.EngineHPMult = self.aircraft.EngineHPMult
	
	if self.EngineHPMult > 0 then
		self.engineHealth = self.engineHealth*self.EngineHPMult
		self.Unbreakable = false
	else
		self.Unbreakable = true
	end
	
	if self.aircraft.Unbreakable then
		self.Unbreakable = true
	end	
	
	self.BaseHealth=self.engineHealth
	
	self.valid = true
end

function ENT:Think()
	if !self.valid then return end

	self.HealthScale = self.engineHealth/self.BaseHealth
	self.RPMSCL = self.engineRpm/self.MaxRPM
	local crt = CurTime()
	local frt = FrameTime()
	if self.aircraft.active and self.engineHealth > 0 then	
		self.engineRpm = math.Clamp(self.engineRpm+(self.aircraft.StartSpd+1)*30*frt, 0, self.MaxRPM+(self.MaxRPM*(self.HealthScale-1))/math.random(2,3))	
		if hvap.aircraft.cvars.fuelenable:GetInt() == 1 then
			self.FuelSub = ((self.RPMSCL)+(1-self.HealthScale)*10)*self.Consumption
		end
		if self.Smoking and !self.Burning and self:WaterLevel() == 0 then
			self:CreateSmoke()
		end
		self:CreateEffect()
	else
		self.engineRpm = math.Clamp(self.engineRpm-(self.aircraft.StartSpd+1)*18*frt, 0, self.MaxRPM)
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
	
	self.enginePower = math.Clamp(self.RPMSCL*self.Power+(self.Power*(self.HealthScale-1)/10), 0, self.Power)		
	self:NextThink(crt+0.0512)

	return true
end

function ENT:DamageEngine(dmg)
	if self.Disabled or self.Unbreakable then return end
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
	if self.Unbreakable then return end
	if self.SmokePos and self:IsValid() then
		local ed=EffectData()
		local colmod = (math.random(169,171)*self.HealthScale)
		ed:SetEntity(self.aircraft)
		ed:SetOrigin(self:LocalToWorld(self.SmokePos))
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
