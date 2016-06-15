
AddCSLuaFile()

local mats={		
	[MAT_PLASTIC]		=	1,
	[MAT_TILE]			=	1,
	[MAT_CONCRETE]		=	1,
	[MAT_WARPSHIELD]	=	1,
	[MAT_DEFAULT]		=	1,
	[MAT_EGGSHELL]		=	1,

	[MAT_DIRT]			=	2,
	[MAT_GRASS]			=	2,
	[MAT_SLOSH]			=	2,
	
	[MAT_ALIENFLESH]	=	3,
	[MAT_ANTLION]		=	3,
	[MAT_BLOODYFLESH]	=	3,
	[MAT_FLESH]			=	3,
	[45]				=	3,
	[88]				=	3,

	[MAT_GLASS]			=	4,

	[MAT_METAL]			=	5,
	[MAT_CLIP]			=	5,
	[MAT_COMPUTER]		=	5,
	[MAT_VENT]			=	5,
	[MAT_GRATE]			=	5,
	
	[MAT_SAND]			=	6,
	
	[MAT_SNOW]			=	7,
	
	[83]				=	8,
	
	[MAT_WOOD]			=	9,
	[MAT_FOLIAGE]		=	9
}

local sounds={
	[1] = "HVAP.Bullet.Impact.Concrete",
	[2] = "HVAP.Bullet.Impact.Dirt",
	[3] = "HVAP.Bullet.Impact.Flesh",
	[4] = "HVAP.Bullet.Impact.Glass",
	[5] = "HVAP.Bullet.Impact.Metal",
	[6] = "HVAP.Bullet.Impact.Sand",
	[7] = "HVAP.Bullet.Impact.Snow",
	[8] = "HVAP.Bullet.Impact.Water",
	[9] = "HVAP.Bullet.Impact.Wood"
}

local decals={
	[1] = "Impact.Concrete",
	[2] = "ExplosiveGunshot",
	[3] = "Impact.BloodyFlesh",
	[4] = "Impact.Glass",
	[5] = "Impact.Metal",
	[6] = "Impact.Sand",
	[7] = "ExplosiveGunshot",
	[8] = "ExplosiveGunshot",
	[9] = "Impact.Wood"
}

function EFFECT:Init(data)
	self.Fancy = tobool(LocalPlayer():GetInfo("hvap_cl_air_bulleteffect"))
	self.Ent = data:GetEntity() or nil
	self.EffectSize = data:GetMagnitude()
	self.DirVec = data:GetNormal()
	self.Pos = data:GetOrigin()
	self.Size = data:GetScale()/10
	self.Normal = data:GetStart()
	self.Mat = math.ceil(data:GetSurfaceProp() or 1)
	self.Emitter 		= ParticleEmitter( self.Pos )

	if self.Ent:IsValid() and self.Ent.IsHVAPAircraft then
		self:Aircraft()
		sound.Play("HVAP.Bullet.Impact.Aircraft", self.Pos)	
		util.Decal( "ExplosiveGunshot", self.Pos-self.Normal, self.Pos+self.Normal )			
	elseif self.Ent:IsValid() and self.Ent.IsHVAPGround then
		self:Ground()
		if self.Size >= 90 then 
			sound.Play("HVAP.Bullet.Impact.Large.APHE", self.Pos, 1, 1, 160)	
		elseif self.Size > 45 then
			sound.Play("HVAP.Bullet.Impact.Medium.APHE", self.Pos, 1, 1, 150)	
		elseif self.Size >= 20 then
			sound.Play("HVAP.Bullet.Impact.Small.APHE", self.Pos, 1, 1, 140)	
		else
			sound.Play("HVAP.Bullet.Explode.Small.HE", self.Pos, 1, 1, 110)	
		end
		util.Decal( "ExplosiveGunshot", self.Pos-self.Normal, self.Pos+self.Normal )			
	else
		if	mats[self.Mat]==1 then	
			self:Concrete()
		elseif	mats[self.Mat]==2 then	
			self:Dirt()	
		elseif  mats[self.Mat]==3 then	
			self:Blood()	
		elseif	mats[self.Mat]==4 then	
			self:Glass()	
		elseif	mats[self.Mat]==5 then	
			self:Metal()
		elseif	mats[self.Mat]==6 then	
			self:Sand()	
		elseif	mats[self.Mat]==7 then	
			self:Snow()	
		elseif	mats[self.Mat]==8 then	
			self:Water()	
		elseif	mats[self.Mat]==9 then	
			self:Wood()
		else 							
			self:Generic()
		end
		sound.Play(sounds[mats[self.Mat]], self.Pos)	
		util.Decal( decals[mats[self.Mat]], self.Pos-self.Normal, self.Pos+self.Normal )
	end
end
 
function EFFECT:Concrete()
	
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
		for i=0, self.Size do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( self.DirVec * 64 * self.Size )
			Smoke:SetDieTime( math.Rand( 1.92 , 3.8 ) )
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
		
		for i=0, 2*self.Size do -- dust
			local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 0,64*self.Size) + VectorRand():GetNormalized()*5*self.Size )
			Smoke:SetDieTime( math.Rand( .6 , 1.28 ) )
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

		for i=0, 4*self.Size do -- particles
			local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
			if (Debris) then
			Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Size) + VectorRand():GetNormalized() * 192*self.Size )
			Debris:SetDieTime( math.random( .8, 1.92) )
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
	
	local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
	if (Flash) then
	Flash:SetVelocity( self.DirVec*64 )
	Flash:SetAirResistance( 200 )
	Flash:SetDieTime( 0.192 )
	Flash:SetStartAlpha( 255 )
	Flash:SetEndAlpha( 0 )
	Flash:SetStartSize( math.Rand( 24, 32 )*self.Size )
	Flash:SetEndSize( 0 )
	Flash:SetRoll( math.Rand(180,480) )
	Flash:SetRollDelta( math.Rand(-1,1) )
	Flash:SetColor(255,255,255)	
	end

end
 
function EFFECT:Dirt()

	for i=0, 2*self.Size do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,500*self.Size) + VectorRand():GetNormalized()*64*self.Size )
		Smoke:SetDieTime( math.Rand( 1.28 , 2 ) )
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
			Smoke:SetDieTime( math.Rand( 1.5 , 3 ) )
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

		for i=0, 3*self.Size do -- dust
			local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 0,64*self.Size) + VectorRand():GetNormalized()*5*self.Size )
			Smoke:SetDieTime( math.Rand( .6 , 1.28 ) )
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

		for i=0, 2*self.Size do -- particles
			local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
			if (Debris) then
			Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Size) + VectorRand():GetNormalized() * 192*self.Size )
			Debris:SetDieTime( math.random( .8, 1.92) )
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
	
	local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
	if (Flash) then
	Flash:SetVelocity( self.DirVec*64 )
	Flash:SetAirResistance( 200 )
	Flash:SetDieTime( 0.192 )
	Flash:SetStartAlpha( 255 )
	Flash:SetEndAlpha( 0 )
	Flash:SetStartSize( math.Rand( 24, 32 )*self.Size )
	Flash:SetEndSize( 0 )
	Flash:SetRoll( math.Rand(180,480) )
	Flash:SetRollDelta( math.Rand(-1,1) )
	Flash:SetColor(255,255,255)	
	end
end

function EFFECT:Blood()

	for i=0, 4 do
		// Some blood spray out front and the back
		local Spray = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Spray) then
			Spray:SetVelocity( (VectorRand():GetNormalized()*30*self.Size) )
			Spray:SetDieTime( math.Rand( 0.3 , 0.9 ) )
			Spray:SetStartAlpha( 100 )
			Spray:SetEndAlpha( 0 )
			Spray:SetStartSize( 15*self.Size )
			Spray:SetEndSize( 35*self.Size )
			Spray:SetRoll( math.Rand(150, 360) )
			Spray:SetRollDelta( math.Rand(-3, 3) )			
			Spray:SetAirResistance( 400 ) 			 		
			Spray:SetColor( 70,35,35 )
		end
	end

		// Some mist for effect
	for i=0, 3 do
		local Mist = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Mist) then
			Mist:SetVelocity( (VectorRand():GetNormalized()*30*self.Size) )
			Mist:SetDieTime( math.Rand( 0.3 , 1.5 ) )
			Mist:SetStartAlpha( 80 )
			Mist:SetEndAlpha( 0 )
			Mist:SetStartSize( 10*self.Size )
			Mist:SetEndSize( 30*self.Size )
			Mist:SetRoll( math.Rand(150, 360) )
			Mist:SetRollDelta( math.Rand(-2, 2) )			
			Mist:SetAirResistance( 300 ) 			 
			Mist:SetGravity( Vector( math.Rand(-50, 50) * self.Size, math.Rand(-50, 50) * self.Size, math.Rand(-100, -400) ) ) 			
			Mist:SetColor( 70,35,35 )
		end
	end

	if self.Fancy then
		for i=0, 2 do
			local Chunks = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
			if (Chunks) then
				Chunks:SetVelocity ((VectorRand():GetNormalized()*50*self.Size) )
				Chunks:SetDieTime( math.random( 0.3, 0.8) )
				Chunks:SetStartAlpha( 255 )
				Chunks:SetEndAlpha( 0 )
				Chunks:SetStartSize( 3*self.Size )
				Chunks:SetEndSize( 3*self.Size )
				Chunks:SetRoll( math.Rand(0, 360) )
				Chunks:SetRollDelta( math.Rand(-5, 5) )			
				Chunks:SetAirResistance( 30 ) 			 			
				Chunks:SetColor( 70,35,35 )
				Chunks:SetGravity( Vector( 0, 0, -600) ) 
				Chunks:SetCollide( true )
				Chunks:SetBounce( 0.01 )			
			end
		end

			// Some dust kickup like in the movies
		for i=0, 2 do
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.DirVec*math.random( 10,30*self.Size) + VectorRand():GetNormalized()*120*self.Size )
				Smoke:SetDieTime( math.Rand( 0.5 , 3 ) )
				Smoke:SetStartAlpha( math.Rand( 40, 50 ) )
				Smoke:SetEndAlpha( 0 )
				Smoke:SetStartSize( 20*self.Size )
				Smoke:SetEndSize( 30*self.Size )
				Smoke:SetRoll( math.Rand(150, 360) )
				Smoke:SetRollDelta( math.Rand(-1, 1) )			
				Smoke:SetAirResistance( 200 ) 			 
				Smoke:SetColor( 100,100,100 )
			end
		end
	end
end

function EFFECT:Glass()
	for i=0, 3*self.Size do
		local Debris = self.Emitter:Add( "effects/fleck_glass"..math.random(1,3), self.Pos )
		if (Debris) then
			Debris:SetVelocity ( VectorRand():GetNormalized() * 100*self.Size )
			Debris:SetDieTime( math.random( 0.5, 1) )
			Debris:SetStartAlpha( 255 )
			Debris:SetEndAlpha( 0 )
			Debris:SetStartSize( math.random(2,4*self.Size) )
			Debris:SetRoll( math.Rand(0, 360) )
			Debris:SetRollDelta( math.Rand(-15, 15) )			
			Debris:SetAirResistance( 50 ) 			 			
			Debris:SetColor( 200,200,200 )
			Debris:SetGravity( Vector( 0, 0, -600) ) 	
		end
	end
end

function EFFECT:Metal()

	for i=0, self.Size do -- main smoke
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
		for i=0, 1.28*self.Size do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.DirVec * 64 * self.Size )
				Smoke:SetDieTime( math.Rand( 1.92 , 3.8 ) )
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
	end
	
	for i=0,1 do -- flash
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
			Flash:SetVelocity( self.DirVec*64 )
			Flash:SetAirResistance( 200 )
			Flash:SetDieTime( 0.2 )
			Flash:SetStartAlpha( 255 )
			Flash:SetEndAlpha( 0 )
			Flash:SetStartSize( math.Rand( 24, 32 )*self.Size )
			Flash:SetEndSize( 0 )
			Flash:SetRoll( math.Rand(180,480) )
			Flash:SetRollDelta( math.Rand(-1,1) )
			Flash:SetColor(255,255,255)	
		end
	end
	 
	for i=0, 2*self.Size do -- spark
		local particle = self.Emitter:Add( "effects/spark", self.Pos ) 
		if (particle) then 
			particle:SetVelocity( ((self.DirVec*0.75)+VectorRand()) * math.Rand(32, 320)*self.Size ) 
			particle:SetDieTime( math.Rand(0.42, 0.8) ) 				 
			particle:SetStartAlpha( 255 )  				 
			particle:SetStartSize( math.Rand(6, 8)*self.Size ) 
			particle:SetEndSize( 0 ) 				 
			particle:SetRoll( math.Rand(0, 360) ) 
			particle:SetRollDelta( math.Rand(-5, 5) ) 				 
			particle:SetAirResistance( 20 ) 
			particle:SetGravity( Vector( 0, 0, -600 ) ) 
		end 		
	end 
end

function EFFECT:Sand()
	if self.Fancy then
		for i=0, 3*self.Size do
			local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.DirVec * math.random( 20,500*self.Size) + VectorRand():GetNormalized()*100*self.Size )
				Smoke:SetDieTime( math.Rand( 1 , 3 ) )
				Smoke:SetStartAlpha( math.Rand( 60, 80 ) )
				Smoke:SetEndAlpha( 0 )
				Smoke:SetStartSize( 15*self.Size )
				Smoke:SetEndSize( 30*self.Size )
				Smoke:SetRoll( math.Rand(150, 360) )
				Smoke:SetRollDelta( math.Rand(-2, 2) )			
				Smoke:SetAirResistance( 300 ) 			 
				Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Size, math.Rand(-70, 70) * self.Size, math.Rand(0, -100) ) ) 			
				Smoke:SetColor( 120,110,90 )
			end
		end
	end

	for i=0, self.Size do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 20,400*self.Size) + VectorRand():GetNormalized()*20*self.Size )
			Smoke:SetDieTime( math.Rand( 0.5 , 1.5 ) )
			Smoke:SetStartAlpha( 150 )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 20*self.Size )
			Smoke:SetEndSize( 30*self.Size )
			Smoke:SetRoll( math.Rand(150, 360) )
			Smoke:SetRollDelta( math.Rand(-2, 2) )			
			Smoke:SetAirResistance( 400 ) 			 
			Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Size, math.Rand(-50, 50) * self.Size, math.Rand(0, -100) ) ) 			
			Smoke:SetColor( 120,110,90 )
		end
	end

end

function EFFECT:Snow()

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
			Smoke:SetColor( 200,205,210 )
		end
	end
	
	if self.Fancy then
		for i=0, self.Size do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.DirVec * 64 * self.Size )
				Smoke:SetDieTime( math.Rand( 1.92 , 3.8 ) )
				Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
				Smoke:SetEndAlpha( 0 )
				Smoke:SetStartSize( 8*self.Size )
				Smoke:SetEndSize( 16*self.Size )
				Smoke:SetRoll( math.Rand(180,480) )
				Smoke:SetRollDelta( math.Rand(-1,1) )	
				Smoke:SetAirResistance( 1024 ) 			 
				Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Size, math.Rand(-70, 70) * self.Size, math.Rand(0, -100) ) ) 			
				Smoke:SetColor( 40,35,25 )
			end
		end	

		for i=0, 2*self.Size do -- dust
			local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.DirVec * math.random( 0,64*self.Size) + VectorRand():GetNormalized()*5*self.Size )
				Smoke:SetDieTime( math.Rand( .6 , 1.28 ) )
				Smoke:SetStartAlpha( 192 )
				Smoke:SetEndAlpha( 0 )
				Smoke:SetStartSize( 18*self.Size )
				Smoke:SetEndSize( 32*self.Size )
				Smoke:SetRoll( math.Rand(150, 360) )
				Smoke:SetRollDelta( math.Rand(-2, 2) )			
				Smoke:SetAirResistance( 192 ) 			 
				Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Size, math.Rand(-50, 50) * self.Size, math.Rand(0, -100) ) ) 			
				Smoke:SetColor( 205,200,190 )
			end
		end

		for i=0, 2*self.Size do -- particles
			local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
			if (Debris) then
				Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Size) + VectorRand():GetNormalized() * 192*self.Size )
				Debris:SetDieTime( math.random( .8, 1.92) )
				Debris:SetStartAlpha( 255 )
				Debris:SetEndAlpha( 0 )
				Debris:SetStartSize( math.random(2,4)*self.Size )
				Debris:SetRoll( math.Rand(0, 360) )
				Debris:SetRollDelta( math.Rand(-5, 5) )			
				Debris:SetAirResistance( 50 ) 			 			
				Debris:SetColor( 205,200,190 )
				Debris:SetGravity( Vector( 0, 0, -600) ) 
				Debris:SetCollide( true )
				Debris:SetBounce( 1 )			
			end
		end
	end
end

function EFFECT:Water()

end

function EFFECT:Wood()

	for i=0, 2*self.Size do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 20,256*self.Size) + VectorRand():GetNormalized()*64*self.Size )
			Smoke:SetDieTime( math.Rand( 1.28 , 2.56 ) )
			Smoke:SetStartAlpha( math.Rand( 80, 100 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 15*self.Size )
			Smoke:SetEndSize( 35*self.Size )
			Smoke:SetRoll( math.Rand(150, 360) )
			Smoke:SetRollDelta( math.Rand(-2, 2) )			
			Smoke:SetAirResistance( 300 ) 			 
			Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Size, math.Rand(-70, 70) * self.Size, math.Rand(0, -100) ) ) 			
			Smoke:SetColor( 222,184,135 )
		end
	end
	if self.Fancy then
		for i=0, self.Size do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.DirVec * 64 * self.Size )
				Smoke:SetDieTime( math.Rand( 1.92 , 3.8 ) )
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

		for i=0, self.Size do
			local Debris = self.Emitter:Add( "effects/fleck_wood"..math.random(1,2), self.Pos+self.DirVec )
			if (Debris) then
				Debris:SetVelocity ( self.DirVec + VectorRand():GetNormalized() * 300*self.Size )
				Debris:SetDieTime( math.random( 0.75, 1) )
				Debris:SetStartAlpha( 255 )
				Debris:SetEndAlpha( 0 )
				Debris:SetStartSize( math.random(3,6*self.Size) )
				Debris:SetRoll( math.Rand(0, 360) )
				Debris:SetRollDelta( math.Rand(-5, 5) )			
				Debris:SetAirResistance( 50 ) 			 			
				Debris:SetColor( 90,85,75 )
				Debris:SetGravity( Vector( 0, 0, -600) ) 
				Debris:SetCollide( true )
				Debris:SetBounce( 0.5 )			
			end
		end
	end
end

function EFFECT:Aircraft()

	for i=0, self.Size do -- remain smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * 64 * self.Size )
			Smoke:SetDieTime( math.Rand( 2.56 , 4.5 ) )
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
	if self.Fancy then
		for i=0,1 do -- flash
			local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
			if (Flash) then
				Flash:SetVelocity( self.DirVec*64 )
				Flash:SetAirResistance( 200 )
				Flash:SetDieTime( 0.2 )
				Flash:SetStartAlpha( 255 )
				Flash:SetEndAlpha( 0 )
				Flash:SetStartSize( math.Rand( 32, 45 )*self.Size )
				Flash:SetEndSize( 0 )
				Flash:SetRoll( math.Rand(180,480) )
				Flash:SetRollDelta( math.Rand(-1,1) )
				Flash:SetColor(255,255,255)	
			end
		end
	end
end

function EFFECT:Ground()
	if self.Fancy then
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

		for i=0, 1.5*self.Size do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.DirVec * 64 * self.Size )
				Smoke:SetDieTime( math.Rand( 1.92 , 3.8 ) )
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
	end
	
	for i=0,1 do -- flash
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
			Flash:SetVelocity( self.DirVec*64 )
			Flash:SetAirResistance( 200 )
			Flash:SetDieTime( 0.2 )
			Flash:SetStartAlpha( 255 )
			Flash:SetEndAlpha( 0 )
			Flash:SetStartSize( math.Rand( 32, 48 )*self.Size )
			Flash:SetEndSize( 0 )
			Flash:SetRoll( math.Rand(180,480) )
			Flash:SetRollDelta( math.Rand(-1,1) )
			Flash:SetColor(255,255,255)	
		end
	end
	 
	for i=0, 8*self.Size do -- spark
		local particle = self.Emitter:Add( "effects/spark", self.Pos ) 
		if (particle) then 
			particle:SetVelocity( ((self.DirVec*0.75)+VectorRand()) * math.Rand(32, 320)*self.Size ) 
			particle:SetDieTime( math.Rand(0.512, 1.28) ) 				 
			particle:SetStartAlpha( 255 )  				 
			particle:SetStartSize( math.Rand(6, 8)*self.Size ) 
			particle:SetEndSize( 0 ) 				 
			particle:SetRoll( math.Rand(0, 360) ) 
			particle:SetRollDelta( math.Rand(-5, 5) ) 				 
			particle:SetAirResistance( 20 ) 
			particle:SetGravity( Vector( 0, 0, -600 ) ) 
		end 		
	end 
end

function EFFECT:Think( )
return false
end

function EFFECT:Render()
end