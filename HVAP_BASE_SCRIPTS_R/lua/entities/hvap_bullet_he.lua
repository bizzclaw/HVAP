AddCSLuaFile( "hvap_bullet_he.lua" )

ENT.Type 			= "anim"  
ENT.Base 			= "base_anim"     
ENT.PrintName			= "Bullet"  
ENT.Author			= "The_HAVOK"  
ENT.Contact			= "The_HAVOK"  
ENT.Purpose			= ""  
ENT.Instructions		= ""  
 
ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.valid = false

if CLIENT then

elseif SERVER then

local mats={
	[MAT_ALIENFLESH]	={0.2, 1},
	[MAT_ANTLION]		={0.2, 1},
	[MAT_BLOODYFLESH]	={0.2, 1},
	[MAT_FLESH]			={0.2, 1},
	[45]				={0.2, 1},
	[88]				={0.2, 1},

	[MAT_GLASS]			={0.4, 0.8},	
	[MAT_DIRT]			={0.128, 0.768},
	[MAT_GRASS]			={0.128, 0.768},
	
	[MAT_WOOD]			={0.84, 0.768},
	[MAT_FOLIAGE]		={0.84, 0.768},
	
	[MAT_SAND]			={0.02, 0.95},
	[MAT_SNOW]			={0.8}, 0.95,	
	[MAT_SLOSH]			={0.128, 1},

	[MAT_PLASTIC]		={0.768, 0.8},
	[MAT_TILE]			={0.64, 0.64},
	[MAT_CONCRETE]		={0.512, 0.6},	

	[MAT_METAL]			={0.5, 0.5},	
	[MAT_CLIP]			={0.512, 0.5},	
	[MAT_COMPUTER]		={0.56, 0.6},	
	[MAT_VENT]			={0.58, 0.52},	
	[MAT_GRATE]			={0.60, 0.52},	

	[MAT_WARPSHIELD]	={0.128, 0.64},
	[MAT_DEFAULT]		={0.128, 0.64},
	[MAT_EGGSHELL]		={0.8, 0.8},
}

function ENT:Initialize()   
	math.randomseed(CurTime())
	self.Flightvector 	= self:GetForward()*(self.Speed*52.459*FrameTime())
	self.Timeleft 		= CurTime() + self.Timer
	self.Impacted 		= false
	self.Splatter 		= false
	self:SetColor(col)
	self:SetModel( "models/led.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_FLYGRAVITY )
	self:SetSolid( SOLID_NONE )
	self:GetPhysicsObject():SetMass(self.Mass)
	self:DrawShadow(false)
	self:SetNoDraw(true)
	self.Riccochet=0

	self.IsTracer = false
	if hvap.aircraft.cvars.tracers:GetFloat() == 1 then
		if self.Tracer then
			local colmod=math.random(-32,32)
			local col2=Color(math.Clamp((self.col.r)+math.random(-10,10)-colmod, 0, 255),math.Clamp((self.col.g)+math.random(-10,10)-colmod, 0, 255),math.Clamp((self.col.b)+math.random(-10,10)-colmod, 0, 255),245)
			local tracerp=math.random(1,4)
			if !self.Large then
				self.trail=util.SpriteTrail(self, 0, col2, true, math.Clamp(self.Size/2, 5.12, 16), math.Clamp(self.Size/64, 0.128, .32), .04, .03, "trails/hvap_tracer.vmt")
			else 
				self.trail=util.SpriteTrail(self, 0, col2, true, math.Clamp(self.Size/2, 5.12, 128), math.Clamp(self.Size/64, 0.128, .32), .1, .03, "trails/hvap_tracer.vmt")
			end	
				self.trail2=util.SpriteTrail(self, 0, Color(240,240,240,16), false, 0, math.Clamp(self.Size+1, 6, 8), 0.2, 0.01, "trails/smoke.vmt")
			self.IsTracer = true
		end 
	end
	self.valid = true
end   

function ENT:Think()
	if !self:IsValid() or !self.valid then return end
	if self.Impacted then self.Impacted = false end
	
	if CurTime() > self.Timeleft then
		if self.SelfDestr then
			self:Airburst()
		else
			self:Remove()		
		end
	end
	
	if self.Riccochet >= 4 then
		self:Remove()
	end
	
	self:SetAngles(self.Flightvector:Angle() + Angle(90,0,0))		

	local tr = util.TraceLine({
		start 	= self:GetPos(),
		endpos 	= self:GetPos() + self.Flightvector,
		filter 	= self.EntFilter,
		mask 	= {CONTENTS_SOLID,CONTENTS_WINDOW,CONTENTS_WATER,CONTENTS_MOVEABLE,CONTENTS_HITBOX,MASK_SOLID},	
	})
	
	if tr.Hit then
		if tr.HitSky then
			self:Remove()
			return true
		end
		if tr.MatType==83 then
			local effectdata = EffectData()
			effectdata:SetOrigin( tr.HitPos )
			effectdata:SetNormal( tr.HitNormal )
			effectdata:SetScale( self.Size*self.EffectSize )
			util.Effect( "watersplash", effectdata )
--			self:Remove()
		end
-----------------------------------impact
		self.Mat = math.ceil(tr.MatType)
		local pr = util.TraceLine({
			start 	= tr.HitPos + self.Flightvector:GetNormalized()*(self.Penetrate*mats[self.Mat][1]),
			endpos 	= tr.HitPos,
			filter 	= self.EntFilter,
			mask 	= {CONTENTS_SOLID,CONTENTS_WINDOW,CONTENTS_WATER,CONTENTS_MOVEABLE,CONTENTS_HITBOX,MASK_SOLID},
		})
		if pr.Hit then
			self.Penetrate = self.Penetrate-(tr.HitPos:Distance(pr.HitPos)/mats[self.Mat][1])	
		end
		if pr.StartSolid or self.Penetrate<=0 or !pr.Hit then
			local Dot = math.Round(self:GetUp():DotProduct(tr.HitNormal),4)
			if (1+Dot) > ((math.Rand(-0.016,0.128))+mats[self.Mat][2]) or math.random(0,mats[self.Mat][1]*10) == 1 and -Dot < mats[self.Mat][2] then
				self.Flightvector = (self.Flightvector:Length()*(1+Dot*1.2)) * (self:GetUp()+(tr.HitNormal*Dot*-0.8)+(VectorRand()*0.1))
				sound.Play("hvap/bullet/ricochet/ricochet_"..math.random(1,10)..".wav", tr.HitPos, math.random(80,96), math.random(84,112))
				self:SetAngles(self.Flightvector:Angle() + Angle(90,0,0))
				self:SetPos(tr.HitPos+tr.HitNormal)
				self.Riccochet = self.Riccochet+1
				self:NextThink( CurTime() )
				self.Impacted = true
			else
				self:Impact(tr)
			end
		elseif !pr.StartSolid and self.Penetrate>0 then
			self:SetPos(pr.HitPos + self.Flightvector:GetNormalized())
			self:Pen(pr)
		else
			self:Impact(tr)
		end
-----------------------------------
	else
		self.Flightvector = self.Flightvector - ((self.Flightvector/self.BallisticDrag) + (VectorRand():GetNormalized()*self.Drift))*.512+Vector(0,0,-0.08)
		
		if !self.Impacted then
			self:SetPos(self:GetPos() + self.Flightvector)
		else
			self.Impacted = false
		end
	end
	
	self:NextThink( CurTime() )

	return true
end

function ENT:Impact(tr)
	local effectdata = EffectData()
	effectdata:SetOrigin(tr.HitPos)
	effectdata:SetNormal(tr.HitNormal)
	effectdata:SetScale(self.EffectSize)
	effectdata:SetRadius(tr.MatType)
	util.Effect("hvap_bullet_impact_he", effectdata )
	util.ScreenShake(tr.HitPos, 10, 5, 0.4, self.Radius*1.28 )
	if self.Large then
		util.Decal("scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
	else
		util.Decal("SmallScorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
	end
	if self.Splatter then
		util.Decal("blood", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
	end
-----------------------------------damage
	util.BlastDamage(self.Owner, self.Owner, tr.HitPos, self.Radius*1.92, self.TissueDamage)
	self:Remove()
end

function ENT:Airburst()
	local effectdata = EffectData()
	local pos=self:GetPos()
	effectdata:SetOrigin(pos)
	effectdata:SetStart(self.Flightvector:GetNormalized())
	effectdata:SetScale(self.EffectSize)
	util.Effect("hvap_bullet_impact_he", effectdata )
	util.ScreenShake(pos, 10, 5, 0.4, self.Radius*2.56 )
-----------------------------------damage
	util.BlastDamage(self.Owner, self.Owner, pos, self.Radius*4, self.TissueDamage*1.92)
	self:Remove()
end

function ENT:Pen(pr)
	self.Flightvector = self.Flightvector - (self.Flightvector/self.Penetrate)*1.28
	if self.IsTracer and self.trail2:IsValid() then
		self.trail2:Remove()
	end
-----------------------------------impact effect
	local effectdata = EffectData()
	effectdata:SetOrigin(pr.HitPos)
	effectdata:SetNormal(self.Flightvector:GetNormalized())
	effectdata:SetScale(self.EffectSize/1.92)
	effectdata:SetRadius(pr.MatType)
	util.Effect( "hvap_bullet_penetrate_he", effectdata )
	util.ScreenShake(pr.HitPos, 10, 5, 0.4, self.Size*2 )
	util.Decal("ExplosiveGunshot", pr.HitPos + pr.HitNormal,pr.HitPos - pr.HitNormal)
	if self.Splatter then
		util.Decal("blood", pr.HitPos + pr.HitNormal, pr.HitPos - pr.HitNormal)
	end
-----------------------------------damage
	if pr.Entity:IsValid() then
		local dmginfo = DamageInfo()
		if (pr.Entity:IsPlayer() or pr.Entity:IsNPC()) then
			self.Splatter = true
			util.Decal("blood", pr.HitPos + pr.HitNormal, pr.HitPos - pr.HitNormal)
		end
		dmginfo:ScaleDamage( .020 ) 
		dmginfo:SetDamage( self.TissueDamage ) 
		dmginfo:SetDamageType( DMG_BULLET )
		dmginfo:SetAttacker( self.Owner )
		dmginfo:SetInflictor( self.Owner )
		dmginfo:SetDamageForce( self.Flightvector:GetNormalized()*self.EffectSize*8 )
		dmginfo:SetDamagePosition(pr.HitPos)
		pr.Entity:TakeDamageInfo( dmginfo )
	end
	util.BlastDamage(self.Owner, self.Owner, pr.HitPos, self.Size*1.6, self.TissueDamage/8)	
end

end