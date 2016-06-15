
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

	[MAT_METAL]			=	9,
	[MAT_CLIP]			=	9,
	[MAT_COMPUTER]		=	9,
	[MAT_VENT]			=	9,
	[MAT_GRATE]			=	9,
	
	[MAT_SAND]			=	5,
	
	[MAT_SNOW]			=	6,
	
	[83]				=	7,
	
	[MAT_WOOD]			=	8,
	[MAT_FOLIAGE]		=	8
}

local sounds={
	[1] = "HVAP.Bullet.Impact.Concrete",
	[2] = "HVAP.Bullet.Impact.Dirt",
	[3] = "HVAP.Bullet.Impact.Flesh",
	[4] = "HVAP.Bullet.Impact.Glass",

	[5] = "HVAP.Bullet.Impact.Sand",
	[6] = "HVAP.Bullet.Impact.Snow",
	[7] = "HVAP.Bullet.Impact.Water",
	[8] = "HVAP.Bullet.Impact.Wood",
	
	[9] = "HVAP.Bullet.Impact.Metal"
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
	self.PenVec = data:GetStart()
	self.Mat = math.ceil(data:GetSurfaceProp() or 1)
	self.Emitter 		= ParticleEmitter( self.Pos )

	if self.Ent:IsValid() and self.Ent.IsHVAPGround then
		self:Ground()
		util.Decal( "ExplosiveGunshot", self.Pos-self.PenVec, self.Pos+self.PenVec )	
		if self.Size >= 90 then 
			sound.Play("HVAP.Bullet.Large.Penetrate", self.Pos)		
		elseif self.Size > 45 then
			sound.Play("HVAP.Bullet.Medium.Penetrate", self.Pos)
		elseif self.Size >= 20 then
			sound.Play("HVAP.Bullet.Small.Penetrate", self.Pos)	
		else
			sound.Play("HVAP.Bullet.Impact.Metal", self.Pos)		
		end
	elseif	mats[self.Mat]==9 then	
		self:Metal()
		util.Decal( "ExplosiveGunshot", self.Pos-self.PenVec, self.Pos+self.PenVec )	
		if self.Size >= 90 then 
			sound.Play("HVAP.Bullet.Large.Penetrate", self.Pos)		
		elseif self.Size > 45 then
			sound.Play("HVAP.Bullet.Medium.Penetrate", self.Pos)
		elseif self.Size >= 20 then
			sound.Play("HVAP.Bullet.Small.Penetrate", self.Pos)	
		else
			sound.Play("HVAP.Bullet.Impact.Metal", self.Pos)		
		end		
	else
		if	mats[self.Mat]==1 then	
			self:Concrete()
		elseif	mats[self.Mat]==2 then	
			self:Dirt()	
		elseif  mats[self.Mat]==3 then	
--			self:Blood()	
		elseif	mats[self.Mat]==4 then	
			self:Glass()	
		elseif	mats[self.Mat]==5 then	
			self:Sand()	
		elseif	mats[self.Mat]==6 then	
			self:Snow()	
		elseif	mats[self.Mat]==7 then	
			self:Water()	
		elseif	mats[self.Mat]==8 then	
			self:Wood()
		else 							
			self:Generic()
		end
		sound.Play(sounds[mats[self.Mat]], self.Pos)	
		util.Decal( decals[mats[self.Mat]], self.Pos-self.PenVec, self.Pos+self.PenVec )
	end
end
 
function EFFECT:Concrete()
	
	for i=0, self.Size/10 do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.PenVec * math.random( 20,500*self.Size) + VectorRand():GetNormalized()*64*self.Size )
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
		for i=0, 2*self.Size do -- dust
			local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( self.PenVec * math.random( 0,64*self.Size) + VectorRand():GetNormalized()*5*self.Size )
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

	end
		
	if self.Size >= 20 then	
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
			Flash:SetVelocity( self.PenVec*64 )
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

end
 
function EFFECT:Dirt()

	for i=0, self.Size/10 do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.PenVec * math.random( 20,500*self.Size) + VectorRand():GetNormalized()*64*self.Size )
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
		for i=0, 3*self.Size do -- dust
			local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
			if (Smoke) then
			Smoke:SetVelocity( self.PenVec * math.random( 0,64*self.Size) + VectorRand():GetNormalized()*5*self.Size )
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
			Debris:SetVelocity ( self.PenVec * math.random(200,300*self.Size) + VectorRand():GetNormalized() * 192*self.Size )
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

end

function EFFECT:Glass()
	for i=0, self.Size/10 do
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

	for i=0, self.Size/10 do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
			Smoke:SetVelocity( self.PenVec * math.random( 20,500*self.Size) + VectorRand():GetNormalized()*128*self.Size )
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
		for i=0, self.Size do -- spark
			local particle = self.Emitter:Add( "effects/spark", self.Pos ) 
			if (particle) then 
				particle:SetVelocity( ((self.PenVec*0.75)+VectorRand()) * math.Rand(32, 320)*self.Size ) 
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

end

function EFFECT:Sand()
	if self.Fancy then
		for i=0, self.Size/10 do
			local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.PenVec * math.random( 20,500*self.Size) + VectorRand():GetNormalized()*100*self.Size )
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

	for i=0, self.Size/10 do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Smoke) then
			Smoke:SetVelocity( self.PenVec * math.random( 20,400*self.Size) + VectorRand():GetNormalized()*20*self.Size )
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

	for i=0, self.Size/10 do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
			Smoke:SetVelocity( self.PenVec * math.random( 20,500*self.Size) + VectorRand():GetNormalized()*64*self.Size )
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
		for i=0, self.Size/10 do -- dust
			local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.PenVec * math.random( 0,64*self.Size) + VectorRand():GetNormalized()*5*self.Size )
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

		for i=0, self.Size/10 do -- particles
			local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
			if (Debris) then
				Debris:SetVelocity ( self.PenVec * math.random(200,300*self.Size) + VectorRand():GetNormalized() * 192*self.Size )
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

	for i=0, self.Size/10 do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
			Smoke:SetVelocity( self.PenVec * math.random( 20,256*self.Size) + VectorRand():GetNormalized()*64*self.Size )
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
		for i=0, self.Size/10 do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.PenVec * 64 * self.Size )
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
end

function EFFECT:Aircraft()

	for i=0, self.Size/10 do -- remain smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
			Smoke:SetVelocity( self.PenVec * 64 * self.Size )
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

end

function EFFECT:Ground()
	if self.Fancy then
		for i=0, self.Size/10 do -- main smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.PenVec * math.random( 20,500*self.Size) + VectorRand():GetNormalized()*64*self.Size )
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

		for i=0, self.Size/10 do -- remain smoke
			local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
			if (Smoke) then
				Smoke:SetVelocity( self.PenVec * 64 * self.Size )
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

	local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
	if (Flash) then
		Flash:SetVelocity( self.PenVec*64 )
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
	 
	for i=0, 8*self.Size do -- spark
		local particle = self.Emitter:Add( "effects/spark", self.Pos ) 
		if (particle) then 
			particle:SetVelocity( ((self.PenVec*0.75)+VectorRand()) * math.Rand(32, 320)*self.Size ) 
			particle:SetDieTime( math.Rand(0.512, 1.28) ) 				 
			particle:SetStartAlpha( 255 )  				 
			particle:SetStartSize( math.Rand(2, 4)*self.Size ) 
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