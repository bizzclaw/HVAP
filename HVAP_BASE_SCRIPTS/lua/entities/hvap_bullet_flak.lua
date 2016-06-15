
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

function ENT:Initialize()   
	math.randomseed(CurTime())
	self.Flightvector 	= self:GetForward()*(self.Speed*52.459*FrameTime())
	self.Timeleft 		= CurTime() + self.Timer
	self.Wait = CurTime() + 0.0512	
	self.Impacted 		= false
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
	
	local crt = CurTime()

	if self.SelfDestr then
		if crt > self.Timeleft+math.Rand(-0.1,0.1) then
			self:Airburst()
		end
	elseif crt > self.Timeleft then
		self:Remove()		
	end

	if self.Flak and crt > self.Wait then
		ent = ents.FindInSphere(self:GetPos(), self.Radius/2)
		for k, v in pairs(ent) do 
			if v.IsHVAP and v != self.AircraftFiring and v != self then 
				self:Airburst()
			end
		end
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

		self:Impact(tr)
		
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
	util.Effect("hvap_bullet_impact_he", effectdata )
	
	self:ApplyDamage(tr, 1, false)
	self:Remove()
end

function ENT:Airburst()
	local effectdata = EffectData()
		effectdata:SetMagnitude(self.EffectSize)
		effectdata:SetNormal(-self.Flightvector:GetNormalized())
		effectdata:SetOrigin(self:GetPos())
		effectdata:SetScale(self.Size)
		effectdata:SetRadius(1)
	util.Effect("hvap_bullet_airburst", effectdata )
	
	self:ApplyDamage(tr, 1, true)
	self:Remove()
end

function ENT:ApplyDamage(trd, div, b)
	if trd and trd.Entity:IsValid() and !b then
		local dmginfo = DamageInfo()
		if (trd.Entity:IsPlayer() or trd.Entity:IsNPC()) then
			self.Splatter = true
			util.Decal("blood", trd.HitPos + trd.HitNormal, trd.HitPos - trd.HitNormal)
			dmginfo:ScaleDamage( div ) 
		else 
			dmginfo:ScaleDamage( div ) 
		end
		dmginfo:SetDamage( self.TissueDamage ) 
		dmginfo:SetDamageType( DMG_BULLET )
		dmginfo:SetAttacker( self.Owner )
		dmginfo:SetInflictor( self.AircraftFiring )
		dmginfo:SetDamageForce( self.Flightvector:GetNormalized()*self.Size*8 )
		dmginfo:SetDamagePosition(trd.HitPos)
		trd.Entity:TakeDamageInfo( dmginfo )
	end
	util.BlastDamage( self.AircraftFiring, self.Owner, self:GetPos() + self:GetForward()*64, self.Size+self.Radius+63, self.TissueDamage )
end

end
