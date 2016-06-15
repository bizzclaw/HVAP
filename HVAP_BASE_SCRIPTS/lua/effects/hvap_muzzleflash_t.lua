
AddCSLuaFile()

function EFFECT:Init(data)
	
	self.Ent = data:GetEntity()
	self.Fwd = data:GetNormal()
	self.Pos = data:GetOrigin()
	self.Scl = data:GetScale()
	self.Siz = math.Clamp(data:GetRadius(),0 , 10)
	self.Smoke = tobool(LocalPlayer():GetInfo("hvap_cl_air_gsmokeeffect"))
	if !self.Ent:IsValid() then return end
	self.sounds = self.Ent.Sounds

	local ply = LocalPlayer()
	local dist = self.Pos:Distance(ply:GetPos())
	
	if dist <= 3200 then
		sound.Play(self.sounds.Fire, self.Pos, 1, 1, 180)	
	elseif dist > 3200 and dist < 6400 then
		sound.Play(self.sounds.Close, self.Pos, 1, 1, 180)	
	elseif dist > 6400 and dist < 9600 then
		sound.Play(self.sounds.Near, self.Pos, 1, 1, 180)	
	elseif dist > 9600 and dist < 12800 then
		sound.Play(self.sounds.Far, self.Pos, 1, 1, 180)	
	elseif dist > 12800 then
		sound.Play(self.sounds.Distant, self.Pos, 1, 1, 180)	
	end
	
	self.Col = 64+180/self.Scl
	
	local emitter = ParticleEmitter(self.Ent:GetPos())
		if self.Smoke then
			local particle = emitter:Add("sprites/heatwave", self.Pos)
			particle:SetVelocity(32*self.Fwd + 2*VectorRand())
			particle:SetDieTime(math.Rand(0.128,0.256))
			particle:SetStartSize(math.random(16,24)*self.Scl+16)
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(180,480))
			particle:SetRollDelta(math.Rand(-1,1))
			particle:SetAirResistance(160)
			
			for i = 1, 2 do
				local particle = emitter:Add("particle/smokesprites_000"..math.random(1,9), self.Pos)
				particle:SetVelocity(100*(1.6)*self.Fwd)
				particle:SetDieTime(math.Rand(1.28,1.92)+1.28*self.Scl+0.2)
				particle:SetStartAlpha(math.Rand(30,38)+6.144*self.Scl)
				particle:SetEndAlpha(0)
				particle:SetStartSize(math.random(1,1.92)*6.144*self.Scl+1)
				particle:SetEndSize(math.Rand(8,10)*self.Siz+2.56*self.Scl)
				particle:SetRoll(math.Rand(180,480))
				particle:SetRollDelta(math.Rand(-3,3))
				particle:SetColor(self.Col,self.Col,self.Col)
				particle:SetAirResistance(350)
			end
		end
	
		local particle = emitter:Add("effects/muzzleflash"..math.random(1,4), self.Pos+(self.Fwd*3))
		particle:SetVelocity((self.Fwd*80))
		particle:SetDieTime(0.08)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(self.Siz*1.92-3.2)
		particle:SetEndSize(self.Siz*2.56-2)
		particle:SetRoll(math.Rand(180,480))
		particle:SetRollDelta(math.Rand(-1,1))
		particle:SetColor(255,255,255)

	emitter:Finish()

end

function EFFECT:Think()		
	return false
end

function EFFECT:Render()
end