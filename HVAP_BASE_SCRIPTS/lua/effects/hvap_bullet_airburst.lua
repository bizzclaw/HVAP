
AddCSLuaFile()

function EFFECT:Init(data)
	self.EffectSize = data:GetMagnitude()
	self.DirVec = data:GetNormal()
	self.Pos = data:GetOrigin()
	self.Size = data:GetScale()/10
	self.Emitter = ParticleEmitter( self.Pos )
	self.Fancy = tobool(LocalPlayer():GetInfo("hvap_cl_air_bulleteffect"))
	local ply = LocalPlayer()

	if self.Size >= 5 then 
		self:Flak()
		local dist = self.Pos:Distance(ply:GetPos())
		if dist <= 3200 then
			sound.Play("HVAP.Bullet.Explode.Flak.Close", self.Pos, 1, 1, 120)		
		else 
			sound.Play("HVAP.Bullet.Explode.Flak.Far", self.Pos, 1, 1, 160)		
		end
	else
		self:Explode()
		sound.Play("HVAP.Bullet.Explode.Small", self.Pos)		
	end
end
 
function EFFECT:Explode()
	
	for i=0, 2*self.Size do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,500*self.Size) + VectorRand():GetNormalized()*64*self.Size )
		Smoke:SetDieTime( math.Rand( 1.28 , 2.56 ) )
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
		for i=0, 2*self.Size do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( self.DirVec * 64 * self.Size )
			Smoke:SetDieTime( math.Rand( 1.92 , 3.8 ) )
			Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 8*self.Size )
			Smoke:SetEndSize( 32*self.Size )
			Smoke:SetRoll( math.Rand(180,480) )
			Smoke:SetRollDelta( math.Rand(-1,1) )	
			Smoke:SetAirResistance( 1024 ) 			 
			Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Size, math.Rand(-70, 70) * self.Size, math.Rand(0, -100) ) ) 			
			Smoke:SetColor( 30,25,15 )
			end
		end	

		for i=0, 3*self.Size do -- particles
			local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
			if (Debris) then
			Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Size) + VectorRand():GetNormalized() * 192*self.Size )
			Debris:SetDieTime( math.random( .8, 1.92) )
			Debris:SetStartAlpha( 255 )
			Debris:SetEndAlpha( 0 )
			Debris:SetStartSize( math.random(2,4) )
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

	for i=0, 2*self.Size do -- spark
		local particle = self.Emitter:Add( "effects/spark", self.Pos ) 
		if (particle) then 
			particle:SetVelocity( ((self.DirVec*0.75)+VectorRand()) * math.Rand(48, 480)*2 ) 
			particle:SetDieTime( math.Rand(1, 2) ) 				 
			particle:SetStartAlpha( 255 )  				 
			particle:SetStartSize( math.Rand(6, 8) ) 
			particle:SetEndSize( 0 ) 				 
			particle:SetRoll( math.Rand(0, 360) ) 
			particle:SetRollDelta( math.Rand(-5, 5) ) 				 
			particle:SetAirResistance( 20 ) 
			particle:SetGravity( Vector( 0, 0, -300 ) ) 
		end 		
	end 
	
	for i=0,1 do -- flash
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
		Flash:SetVelocity( self.DirVec*64 )
		Flash:SetAirResistance( 200 )
		Flash:SetDieTime( 0.2 )
		Flash:SetStartAlpha( 255 )
		Flash:SetEndAlpha( 0 )
		Flash:SetStartSize( math.Rand( 64, 80 )*self.Size )
		Flash:SetEndSize( 0 )
		Flash:SetRoll( math.Rand(180,480) )
		Flash:SetRollDelta( math.Rand(-1,1) )
		Flash:SetColor(255,255,255)	
		end
	end
end

function EFFECT:Flak()
	
	for i=0, 3*self.Size do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,500*self.Size) + VectorRand():GetNormalized()*64*self.Size )
		Smoke:SetDieTime( math.Rand( 1.28 , 2.56 ) )
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
		for i=0, 2*self.Size do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( self.DirVec * 64 * self.Size )
			Smoke:SetDieTime( math.Rand( 1.92 , 3.8 ) )
			Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 8*self.Size )
			Smoke:SetEndSize( 32*self.Size )
			Smoke:SetRoll( math.Rand(180,480) )
			Smoke:SetRollDelta( math.Rand(-1,1) )	
			Smoke:SetAirResistance( 1024 ) 			 
			Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Size, math.Rand(-70, 70) * self.Size, math.Rand(0, -100) ) ) 			
			Smoke:SetColor( 30,25,15 )
			end
		end	

		for i=0, 6*self.Size do -- particles
			local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
			if (Debris) then
			Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Size) + VectorRand():GetNormalized() * 192*self.Size )
			Debris:SetDieTime( math.random( .8, 1.92) )
			Debris:SetStartAlpha( 255 )
			Debris:SetEndAlpha( 0 )
			Debris:SetStartSize( math.random(2,4) )
			Debris:SetRoll( math.Rand(0, 360) )
			Debris:SetRollDelta( math.Rand(-5, 5) )			
			Debris:SetAirResistance( 50 ) 			 			
			Debris:SetColor( 105,100,90 )
			Debris:SetGravity( Vector( 0, 0, -600) ) 
			Debris:SetCollide( true )
			Debris:SetBounce( 1 )			
			end
		end

		for i=0, 8*self.Size do -- spark
			local particle = self.Emitter:Add( "effects/spark", self.Pos ) 
			if (particle) then 
				particle:SetVelocity( ((self.DirVec*0.75)+VectorRand()) * math.Rand(48, 480)*2 ) 
				particle:SetDieTime( math.Rand(1, 2) ) 				 
				particle:SetStartAlpha( 255 )  				 
				particle:SetStartSize( math.Rand(6, 8) ) 
				particle:SetEndSize( 0 ) 				 
				particle:SetRoll( math.Rand(0, 360) ) 
				particle:SetRollDelta( math.Rand(-5, 5) ) 				 
				particle:SetAirResistance( 20 ) 
				particle:SetGravity( Vector( 0, 0, -300 ) ) 
			end 		
		end 
	end
	
	for i=0,1 do -- flash
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
		Flash:SetVelocity( self.DirVec*64 )
		Flash:SetAirResistance( 200 )
		Flash:SetDieTime( 0.2 )
		Flash:SetStartAlpha( 255 )
		Flash:SetEndAlpha( 0 )
		Flash:SetStartSize( math.Rand( 64, 80 )*self.Size )
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
