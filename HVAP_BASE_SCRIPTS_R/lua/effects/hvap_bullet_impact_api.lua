AddCSLuaFile( "hvap_bullet_impact_api.lua" )
					//Sound,Impact
					//  1	 2     3     4    5     6     7
					//Sand Glass Flesh Wood Metal Snow Concrete
					
					// 1     2     3      4      5      6      7      8         9
					//Dust, Dirt, Sand, Metal, Smoke, Wood,  Glass, Blood, YellowBlood
local mats={				
	[MAT_FOLIAGE]		={4,6},
	[MAT_SLOSH]			={3,5},
	[MAT_ALIENFLESH]	={3,9},
	[MAT_ANTLION]		={3,9},
	[MAT_BLOODYFLESH]	={3,8},
	[MAT_FLESH]			={3,8},
	[45]				={3,8},
	[88]				={7,1},
	[MAT_DIRT]			={7,2},
	[MAT_WOOD]			={4,6},
	[MAT_SAND]			={1,3},
	[MAT_GLASS]			={2,7},
	[MAT_CLIP]			={5,4},
	[MAT_COMPUTER]		={2,4},
	[MAT_PLASTIC]		={3,1},
	[MAT_TILE]			={7,1},
	[MAT_CONCRETE]		={7,1},
	[MAT_GRATE]			={5,4},
	[MAT_VENT]			={5,4},
	[MAT_METAL]			={5,4},
	[MAT_DEFAULT]		={7,1},
	[MAT_EGGSHELL]		={3,1},
	[MAT_SNOW]			={6,7},
	[MAT_GRASS]			={7,1},
	[MAT_WARPSHIELD]	={7,1},	
}

local sounds={
	[1]={--sand
		Sound("hvap/bullet/impact/sand_1.wav"),
		Sound("hvap/bullet/impact/sand_2.wav"),
		Sound("hvap/bullet/impact/sand_3.wav"),
		Sound("hvap/bullet/impact/sand_4.wav"),
	},
	[2]={--glass
		Sound("hvap/bullet/impact/glass_1.wav"),
		Sound("hvap/bullet/impact/glass_2.wav"),
		Sound("hvap/bullet/impact/glass_3.wav"),
		Sound("hvap/bullet/impact/glass_4.wav"),
	},
	[3]={--flesh
		Sound("hvap/bullet/impact/flesh_1.wav"),
		Sound("hvap/bullet/impact/flesh_2.wav"),
		Sound("hvap/bullet/impact/flesh_3.wav"),
		Sound("hvap/bullet/impact/flesh_4.wav"),
		Sound("hvap/bullet/impact/flesh_5.wav"),
		Sound("hvap/bullet/impact/flesh_6.wav"),
		Sound("hvap/bullet/impact/flesh_7.wav"),
		Sound("hvap/bullet/impact/flesh_8.wav")
	},
	[4]={--wood
		Sound("hvap/bullet/impact/wood_1.wav"),
		Sound("hvap/bullet/impact/wood_2.wav"),
		Sound("hvap/bullet/impact/wood_3.wav"),
		Sound("hvap/bullet/impact/wood_4.wav"),
		Sound("hvap/bullet/impact/wood_5.wav"),
		Sound("hvap/bullet/impact/wood_6.wav"),
		Sound("hvap/bullet/impact/wood_7.wav"),
		Sound("hvap/bullet/impact/wood_8.wav")
	},
	[5]={--metal
		Sound("hvap/bullet/impact/explode_small_1.wav"),
		Sound("hvap/bullet/impact/explode_small_2.wav"),
		Sound("hvap/bullet/impact/explode_small_3.wav"),
		Sound("hvap/bullet/impact/explode_small_4.wav"),
		Sound("hvap/bullet/impact/explode_small_5.wav"),
		Sound("hvap/bullet/impact/explode_small_6.wav"),
		Sound("hvap/bullet/impact/explode_small_7.wav"),
		Sound("hvap/bullet/impact/explode_small_8.wav")
	},
	[6]={--snow
		Sound("hvap/bullet/impact/snow_1.wav"),
		Sound("hvap/bullet/impact/snow_2.wav"),
		Sound("hvap/bullet/impact/snow_3.wav"),
		Sound("hvap/bullet/impact/snow_4.wav"),
		Sound("hvap/bullet/impact/snow_5.wav"),
		Sound("hvap/bullet/impact/snow_6.wav"),
		Sound("hvap/bullet/impact/snow_7.wav"),
		Sound("hvap/bullet/impact/snow_8.wav")
	},
	[7]={--concrete
		Sound("hvap/bullet/impact/concrete_1.wav"),
		Sound("hvap/bullet/impact/concrete_2.wav"),
		Sound("hvap/bullet/impact/concrete_3.wav"),
		Sound("hvap/bullet/impact/concrete_4.wav"),
		Sound("hvap/bullet/impact/concrete_5.wav"),
		Sound("hvap/bullet/impact/concrete_6.wav"),
		Sound("hvap/bullet/impact/concrete_7.wav"),
		Sound("hvap/bullet/impact/concrete_8.wav")
	},
}

function EFFECT:Init(data)
self.Pos 		= data:GetOrigin()
self.DirVec 		= data:GetNormal()
self.PenVec 		= data:GetStart()
self.Scale 		= math.Clamp(data:GetScale(), 0.8, 1.28)
self.Radius 		= data:GetRadius() or 1
self.Emitter 		= ParticleEmitter( self.Pos )

	self.Mat=math.ceil(self.Radius)

	if     mats[self.Mat][2]==1 then	self:Dust()	
	elseif mats[self.Mat][2]==2 then	self:Dirt()
	elseif mats[self.Mat][2]==3 then	self:Sand()
	elseif mats[self.Mat][2]==4 then	self:Metal()
	elseif mats[self.Mat][2]==5 then	self:Smoke()
	elseif mats[self.Mat][2]==6 then	self:Wood()
	elseif mats[self.Mat][2]==7 then	self:Glass()
	elseif mats[self.Mat][2]==8 then	self:Blood()
	elseif mats[self.Mat][2]==9 then	self:YellowBlood()
	else 					self:Smoke()
	end

	sound.Play(sounds[mats[self.Mat][1]][math.random(#sounds[mats[self.Mat][1]])], self.Pos, 100, math.random(85,105))
	
end
 
 function EFFECT:Dust()
	self.Emitter = ParticleEmitter( self.Pos )
		
	for i=0, 2.56*self.Scale do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,500*self.Scale) + VectorRand():GetNormalized()*64*self.Scale )
		Smoke:SetDieTime( math.Rand( 1.28 , 2.56 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 80, 100 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 15*self.Scale )
		Smoke:SetEndSize( 35*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 130,125,115 )
		end
	end

	for i=0, 1.28*self.Scale do -- remain smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * 64 * self.Scale )
		Smoke:SetDieTime( math.Rand( 1.92 , 3.8 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 8*self.Scale )
		Smoke:SetEndSize( 16*self.Scale )
		Smoke:SetRoll( math.Rand(180,480) )
		Smoke:SetRollDelta( math.Rand(-1,1) )	
		Smoke:SetAirResistance( 1024 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 30,25,15 )
		end
	end	
	
	for i=0, 4*self.Scale do -- dust
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,64*self.Scale) + VectorRand():GetNormalized()*5*self.Scale )
		Smoke:SetDieTime( math.Rand( .6 , 1.28 )*self.Scale )
		Smoke:SetStartAlpha( 192 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 18*self.Scale )
		Smoke:SetEndSize( 32*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 192 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 105,100,90 )
		end
	end

	for i=0, 6*self.Scale do -- particles
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Scale) + VectorRand():GetNormalized() * 192*self.Scale )
		Debris:SetDieTime( math.random( .8, 1.92) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(2,4)*self.Scale )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-5, 5) )			
		Debris:SetAirResistance( 50 ) 			 			
		Debris:SetColor( 105,100,90 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 
		Debris:SetCollide( true )
		Debris:SetBounce( 1 )			
		end
	end
	
	for i=0,1 do -- flash
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
		Flash:SetVelocity( self.DirVec*64 )
		Flash:SetAirResistance( 200 )
		Flash:SetDieTime( 0.192 )
		Flash:SetStartAlpha( 255 )
		Flash:SetEndAlpha( 0 )
		Flash:SetStartSize( math.Rand( 24, 32 )*self.Scale )
		Flash:SetEndSize( 0 )
		Flash:SetRoll( math.Rand(180,480) )
		Flash:SetRollDelta( math.Rand(-1,1) )
		Flash:SetColor(255,255,255)	
		end
	end
 end
 
 function EFFECT:Dirt()
	self.Emitter = ParticleEmitter( self.Pos )
	
	for i=0, 2*self.Scale do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,500*self.Scale) + VectorRand():GetNormalized()*64*self.Scale )
		Smoke:SetDieTime( math.Rand( 1.28 , 2.56 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 80, 100 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 15*self.Scale )
		Smoke:SetEndSize( 35*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 130,125,115 )
		end
	end

	for i=0, 1*self.Scale do -- remain smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * 64 * self.Scale )
		Smoke:SetDieTime( math.Rand( 1.5 , 3 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 8*self.Scale )
		Smoke:SetEndSize( 16*self.Scale )
		Smoke:SetRoll( math.Rand(180,480) )
		Smoke:SetRollDelta( math.Rand(-1,1) )	
		Smoke:SetAirResistance( 1024 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 30,25,15 )
		end
	end	
	
	for i=0, 5*self.Scale do -- dust
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,64*self.Scale) + VectorRand():GetNormalized()*5*self.Scale )
		Smoke:SetDieTime( math.Rand( .6 , 1.28 )*self.Scale )
		Smoke:SetStartAlpha( 192 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 18*self.Scale )
		Smoke:SetEndSize( 32*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 192 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 105,100,90 )
		end
	end

	for i=0, 5*self.Scale do -- particles
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Scale) + VectorRand():GetNormalized() * 192*self.Scale )
		Debris:SetDieTime( math.random( .8, 1.92) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(2,4)*self.Scale )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-5, 5) )			
		Debris:SetAirResistance( 50 ) 			 			
		Debris:SetColor( 105,100,90 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 
		Debris:SetCollide( true )
		Debris:SetBounce( 1 )			
		end
	end
	
	for i=0,1 do -- flash
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
		Flash:SetVelocity( self.DirVec*64 )
		Flash:SetAirResistance( 200 )
		Flash:SetDieTime( 0.192 )
		Flash:SetStartAlpha( 255 )
		Flash:SetEndAlpha( 0 )
		Flash:SetStartSize( math.Rand( 24, 32 )*self.Scale )
		Flash:SetEndSize( 0 )
		Flash:SetRoll( math.Rand(180,480) )
		Flash:SetRollDelta( math.Rand(-1,1) )
		Flash:SetColor(255,255,255)	
		end
	end
 end

 function EFFECT:Sand()
	self.Emitter = ParticleEmitter( self.Pos )
		
	for i=0, 6*self.Scale do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,500*self.Scale) + VectorRand():GetNormalized()*100*self.Scale )
		Smoke:SetDieTime( math.Rand( 1 , 3 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 60, 80 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 15*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 120,110,90 )
		end
	end

	for i=0, 8*self.Scale do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,400*self.Scale) + VectorRand():GetNormalized()*20*self.Scale )
		Smoke:SetDieTime( math.Rand( 0.5 , 1.5 )*self.Scale )
		Smoke:SetStartAlpha( 150 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 20*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 400 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 120,110,90 )
		end
	end

 end

 function EFFECT:Metal()
	self.Emitter = ParticleEmitter( self.Pos )
		
		
	for i=0, 2*self.Scale do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,500*self.Scale) + VectorRand():GetNormalized()*64*self.Scale )
		Smoke:SetDieTime( math.Rand( 1.28 , 2.56 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 80, 100 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 15*self.Scale )
		Smoke:SetEndSize( 35*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 130,125,115 )
		end
	end

	for i=0, 1.5*self.Scale do -- remain smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * 64 * self.Scale )
		Smoke:SetDieTime( math.Rand( 1.92 , 3.8 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 8*self.Scale )
		Smoke:SetEndSize( 16*self.Scale )
		Smoke:SetRoll( math.Rand(180,480) )
		Smoke:SetRollDelta( math.Rand(-1,1) )	
		Smoke:SetAirResistance( 1024 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 30,25,15 )
		end
	end	
	
	for i=0,1 do -- flash
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
		Flash:SetVelocity( self.DirVec*64 )
		Flash:SetAirResistance( 200 )
		Flash:SetDieTime( 0.256 )
		Flash:SetStartAlpha( 255 )
		Flash:SetEndAlpha( 0 )
		Flash:SetStartSize( math.Rand( 32, 48 )*self.Scale )
		Flash:SetEndSize( 0 )
		Flash:SetRoll( math.Rand(180,480) )
		Flash:SetRollDelta( math.Rand(-1,1) )
		Flash:SetColor(255,255,255)	
		end
	end
 	 
	for i=0, 3.4*self.Scale do -- spark
		local particle = self.Emitter:Add( "effects/spark", self.Pos ) 
		if (particle) then 
		particle:SetVelocity( ((self.DirVec*0.75)+VectorRand()) * math.Rand(32, 320)*self.Scale ) 
		particle:SetDieTime( math.Rand(0.32, 0.42) ) 				 
		particle:SetStartAlpha( 255 )  				 
		particle:SetStartSize( math.Rand(8, 10)*self.Scale ) 
		particle:SetEndSize( 0 ) 				 
		particle:SetRoll( math.Rand(0, 360) ) 
		particle:SetRollDelta( math.Rand(-5, 5) ) 				 
		particle:SetAirResistance( 20 ) 
		particle:SetGravity( Vector( 0, 0, -600 ) ) 
		end 		
	end 
end

 function EFFECT:Smoke()
	self.Emitter = ParticleEmitter( self.Pos )
		
	for i=0, 2.56*self.Scale do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,500*self.Scale) + VectorRand():GetNormalized()*64*self.Scale )
		Smoke:SetDieTime( math.Rand( 1.28 , 2.56 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 80, 100 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 15*self.Scale )
		Smoke:SetEndSize( 35*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 130,125,115 )
		end
	end

	for i=0, 1.28*self.Scale do -- remain smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * 64 * self.Scale )
		Smoke:SetDieTime( math.Rand( 1.92 , 3.8 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 8*self.Scale )
		Smoke:SetEndSize( 16*self.Scale )
		Smoke:SetRoll( math.Rand(180,480) )
		Smoke:SetRollDelta( math.Rand(-1,1) )	
		Smoke:SetAirResistance( 1024 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 30,25,15 )
		end
	end	
	
	for i=0, 4*self.Scale do -- dust
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,64*self.Scale) + VectorRand():GetNormalized()*5*self.Scale )
		Smoke:SetDieTime( math.Rand( .6 , 1.28 )*self.Scale )
		Smoke:SetStartAlpha( 192 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 18*self.Scale )
		Smoke:SetEndSize( 32*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 192 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 105,100,90 )
		end
	end

	for i=0, 6*self.Scale do -- particles
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Scale) + VectorRand():GetNormalized() * 192*self.Scale )
		Debris:SetDieTime( math.random( .8, 1.92) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(2,4)*self.Scale )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-5, 5) )			
		Debris:SetAirResistance( 50 ) 			 			
		Debris:SetColor( 105,100,90 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 
		Debris:SetCollide( true )
		Debris:SetBounce( 1 )			
		end
	end
	
	for i=0,1 do -- flash
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
		Flash:SetVelocity( self.DirVec*64 )
		Flash:SetAirResistance( 200 )
		Flash:SetDieTime( 0.128 )
		Flash:SetStartAlpha( 255 )
		Flash:SetEndAlpha( 0 )
		Flash:SetStartSize( math.Rand( 16, 24 )*self.Scale )
		Flash:SetEndSize( 0 )
		Flash:SetRoll( math.Rand(180,480) )
		Flash:SetRollDelta( math.Rand(-1,1) )
		Flash:SetColor(255,255,255)	
		end
	end

 end

 function EFFECT:Wood()
	self.Emitter = ParticleEmitter( self.Pos )
		
	for i=0, 2.56*self.Scale do -- main smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,500*self.Scale) + VectorRand():GetNormalized()*64*self.Scale )
		Smoke:SetDieTime( math.Rand( 1.28 , 2.56 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 80, 100 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 15*self.Scale )
		Smoke:SetEndSize( 35*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 130,125,115 )
		end
	end

	for i=0, 1.28*self.Scale do -- remain smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * 64 * self.Scale )
		Smoke:SetDieTime( math.Rand( 1.92 , 3.8 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 8*self.Scale )
		Smoke:SetEndSize( 16*self.Scale )
		Smoke:SetRoll( math.Rand(180,480) )
		Smoke:SetRollDelta( math.Rand(-1,1) )	
		Smoke:SetAirResistance( 1024 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 30,25,15 )
		end
	end	

	for i=0, 8*self.Scale do
		local Debris = self.Emitter:Add( "effects/fleck_wood"..math.random(1,2), self.Pos+self.DirVec )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec + VectorRand():GetNormalized() * 300*self.Scale )
		Debris:SetDieTime( math.random( 0.75, 1) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(3,6*self.Scale) )
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

 function EFFECT:Glass()
	for i=0, 8*self.Scale do
		local Debris = self.Emitter:Add( "effects/fleck_glass"..math.random(1,3), self.Pos )
		if (Debris) then
		Debris:SetVelocity ( self.PenVec*-1 * math.random(0,128)*self.Scale + VectorRand():GetNormalized() * 100*self.Scale )
		Debris:SetDieTime( math.random( 0.5, 1) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(2,4*self.Scale) )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-15, 15) )			
		Debris:SetAirResistance( 50 ) 			 			
		Debris:SetColor( 200,200,200 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 	
		end
	end
 end

 function EFFECT:Blood()
	for i=0, (6)*self.Scale do

		// Some blood spray out front and the back
		local Spray = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Spray) then
		Spray:SetVelocity( (self.PenVec*i*self.Scale*40) + (VectorRand():GetNormalized()*30*self.Scale) )
		Spray:SetDieTime( math.Rand( 0.3 , 0.9 ) )
		Spray:SetStartAlpha( 100 )
		Spray:SetEndAlpha( 0 )
		Spray:SetStartSize( 15*self.Scale )
		Spray:SetEndSize( 35*self.Scale )
		Spray:SetRoll( math.Rand(150, 360) )
		Spray:SetRollDelta( math.Rand(-3, 3) )			
		Spray:SetAirResistance( 400 ) 			 		
		Spray:SetColor( 70,35,35 )
		end
	end

		// Some mist for effect
	for i=0, (8)*self.Scale do
		local Mist = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Mist) then
		Mist:SetVelocity( (self.PenVec*i*self.Scale*35) + (VectorRand():GetNormalized()*30*self.Scale) )
		Mist:SetDieTime( math.Rand( 0.3 , 1.5 ) )
		Mist:SetStartAlpha( 80 )
		Mist:SetEndAlpha( 0 )
		Mist:SetStartSize( 10*self.Scale )
		Mist:SetEndSize( 30*self.Scale )
		Mist:SetRoll( math.Rand(150, 360) )
		Mist:SetRollDelta( math.Rand(-2, 2) )			
		Mist:SetAirResistance( 300 ) 			 
		Mist:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(-100, -400) ) ) 			
		Mist:SetColor( 70,35,35 )
		end
	end

		// Some chunks of spleen or whatever
	for i=0, (4)*self.Scale do
		local Chunks = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
		if (Chunks) then
		Chunks:SetVelocity ( (self.PenVec*self.Scale*math.Rand(-100, 300)) + (VectorRand():GetNormalized()*50*self.Scale) )
		Chunks:SetDieTime( math.random( 0.3, 0.8) )
		Chunks:SetStartAlpha( 255 )
		Chunks:SetEndAlpha( 0 )
		Chunks:SetStartSize( 3*self.Scale )
		Chunks:SetEndSize( 3*self.Scale )
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
	for i=0, 2*self.Scale do
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec*math.random( 10,30*self.Scale) + VectorRand():GetNormalized()*120*self.Scale )
		Smoke:SetDieTime( math.Rand( 0.5 , 3 )*self.Scale )
		Smoke:SetStartAlpha( math.Rand( 40, 50 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 20*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-1, 1) )			
		Smoke:SetAirResistance( 200 ) 			 
		Smoke:SetColor( 100,100,100 )
		end
	end

 end

 function EFFECT:YellowBlood()
	for i=0, 2*self.Scale do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.PenVec * math.random(50,300)*self.Scale + VectorRand():GetNormalized() * 50*self.Scale )
		Smoke:SetDieTime( math.Rand( 0.3 , 0.7 ) )
		Smoke:SetStartAlpha( 80 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 10*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 400 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(-100, -400) ) ) 			
		Smoke:SetColor( 120,120,0 )
		end
	end

	for i=0, 2*self.Scale do
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( VectorRand():GetNormalized()*math.random(0,50)*self.Scale )
		Smoke:SetDieTime( math.Rand( 0.3 , 1.5 ) )
		Smoke:SetStartAlpha( 120 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 10*self.Scale )
		Smoke:SetEndSize( 30*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 400 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(-100, -400) ) ) 			
		Smoke:SetColor( 120,120,0 )
		end
	end

	for i=0, 4*self.Scale do
	
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos+(self.DirVec*5) )
		if (Debris) then
		Debris:SetVelocity ( self.PenVec * math.random(50,300)*self.Scale + VectorRand():GetNormalized() * 50*self.Scale )
		Debris:SetDieTime( math.random( 0.3, 0.6) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( 4*self.Scale )
		Debris:SetEndSize( 4*self.Scale )
		Debris:SetRoll( math.Rand(0, 360) )
		Debris:SetRollDelta( math.Rand(-5, 5) )			
		Debris:SetAirResistance( 30 ) 			 			
		Debris:SetColor( 120,120,0 )
		Debris:SetGravity( Vector( 0, 0, -600) ) 
		Debris:SetCollide( true )
		Debris:SetBounce( 0.01 )			
		end
	end
 end

function EFFECT:Think( )
return false
end
function EFFECT:Render()
end