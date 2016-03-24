AddCSLuaFile( "hvap_smoke_trail.lua" )

function EFFECT:Init( data )
	local Ent = data:GetEntity()
	local Pos = data:GetOrigin()
	local Mag = data:GetMagnitude()
	local Col = data:GetColor()
	local Scale = data:GetScale()

	if !Ent:IsValid() then return end
	
	local emitter = ParticleEmitter( Pos )
	
	for i = 1,math.Clamp(16*Scale+1, 1,24) do

		local particle = emitter:Add( "particle/smokesprites_000"..math.random(1,9), Ent:LocalToWorld(Pos))
		 
		if particle == nil then particle = emitter:Add( "particle/smokesprites_000"..math.random(1,9), Pos + Vector(   math.random(-3,8),math.random(-27,-25),math.random(-3,0) ) ) end

		if (particle) then
			particle:SetVelocity(Ent:GetVelocity()+Ent:GetForward()*(-200))
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