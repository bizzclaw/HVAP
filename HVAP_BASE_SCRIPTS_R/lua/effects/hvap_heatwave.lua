AddCSLuaFile( "hvap_heatwave.lua" )

function EFFECT:Init( data )
	local Ent = data:GetEntity()
	local Pos = data:GetOrigin()
	local Mag = data:GetMagnitude()
	local Col = data:GetColor()
	local Scale = data:GetScale()
	
	if !Ent:IsValid() then return end
	
	local emitter = ParticleEmitter( Pos )
	
	for i = 1,math.Clamp(16*Scale+1, 1,24) do

		local particle = emitter:Add( "sprites/heatwave", Ent:LocalToWorld(Pos))
		 
		if particle == nil then particle = emitter:Add( "sprites/heatwave", Pos + Vector(   math.random(-3,8),math.random(-27,-25),math.random(-3,0) ) ) end

		if (particle) then
			particle:SetVelocity(Ent:GetVelocity()+Ent:GetForward()*(-1200)*Mag)
			particle:SetLifeTime(0) 
			particle:SetDieTime(0.256) 
			particle:SetStartSize(20*Scale)
			particle:SetEndSize(10*Scale)
			particle:SetAngles( Angle(0,0,0) )
			particle:SetAngleVelocity( Angle(0,-.1,0) ) 
			particle:SetRoll(math.Rand( 0, 360 ))
			particle:SetAirResistance(1)
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