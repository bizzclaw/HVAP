AddCSLuaFile( "hvap_rocket_trail.lua" )

function EFFECT:Init( data )
	self.Ent = data:GetEntity()
	self.Pos = data:GetOrigin()
	self.Scale = data:GetScale()
	self.DirVec = data:GetNormal()
	
	if !self.Ent:IsValid() then return end
	
	self.Emitter = ParticleEmitter( self.Pos )
		
	local Smoke = self.Emitter:Add( "effects/fire_cloud"..math.random(1, 2), self.Pos )
	if (Smoke) then
		Smoke:SetVelocity( self.DirVec + VectorRand():GetNormalized() )
		Smoke:SetDieTime( math.Rand( 0.1 , 0.192 ) )
		Smoke:SetStartAlpha( math.Rand( 64, 76 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( self.Scale/3.2 )
		Smoke:SetEndSize( self.Scale/1.6 )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 128 ) 			 
		Smoke:SetGravity( Vector( 0,0,-100 ) )
		Smoke:SetColor( 255,255,255 )
	end

	local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
	if (Smoke) then
		Smoke:SetVelocity( self.DirVec + VectorRand():GetNormalized() )
		Smoke:SetDieTime( math.Rand( 1 , 1.92 ) )
		Smoke:SetStartAlpha( math.Rand( 60, 76 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( self.Scale/2 )
		Smoke:SetEndSize( self.Scale*2.56 )
		Smoke:SetRoll( math.Rand(180,480) )
		Smoke:SetRollDelta( math.Rand(-1,1) )	
		Smoke:SetAirResistance( 128 ) 			 
		Smoke:SetGravity( Vector( 0,0,-100 ) )			
		Smoke:SetColor( 110,110,112 )
	end

	self.Emitter:Finish()
		
end

function EFFECT:Think()		
	return false
end

function EFFECT:Render()
end