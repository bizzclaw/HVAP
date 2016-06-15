
AddCSLuaFile()

function EFFECT:Init(data)
	self.Ent = data:GetEntity() or nil
	self.EffectSize = data:GetMagnitude()
	self.DirVec = data:GetNormal()
	self.Pos = data:GetOrigin()
	self.Size = data:GetScale()/10
	self.Normal = data:GetStart()
	self.Emitter = ParticleEmitter( self.Pos )
	self.Fancy = tobool(LocalPlayer():GetInfo("hvap_cl_air_bulleteffect"))
	self:Explode()
	sound.Play("HVAP.Bullet.Explode.Medium", self.Pos, 1, 1, 90)	
end
 
function EFFECT:Explode()
	
	for i=0, self.Size do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,100*self.Size) + VectorRand():GetNormalized()*64*self.Size )
		Smoke:SetDieTime( math.Rand( 0.70 , 1.2 )*self.Size/2 )
		Smoke:SetStartAlpha( math.Rand( 80, 100 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 15*self.Size )
		Smoke:SetEndSize( 35*self.Size )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Size, math.Rand(-70, 70) * self.Size, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 130,125,115 )
		end
	end
	
	if self.Fancy then
		for i=0, self.Size/2 do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( self.DirVec * 64 * self.Size )
			Smoke:SetDieTime( math.Rand( 2.56 , 3 ) )
			Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 8*self.Size )
			Smoke:SetEndSize( 16*self.Size )
			Smoke:SetRoll( math.Rand(180,480) )
			Smoke:SetRollDelta( math.Rand(-1,1) )	
			Smoke:SetAirResistance( 1024 ) 			 
			Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Size, math.Rand(-70, 70) * self.Size, math.Rand(0, -100) ) ) 			
			Smoke:SetColor( 30,25,15 )
			end
		end	
		
		for i=0, self.Size do -- dust
			local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 0,64*self.Size) + VectorRand():GetNormalized()*5*self.Size )
			Smoke:SetDieTime( math.Rand( 1.6 , 1.92 ) )
			Smoke:SetStartAlpha( 192 )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 18*self.Size )
			Smoke:SetEndSize( 32*self.Size )
			Smoke:SetRoll( math.Rand(150, 360) )
			Smoke:SetRollDelta( math.Rand(-2, 2) )			
			Smoke:SetAirResistance( 192 ) 			 
			Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Size, math.Rand(-50, 50) * self.Size, math.Rand(0, -100) ) ) 			
			Smoke:SetColor( 105,100,90 )
			end
		end

		for i=0, self.Size do -- particles
			local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
			if (Debris) then
			Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Size) + VectorRand():GetNormalized() * 192*self.Size )
			Debris:SetDieTime( math.random( .4, 1.28) )
			Debris:SetStartAlpha( 255 )
			Debris:SetEndAlpha( 0 )
			Debris:SetStartSize( math.random(2,4)*self.Size )
			Debris:SetRoll( math.Rand(0, 360) )
			Debris:SetRollDelta( math.Rand(-5, 5) )			
			Debris:SetAirResistance( 50 ) 			 			
			Debris:SetColor( 105,100,90 )
			Debris:SetGravity( Vector( 0, 0, -600) ) 
			Debris:SetCollide( true )
			Debris:SetBounce( 1 )			
			end
		end
	end
	
	for i=0,4 do -- flash
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
		Flash:SetVelocity( self.DirVec*32*i )
		Flash:SetAirResistance( 200 )
		Flash:SetDieTime( 0.2 )
		Flash:SetStartAlpha( 255 )
		Flash:SetEndAlpha( 0 )
		Flash:SetStartSize( math.Rand( 48, 64 )*self.Size )
		Flash:SetEndSize( 0 )
		Flash:SetRoll( math.Rand(180,480) )
		Flash:SetRollDelta( math.Rand(-1,1) )
		Flash:SetColor(255,255,255)	
		end
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
