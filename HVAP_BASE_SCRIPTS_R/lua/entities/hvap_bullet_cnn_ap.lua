AddCSLuaFile( "hvap_bullet_cnn_ap.lua" )

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

if SERVER then

local mats={
	[MAT_ALIENFLESH]	={0.2},
	[MAT_ANTLION]		={0.2},
	[MAT_BLOODYFLESH]	={0.2},
	[MAT_FLESH]			={0.2},
	[45]				={0.2},
	[88]				={0.2},

	[MAT_GLASS]			={0.32},	
	[MAT_DIRT]			={0.128},
	[MAT_GRASS]			={0.128},
	
	[MAT_WOOD]			={0.8},
	[MAT_FOLIAGE]		={0.8},
	
	[MAT_SAND]			={0.01},
	[MAT_SNOW]			={0.64},	
	[MAT_SLOSH]			={0.128},

	[MAT_PLASTIC]		={0.768},
	[MAT_TILE]			={0.64},
	[MAT_CONCRETE]		={0.512},	

	[MAT_METAL]			={0.5},	
	[MAT_CLIP]			={0.45},	
	[MAT_COMPUTER]		={0.42},	
	[MAT_VENT]			={0.40},	
	[MAT_GRATE]			={0.42},	

	[MAT_WARPSHIELD]	={0.128},
	[MAT_DEFAULT]		={0.128},
	[MAT_EGGSHELL]		={0.8},
}

function ENT:Initialize()   
	math.randomseed(CurTime())
	self.Flightvector 	= self:GetForward()*((self.Speed*52.5)/66)
	self.Timeleft 		= CurTime() + 60
	self.Impacted 		= false
	self.Splatter 		= false
	self.Entity:SetColor(col)
	self.Entity:SetModel( "models/led.mdl" )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_FLYGRAVITY )
	self.Entity:SetSolid( SOLID_NONE )
	self.Entity:DrawShadow(false)
	self.Entity:SetNoDraw(true)
	self.Entity:GetPhysicsObject():SetMass(self.Mass)
	self.Riccochet=0

	self.IsTracer = false
	if hvap.aircraft.cvars.tracers:GetFloat() == 1 then
		if self.Tracer then
			local colmod=math.random(-32,32)
			local col2=Color(math.Clamp((self.col.r)+math.random(-10,10)-colmod, 0, 255),math.Clamp((self.col.g)+math.random(-10,10)-colmod, 0, 255),math.Clamp((self.col.b)+math.random(-10,10)-colmod, 0, 255),245)
			local tracerp=math.random(1,4)
			if !self.Large then
				local trail=util.SpriteTrail(self, 0, col2, true, math.Clamp(self.Size/2, 5.12, 16), math.Clamp(self.Size/64, 0.128, .32), .064, .03, "trails/hvap_tracer.vmt")
			else 
				local trail=util.SpriteTrail(self, 0, col2, true, math.Clamp(self.Size/2, 5.12, 128), math.Clamp(self.Size/64, 0.128, .32), .1, .03, "trails/hvap_tracer.vmt")
			end	
			local trail2=util.SpriteTrail(self, 0, Color(240,240,240,16), false, 0, math.Clamp(self.Size+1, 6, 8), 0.2, 0.018, "trails/smoke.vmt")
			self.IsTracer = true
		end 
	end
	self.valid = true
end   

function ENT:Think()
	if !self:IsValid() or !self.valid then return end

	if self.Timeleft < CurTime() then
		self:Remove()			
	end
	
	if self.Flightvector:Length() < 10 or self.Riccochet >= 5 then
		self:Remove()
	end
	
	self:SetAngles(self.Flightvector:Angle() + Angle(90,0,0))		

	local tr = util.TraceLine({
		start 	= self:GetPos(),
		endpos 	= self:GetPos() + self.Flightvector,
		filter 	= self.EntFilter,
		mask 	= MASK_SHOT+MASK_WATER,	
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
			effectdata:SetScale( 15*self.EffectSize )
			util.Effect( "watersplash", effectdata )
			self:Remove()
			return true
		end
-----------------------------------impact
		self.Mat = math.ceil(tr.MatType)
		local pr = util.TraceLine({
			start 	= tr.HitPos + self.Flightvector:GetNormalized()*(self.Penetrate*mats[self.Mat][1]),
			endpos 	= tr.HitPos,
			filter 	= self.EntFilter,
			mask 	= MASK_SHOT,
		})

		if pr.StartSolid or tr.Hit and !pr.Hit or self.Penetrate<=0 then
			local Dot = math.Round(self:GetUp():DotProduct(tr.HitNormal),4)
			if (Dot*math.Rand(0.04,1)*mats[tr.MatType][1])>-math.Rand(0.02,0.04) or math.random(1,50) >= 48 then
				self.Flightvector = (self.Flightvector:Length()*(1+Dot*1.2)) * (self:GetUp()+(tr.HitNormal*Dot*-0.8)+(VectorRand()*0.1))
				sound.Play("hvap/bullet/ricochet/ricochet_"..math.random(1,10)..".wav", tr.HitPos, math.random(80,96), math.random(84,112))
				self:SetAngles(self.Flightvector:Angle() + Angle(90,0,0))
				self:SetPos(tr.HitPos+tr.HitNormal)
				self.Riccochet = self.Riccochet+1
				self:NextThink( CurTime() )
				return true
			else
				self:Impact(tr)
			end
		else
			self.Penetrate = self.Penetrate-(tr.HitPos:Distance(pr.HitPos)/mats[self.Mat][1])	
			self:SetPos(pr.HitPos + self.Flightvector:GetNormalized())
			self:Pen(pr)
		end
-----------------------------------
	else
		self.Flightvector = self.Flightvector - (self.Flightvector+(self.Mass/self.Flightvector))/self.BallisticDrag + (VectorRand():GetNormalized()*self.Drift)*.512
		
		if !self.Impacted then
			self:SetPos(self:GetPos() + self.Flightvector)
		else
			self.Impacted = false
		end
	end
	
	self:NextThink( CurTime()+0.0128 )

	return true
end

function ENT:Impact(tr)
	local effectdata = EffectData()
	effectdata:SetOrigin(tr.HitPos)
	effectdata:SetNormal(tr.HitNormal)
	effectdata:SetStart(self.Flightvector:GetNormalized())
	effectdata:SetScale(self.EffectSize)
	effectdata:SetRadius(tr.MatType)
	util.Effect("hvap_bullet_impact_ap", effectdata )
	util.ScreenShake(tr.HitPos, 10, 5, 0.4, self.Size*2.56 )
	util.Decal("ExplosiveGunshot", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
	if self.Splatter then
		util.Decal("blood", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
	end
-----------------------------------damage
	if tr.Entity:IsValid() then
		local dmginfo = DamageInfo()
		if (tr.Entity:IsPlayer() or tr.Entity:IsNPC()) then
			self.Splatter = true
			util.Decal("blood", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			dmginfo:ScaleDamage( 1 ) 
		else 
			dmginfo:ScaleDamage( .016 ) 
		end
		dmginfo:SetDamage( self.TissueDamage ) 
		dmginfo:SetDamageType( DMG_BULLET )
		dmginfo:SetAttacker( self.Owner )
		dmginfo:SetInflictor( self.Owner )
		dmginfo:SetDamageForce( self.Flightvector:GetNormalized()*self.EffectSize*8 )
		dmginfo:SetDamagePosition(tr.HitPos)
		tr.Entity:TakeDamageInfo( dmginfo )
	end
	if tr.Entity:IsWorld() or !tr.Entity.isHVAP then
		util.BlastDamage(self.Owner, self.Owner, tr.HitPos, self.Size*2, self.TissueDamage/8)	
	end
	self:Remove()
end

function ENT:Pen(pr)
	self.Flightvector = self.Flightvector - (self.Flightvector/self.Penetrate)
-----------------------------------impact effect
	self.Impacted = true
	local effectdata = EffectData()
	effectdata:SetOrigin(pr.HitPos)
	effectdata:SetNormal(self.Flightvector:GetNormalized())
	effectdata:SetScale(self.EffectSize/1.92)
	effectdata:SetRadius(pr.MatType)
	util.Effect( "hvap_bullet_penetrate_ap", effectdata )
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
			dmginfo:ScaleDamage( .9 ) 
		else 
			dmginfo:ScaleDamage( .016 ) 
		end
		dmginfo:SetDamage( self.TissueDamage ) 
		dmginfo:SetDamageType( DMG_BULLET )
		dmginfo:SetAttacker( self.Owner )
		dmginfo:SetInflictor( self.Owner )
		dmginfo:SetDamageForce( self.Flightvector:GetNormalized()*self.EffectSize*8 )
		dmginfo:SetDamagePosition(pr.HitPos)
		pr.Entity:TakeDamageInfo( dmginfo )
	end
	if pr.Entity:IsWorld() or !pr.Entity.isHVAP then
		util.BlastDamage(self.Owner, self.Owner, pr.HitPos, self.Size*2, self.TissueDamage/8)	
	end
end

end
