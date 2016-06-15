
AddCSLuaFile()

ENT.Type 			= "anim"  
ENT.Base 			= "base_anim"     
ENT.PrintName			= "Bullet"  
ENT.Author			= "The_HAVOK"  
ENT.Contact			= "The_HAVOK"  
ENT.Purpose			= ""  
ENT.Instructions		= ""  
 
ENT.Spawnable			= false


ENT.valid = false

if CLIENT then

function ENT:Initialize()   
	self:SetRenderMode( RENDERMODE_NONE )
	self:DrawShadow(false)
	self:SetNoDraw(true)
end

function ENT:Draw()

end

elseif SERVER then

local mats={ --      	 {penetration mult, 1/rico chance}
	[MAT_ALIENFLESH]	={0.5, 4},
	[MAT_ANTLION]		={0.5, 4},
	[MAT_BLOODYFLESH]	={0.5, 4},
	[MAT_FLESH]			={0.5, 4},
	[45]				={0.5, 4},
	[88]				={0.5, 4},

	[MAT_GLASS]			={1.5, 3.9},	
	[MAT_DIRT]			={0.64, 3.8},
	[MAT_GRASS]			={0.64, 3.8},
	
	[MAT_WOOD]			={1.28, 2},
	[MAT_FOLIAGE]		={1.28, 2},
	
	[MAT_SAND]			={0.1, 4.5},
	[MAT_SNOW]			={0.8}, 3.5,	
	[MAT_SLOSH]			={0.8, 4.4},

	[MAT_PLASTIC]		={1.4, 3.4},
	[MAT_TILE]			={1, 2.8},
	[MAT_CONCRETE]		={.95, 3.3},	

	[MAT_METAL]			={1, 1},	
	[MAT_CLIP]			={1.28, 1.128},	
	[MAT_COMPUTER]		={1.28, 1.256},	
	[MAT_VENT]			={4, 5},	
	[MAT_GRATE]			={4, 5},	

	[MAT_WARPSHIELD]	={1, 2},
	[MAT_DEFAULT]		={1, 2},
	[MAT_EGGSHELL]		={1, 2},
}

function ENT:Initialize()   
	math.randomseed(CurTime())
	self.Flightvector 	= self:GetForward()*(self.Speed*52.459*FrameTime())
	self.Timeleft 		= CurTime() + self.Timer
	self.Impacted 		= false
	self.Burnout 		= CurTime() + (self.TracerBurnout or 1.4)
	self:SetColor(col)
	self:SetModel( "models/led.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_NONE )
	self:GetPhysicsObject():SetMass(self.Mass)
	self.Ricochet=0
	self.Penetrated=0

	self.IsTracer = false
	if hvap.aircraft.cvars.tracers:GetFloat() == 1 then
		if self.Tracer then
			local colmod=math.random(-32,32)
			local col2=Color(math.Clamp((self.col.r)+math.random(-10,10)-colmod, 0, 255),math.Clamp((self.col.g)+math.random(-10,10)-colmod, 0, 255),math.Clamp((self.col.b)+math.random(-10,10)-colmod, 0, 255),245)
			local tracerp=math.random(1,4)
			if !self.Large then
				self.trail=util.SpriteTrail(self, 0, col2, true, math.Clamp(self.Size/2, 5.12, 16), math.Clamp(self.Size/64, 0.128, .32), 1/self.Size, .03, "trails/hvap_tracer.vmt")
				self.trail2=util.SpriteTrail(self, 0, Color(240,240,240,18), false, 0, math.Clamp(self.Size+1, 6, 8), 0.08+1/self.Size, 0.01, "trails/smoke.vmt")
			else 
				self.trail=util.SpriteTrail(self, 0, col2, true, math.Clamp(self.Size/2, 5.12, 128), math.Clamp(self.Size/64, 0.128, .32), .1, .03, "trails/hvap_tracer.vmt")
				self.trail2=util.SpriteTrail(self, 0, Color(240,240,240,18), false, 0, math.Clamp(self.Size+1, 6, 8), 0.128, 0.01, "trails/smoke.vmt")
			end	
			self.IsTracer = true
		end 
	end
	self.valid = true
end   

function ENT:Think()
	if !self:IsValid() or !self.valid then return end
	
	local crt = CurTime()

	if self.IsTracer and self.Burnout < crt then
		if self.trail:IsValid() then
			self.trail:Remove()
		end
	end	
	
	if self.Timeleft < crt then
		self:Remove()	
		return true		
	end

	local tr = util.TraceLine({
		start 	= self:GetPos(),
		endpos 	= self:GetPos() + self.Flightvector,
		filter 	= self.EntFilter,
		mask 	= {CONTENTS_SOLID,CONTENTS_WINDOW,CONTENTS_WATER,CONTENTS_MOVEABLE,CONTENTS_HITBOX,MASK_SOLID},	
	})
	
	if tr.Hit and !table.HasValue( self.EntFilter, tr.Entity ) then
		self.Mat = math.ceil(tr.MatType)	

		if tr.HitSky then
			self:Remove()
			return true
		end
		
		if self.Mat==83 and !self.Entity:WaterLevel() > 0 then
			local effectdata = EffectData()
			effectdata:SetOrigin( tr.HitPos )
			effectdata:SetNormal( tr.HitNormal )
			effectdata:SetScale( self.Size^2 )
			util.Effect( "watersplash", effectdata )
		end

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
			local Dot = self.Flightvector:GetNormalized():Dot(tr.HitNormal)
			if (1+Dot) > ((math.Rand(0.192,0.32))*mats[self.Mat][2]) or math.random(0,mats[self.Mat][1]*100) == 1 then
				self.Flightvector = ( (self.Flightvector:Length()*(1+Dot*1.2)) * (self.Flightvector:GetNormalized()+(tr.HitNormal*Dot*-0.8)+(VectorRand()*0.1)) ) + (self.Flightvector*Dot)/10
				self:SetAngles(self.Flightvector:Angle() + Angle(90,0,0))
				self:SetPos(tr.HitPos+tr.HitNormal)
				self:RicochetB(tr)
			else
				self:Impact(tr)
			end
		else
			self:Pen(pr)
		end
	else
		self.Flightvector = self.Flightvector - ((self.Flightvector/self.BallisticDrag) + (VectorRand():GetNormalized()*self.Drift))*.512 + Vector(0,0,-30)/self.Flightvector:Length()
		
		if !self.Impacted then
			self:SetPos(self:GetPos() + self.Flightvector)
			self:SetAngles(self.Flightvector:Angle() + Angle(90,0,0))	
		else
			self.Impacted = false
		end
	end
	
	self:NextThink( crt )
	return true
end

function ENT:Impact(tr)
	local effectdata = EffectData()
		effectdata:SetEntity(tr.Entity)
		effectdata:SetMagnitude(self.EffectSize)
		effectdata:SetNormal(tr.HitNormal)
		effectdata:SetOrigin(tr.HitPos)
		effectdata:SetScale(self.Size)
		effectdata:SetStart(self.Flightvector:GetNormalized())
		effectdata:SetSurfaceProp(tr.MatType or 1)
	util.Effect("hvap_bullet_impact_ap", effectdata )
	
	self:ApplyDamage(tr, 1)
	self:Remove()
end

function ENT:RicochetB(tr)
	if self.IsTracer and self.trail2:IsValid() then
		self.trail2:Remove()
	end
	
	self.Ricochet = self.Ricochet+1
	if self.Ricochet >= 4 then
		self:Remove()
	end		
	
	local effectdata = EffectData()
		effectdata:SetEntity(tr.Entity)
		effectdata:SetMagnitude(self.EffectSize)
		effectdata:SetNormal(tr.HitNormal)
		effectdata:SetOrigin(tr.HitPos)
		effectdata:SetScale(self.Size)
		effectdata:SetStart(self.Flightvector:GetNormalized())
		effectdata:SetSurfaceProp(tr.MatType or 1)
	util.Effect("hvap_bullet_ricochet", effectdata )
	
	self.Impacted = true
	self:ApplyDamage(tr, 0.40)
	self:NextThink( CurTime() )
end

function ENT:Pen(pr)
	self:SetPos(pr.HitPos + self.Flightvector:GetNormalized())
	self.Flightvector = self.Flightvector - (self.Flightvector/self.Penetrate)*1.5
	if self.IsTracer and self.trail2:IsValid() then
		self.trail2:Remove()
	end
	
	self.Penetrated = self.Penetrated+1
	if self.Penetrated >= 5 then	
		self:Impact(pr)
	end

	local effectdata = EffectData()
		effectdata:SetEntity(pr.Entity)
		effectdata:SetMagnitude(self.EffectSize)
		effectdata:SetNormal(pr.HitNormal)
		effectdata:SetOrigin(pr.HitPos)
		effectdata:SetScale(self.Size)
		effectdata:SetStart(self.Flightvector:GetNormalized())
		effectdata:SetSurfaceProp(pr.MatType or 1)
	util.Effect( "hvap_bullet_penetrate", effectdata )

	self.Impacted = true	
	self:ApplyDamage(pr, 1.28)
	self:NextThink( CurTime() )
end

function ENT:ApplyDamage(trd, div)
	if trd.Entity:IsValid() then
		local dmginfo = DamageInfo()
		if (trd.Entity:IsPlayer() or trd.Entity:IsNPC()) then
			util.Decal("blood", trd.HitPos + trd.HitNormal, trd.HitPos - trd.HitNormal)
			dmginfo:ScaleDamage( div ) 
		else 
			dmginfo:ScaleDamage( div ) 
		end
		dmginfo:SetDamage( self.TissueDamage ) 
		dmginfo:SetDamageType( DMG_BULLET )
		dmginfo:SetAttacker( self.Owner )
		dmginfo:SetInflictor( self.AircraftFiring or self.Owner )
		dmginfo:SetDamageForce( self.Flightvector:GetNormalized()*self.Size*8 )
		dmginfo:SetDamagePosition(trd.HitPos)
		trd.Entity:TakeDamageInfo( dmginfo )
	end
	
end

end
