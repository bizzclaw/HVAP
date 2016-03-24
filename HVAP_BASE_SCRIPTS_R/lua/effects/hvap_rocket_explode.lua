AddCSLuaFile( "hvap_rocket_explode.lua" )

					//Sound,Impact
					//    1	    2     
					//Concrete Metal
					
					// 1     2     
					//Dust, Metal
local mats={				
	[MAT_FOLIAGE]		={1,1},
	[MAT_SLOSH]			={1,1},
	[MAT_ALIENFLESH]	={1,1},
	[MAT_ANTLION]		={1,1},
	[MAT_BLOODYFLESH]	={1,1},
	[MAT_FLESH]			={1,1},
	[45]				={1,1},
	[88]				={1,1},
	[MAT_DIRT]			={1,1},
	[MAT_WOOD]			={1,1},
	[MAT_SAND]			={1,1},
	[MAT_GLASS]			={1,1},
	[MAT_CLIP]			={2,2},
	[MAT_COMPUTER]		={2,2},
	[MAT_PLASTIC]		={1,1},
	[MAT_TILE]			={1,1},
	[MAT_CONCRETE]		={1,1},
	[MAT_GRATE]			={2,2},
	[MAT_VENT]			={2,2},
	[MAT_METAL]			={2,2},
	[MAT_DEFAULT]		={1,1},
	[MAT_EGGSHELL]		={1,1},
	[MAT_SNOW]			={1,1},
	[MAT_GRASS]			={1,1},
	[MAT_WARPSHIELD]	={1,1},	
}

local sounds={
	[1]={
		Sound("hvap/bullet/impact/explode_medium_1.wav"),
		Sound("hvap/bullet/impact/explode_medium_2.wav"),
		Sound("hvap/bullet/impact/explode_medium_3.wav"),
		Sound("hvap/bullet/impact/explode_medium_4.wav"),
		Sound("hvap/bullet/impact/explode_medium_5.wav"),
		Sound("hvap/bullet/impact/explode_medium_6.wav"),
		Sound("hvap/bullet/impact/explode_medium_7.wav"),
		Sound("hvap/bullet/impact/explode_medium_8.wav"),
		Sound("hvap/bullet/impact/explode_medium_9.wav"),
		Sound("hvap/bullet/impact/explode_medium_10.wav"),
	},
	[2]={
		Sound("hvap/bullet/rocket/impact_metal_01.wav"),
		Sound("hvap/bullet/rocket/impact_metal_02.wav"),
		Sound("hvap/bullet/rocket/impact_metal_03.wav"),
		Sound("hvap/bullet/rocket/impact_metal_04.wav"),
	},
}

function EFFECT:Init(data)
self.Pos 		= data:GetOrigin()
self.DirVec 		= data:GetNormal()
self.PenVec 		= data:GetStart()
self.Scale 		= data:GetScale()/2.56
self.Radius 		= data:GetRadius() or 1
self.Emitter 		= ParticleEmitter( self.Pos )

	self.Mat=math.ceil(self.Radius)

	if     mats[self.Mat][2]==1 then	self:Dust()	
	elseif mats[self.Mat][2]==2 then	self:Metal()
	else 					self:Dust()
	end

	sound.Play(sounds[mats[self.Mat][1]][math.random(#sounds[mats[self.Mat][1]])], self.Pos, 128, math.Rand(90, 110))
--	sound.Play(Sound("hvap/bullet/shell_explosion_"..math.random(1,3)..".wav"), self.Pos, math.random(90,100), math.random(82,108))
	
end
 
 function EFFECT:Dust()
	self.Emitter = ParticleEmitter( self.Pos )
		
	for i=0, self.Scale do
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,70*self.Scale) + VectorRand():GetNormalized()*150*self.Scale )
		Smoke:SetDieTime( math.Rand( 3 , 5 ) )
		Smoke:SetStartAlpha( math.Rand( 128, 192 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 52*self.Scale )
		Smoke:SetEndSize( 76*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 100,100,100 )
		end
	end

	for i=0, self.Scale/2 do -- remain smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * 64 * self.Scale )
		Smoke:SetDieTime( math.Rand( 4 , 6 ) )
		Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 16*self.Scale )
		Smoke:SetEndSize( 32*self.Scale )
		Smoke:SetRoll( math.Rand(180,480) )
		Smoke:SetRollDelta( math.Rand(-1,1) )	
		Smoke:SetAirResistance( 1024 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 30,25,15 )
		end
	end	
	
	for i=0,3 do 
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
		Flash:SetVelocity( self.DirVec*100 )
		Flash:SetAirResistance( 200 )
		Flash:SetDieTime( 0.2 )
		Flash:SetStartAlpha( 255 )
		Flash:SetEndAlpha( 0 )
		Flash:SetStartSize( math.Rand( 128, 150 )*self.Scale )
		Flash:SetEndSize( 0 )
		Flash:SetRoll( math.Rand(180,480) )
		Flash:SetRollDelta( math.Rand(-1,1) )
		Flash:SetColor(255,255,255)	
		end
	end

	for i=0, self.Scale*2+20 do 
		local particle = self.Emitter:Add( "effects/spark", self.Pos ) 
		if (particle) then 
		particle:SetVelocity( ((self.DirVec*0.75)+VectorRand()) * math.Rand(64, 128)*self.Scale ) 
		particle:SetDieTime( math.Rand(1.28, 2.56) ) 				 
		particle:SetStartAlpha( 255 )  				 
		particle:SetStartSize( math.Rand(4, 6)*self.Scale ) 
		particle:SetEndSize( 1 ) 				 
		particle:SetRoll( math.Rand(0, 360) ) 
		particle:SetRollDelta( math.Rand(-5, 5) ) 				 
		particle:SetAirResistance( 32 ) 
		particle:SetGravity( Vector( 0, 0, -600 ) ) 
		end 	
	end 

	for i=0, self.Scale do
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 0,128*self.Scale) + VectorRand():GetNormalized()*5*self.Scale )
		Smoke:SetDieTime( math.Rand( 2 , 3 ))
		Smoke:SetStartAlpha( 150 )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 20*self.Scale )
		Smoke:SetEndSize( 35*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 400 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 105,100,90 )
		end
	end

	for i=0, 16*self.Scale do
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Pos )
		if (Debris) then
		Debris:SetVelocity ( self.DirVec * math.random(64,128*self.Scale) + VectorRand():GetNormalized()*128*self.Scale )
		Debris:SetDieTime( math.random( 0.6, 1) )
		Debris:SetStartAlpha( 255 )
		Debris:SetEndAlpha( 0 )
		Debris:SetStartSize( math.random(4,7)*self.Scale )
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
 
 function EFFECT:Metal()
	self.Emitter = ParticleEmitter( self.Pos )
	for i=0, self.Scale do
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * math.random( 20,70*self.Scale) + VectorRand():GetNormalized()*150*self.Scale )
		Smoke:SetDieTime( math.Rand( 3 , 5 ) )
		Smoke:SetStartAlpha( math.Rand( 128, 192 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 52*self.Scale )
		Smoke:SetEndSize( 76*self.Scale )
		Smoke:SetRoll( math.Rand(150, 360) )
		Smoke:SetRollDelta( math.Rand(-2, 2) )			
		Smoke:SetAirResistance( 300 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 100,100,100 )
		end
	end

	for i=0, self.Scale/2 do -- remain smoke
		local Smoke = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Smoke) then
		Smoke:SetVelocity( self.DirVec * 64 * self.Scale )
		Smoke:SetDieTime( math.Rand( 4 , 6 ) )
		Smoke:SetStartAlpha( math.Rand( 184, 255 ) )
		Smoke:SetEndAlpha( 0 )
		Smoke:SetStartSize( 16*self.Scale )
		Smoke:SetEndSize( 32*self.Scale )
		Smoke:SetRoll( math.Rand(180,480) )
		Smoke:SetRollDelta( math.Rand(-1,1) )	
		Smoke:SetAirResistance( 1024 ) 			 
		Smoke:SetGravity( Vector( math.Rand(-70, 70) * self.Scale, math.Rand(-70, 70) * self.Scale, math.Rand(0, -100) ) ) 			
		Smoke:SetColor( 30,25,15 )
		end
	end	
	
	for i=0,3 do 
		local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Pos )
		if (Flash) then
		Flash:SetVelocity( self.DirVec*100 )
		Flash:SetAirResistance( 200 )
		Flash:SetDieTime( 0.2 )
		Flash:SetStartAlpha( 255 )
		Flash:SetEndAlpha( 0 )
		Flash:SetStartSize( math.Rand( 128, 150 )*self.Scale )
		Flash:SetEndSize( 0 )
		Flash:SetRoll( math.Rand(180,480) )
		Flash:SetRollDelta( math.Rand(-1,1) )
		Flash:SetColor(255,255,255)	
		end
	end

	for i=0, self.Scale*2.56+40 do 
		local particle = self.Emitter:Add( "effects/spark", self.Pos ) 
		if (particle) then 
		particle:SetVelocity( ((self.DirVec*0.75)+VectorRand()) * math.Rand(64, 128)*self.Scale ) 
		particle:SetDieTime( math.Rand(1.28, 2.56) ) 				 
		particle:SetStartAlpha( 255 )  				 
		particle:SetStartSize( math.Rand(4, 6)*self.Scale ) 
		particle:SetEndSize( 1 ) 				 
		particle:SetRoll( math.Rand(0, 360) ) 
		particle:SetRollDelta( math.Rand(-5, 5) ) 				 
		particle:SetAirResistance( 32 ) 
		particle:SetGravity( Vector( 0, 0, -600 ) ) 
		end 	
	end 


end

function EFFECT:Think( )
return false
end
function EFFECT:Render()
end