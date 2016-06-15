
AddCSLuaFile()

function EFFECT:Init(data)

	self.Pos 		= data:GetOrigin()
	self.Scale 		= math.Clamp(data:GetScale(), 8, 32)
	self.Emitter 		= ParticleEmitter( self.Pos )	
	local ply = LocalPlayer()
	local dist = self.Pos:Distance(ply:GetPos())
	self.Fancy = tobool(ply:GetInfo("hvap_cl_air_bulleteffect"))
	
	if dist <= 6000 then
		sound.Play("HVAP.Bullet.Explode.Large.Near", self.Pos, 1, 1, 180)	
	elseif dist > 6000 and dist < 9000 then
		sound.Play("HVAP.Bullet.Explode.Large.Close", self.Pos, 1, 1, 180)	
	else 
		sound.Play("HVAP.Bullet.Explode.Large.Far", self.Pos, 1, 1, 180)	
	end
	util.Decal( "Scorch", self.Pos, self.Pos-(self:GetUp()*-64) )		


	for i=0, self.Scale*0.8 do
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( VectorRand():GetNormalized()*self.Scale*math.Rand(8, 12) )
		Smoke:SetDieTime( math.Rand( 1 , 2 ) )
		Smoke:SetStartAlpha( math.Rand( 80, 128 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 32*self.Scale )
		Smoke:SetEndSize( 80*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 2 ) 			 
		Smoke:SetGravity( Vector( 0, 0, -2 ) ) 			
		Smoke:SetColor( 100,100,100 )
		end
	end	
	
	if self.Fancy then 
		for i=0, 3 do 
			local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
			if (Flash) then
			Flash:SetVelocity( VectorRand():GetNormalized()*self.Scale*math.Rand(1, 1.92) )
			Flash:SetAirResistance( 200 )
			Flash:SetDieTime( 0.4 )
			Flash:SetStartAlpha( 255 )
			Flash:SetEndAlpha( 0 )
			Flash:SetStartSize( math.Rand( 80, 100 )*self.Scale*0.8 )
			Flash:SetEndSize( 0 )
			Flash:SetRoll( math.Rand(180,480) )
			Flash:SetRollDelta( math.Rand(-1,1) )
			Flash:SetColor(255,255,255)	
			end
		end
		
		for i=0, 3 do 
			local Compress = self.Emitter:Add("sprites/heatwave", self.Pos)
			if (Compress) then
			Compress:SetVelocity( VectorRand():GetNormalized()*self.Scale*math.Rand(1, 1.92) )
			Compress:SetDieTime(math.Rand(0.64,1.28))
			Compress:SetStartSize(math.random(64,128)+10*self.Scale)
			Compress:SetEndSize(0)
			Compress:SetRoll(math.Rand(180,480))
			Compress:SetRollDelta(math.Rand(-1,1))
			Compress:SetAirResistance(160)
			end
		end	
		
		for i=0, 2 do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( VectorRand()*self.Scale*math.Rand(2.56, 3) )
			Smoke:SetDieTime( math.Rand( .8 , 1.28 ) )
			Smoke:SetStartAlpha( math.Rand( 190, 225 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 32*self.Scale )
			Smoke:SetEndSize( 80*self.Scale )
			Smoke:SetRoll( math.Rand(180,480) )
			Smoke:SetRollDelta( math.Rand(-1,1) )	
			Smoke:SetAirResistance( 16 ) 			 
			Smoke:SetGravity( Vector( 0, 0, -1 )  ) 			
			Smoke:SetColor( 28,25,28 )
			end
		end			
		
		for i=0, 4 do -- remain smoke small
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( VectorRand()*self.Scale*math.Rand(2.56, 3) )
			Smoke:SetDieTime( math.Rand( 1 , 1.92 ) )
			Smoke:SetStartAlpha( math.Rand( 190, 225 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 2*self.Scale )
			Smoke:SetEndSize( 6*self.Scale )
			Smoke:SetRoll( math.Rand(180,480) )
			Smoke:SetRollDelta( math.Rand(-1,1) )	
			Smoke:SetAirResistance( 16 ) 			 
			Smoke:SetGravity( Vector( 0, 0, -1 )  ) 			
			Smoke:SetColor( 28,25,28 )
			end
		end		
	end

	for i=0, 10*self.Scale do 
		local particle = self.Emitter:Add( "effects/spark", self.Pos ) 
		if (particle) then 
		particle:SetVelocity( VectorRand():GetNormalized()*self.Scale*math.Rand(64, 128) ) 
		particle:SetDieTime( math.Rand(1.92, 3.2) ) 				 
		particle:SetStartAlpha( 255 )  				 
		particle:SetStartSize( math.Rand(16, 20)) 
		particle:SetEndSize( 1 ) 				 
		particle:SetRoll( math.Rand(0, 360) ) 
		particle:SetRollDelta( math.Rand(-5, 5) ) 				 
		particle:SetAirResistance( 1 ) 
		particle:SetGravity( Vector( 0, 0, -600 ) ) 
		end 	
	end 	

end

function EFFECT:Think( )
return false
end

function EFFECT:Render()
end
