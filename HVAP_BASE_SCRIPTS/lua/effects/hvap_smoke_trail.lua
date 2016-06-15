
AddCSLuaFile()

function EFFECT:Init( data )
	self.Fancy = !tobool(LocalPlayer():GetInfo("hvap_cl_air_esmokeeffect"))
	if self.Fancy then return end
	local Ent = data:GetEntity()
	local Pos = data:GetOrigin()
	if !Ent:IsValid() then return end	
	local Col = data:GetColor()
	local Scale = data:GetScale()
	local Vel = Ent:GetVelocity()	
	local Vell = Vel:Length()/512
	local mul = Vell/Scale	
	
	local emitter = ParticleEmitter( Pos )

	for i = 1,math.Clamp(mul, 1,16) do

		local particle = emitter:Add( "particle/smokesprites_000"..math.random(1,9), Pos)

		if (particle) then
			particle:SetVelocity(Vel/2-Ent:GetForward()*(Vell+160))
			particle:SetLifeTime(0) 
			particle:SetDieTime(2.56+Scale*1.92) 
			particle:SetStartAlpha(20*Scale+20)
			particle:SetEndAlpha(0)
			particle:SetStartSize(32*Scale+8)
			particle:SetEndSize(128*Scale+4)
			particle:SetAngles( Angle(0,0,0) )
			particle:SetAngleVelocity( Angle(0,-.1,0) ) 
			particle:SetRoll(math.Rand( 0, 360 ))
			particle:SetColor(Col, Col, Col, 255)
			particle:SetAirResistance(4)
			particle:SetCollide(true)
			particle:SetBounce(0)
		end
	end

	emitter:Finish()
		
end

function EFFECT:Think()		
	return false
end

function EFFECT:Render()

end
