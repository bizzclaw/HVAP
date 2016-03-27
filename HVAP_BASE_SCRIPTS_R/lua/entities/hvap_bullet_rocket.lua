AddCSLuaFile( "hvap_bullet_rocket.lua" )

ENT.Type 			= "anim"  
ENT.Base 			= "base_anim"     
ENT.PrintName			= "Rocket"  
ENT.Author			= "The_HAVOK"  
ENT.Contact			= "The_HAVOK"  
ENT.Purpose			= ""  
ENT.Instructions		= ""  
 
ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.valid = false
--ENT.particle = NIL

if SERVER then

local mats={
	[MAT_FOLIAGE]		={1},
	[MAT_SLOSH]			={0},
	[MAT_ALIENFLESH]	={0},
	[MAT_ANTLION]		={0},
	[MAT_BLOODYFLESH]	={0},
	[MAT_FLESH]			={0},
	[45]				={0},
	[88]				={0},
	[MAT_DIRT]			={0},
	[MAT_WOOD]			={1},
	[MAT_SAND]			={0},
	[MAT_GLASS]			={2},
	[MAT_CLIP]			={0},
	[MAT_COMPUTER]		={0},
	[MAT_PLASTIC]		={1},
	[MAT_TILE]			={0},
	[MAT_CONCRETE]		={0},
	[MAT_GRATE]			={0},
	[MAT_VENT]			={0},
	[MAT_METAL]			={0},
	[MAT_DEFAULT]		={0},
	[MAT_EGGSHELL]		={0},
	[MAT_SNOW]			={4},
	[MAT_GRASS]			={0},
	[MAT_WARPSHIELD]	={0},
}

function ENT:Initialize()   
	math.randomseed(CurTime())
	self.Flightvector 	= self:GetForward()*((self.Speed*52.5)/66)
	self.Timeleft 		= CurTime() + 10
	self.Impacted 		= false
	self.Splatter 		= false
	self.sound = CreateSound(self.Entity, "hvap/rocket/rocket_fly_loop.wav")
	self.Entity:SetModel( self.Mdl )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_FLYGRAVITY )
	self.Entity:SetSolid( SOLID_NONE )
	self.Entity:DrawShadow(false)
	self.Entity:SetNoDraw(false)
	self.Entity:GetPhysicsObject():SetMass(1024)
	self.Riccochet=0

	Glow = ents.Create("env_sprite")				// The ball of the tracer
	Glow:SetKeyValue("model","orangecore2.vmt")
	Glow:SetKeyValue("rendercolor","255 150 100")
	Glow:SetKeyValue("scale","0.7")
	Glow:SetPos(self.Entity:GetPos())
	Glow:SetParent(self.Entity)
	Glow:Spawn()
	Glow:Activate()

	Shine = ents.Create("env_sprite")
	Shine:SetPos(self.Entity:GetPos())
	Shine:SetKeyValue("renderfx", "0")
	Shine:SetKeyValue("rendermode", "5")
	Shine:SetKeyValue("renderamt", "255")
	Shine:SetKeyValue("rendercolor", "255 130 100")
	Shine:SetKeyValue("framerate12", "20")
	Shine:SetKeyValue("model", "light_glow03.spr")
	Shine:SetKeyValue("scale", ".7")
	Shine:SetKeyValue("GlowProxySize", "13")
	Shine:SetParent(self.Entity)
	Shine:Spawn()
	Shine:Activate()

	self.valid = true
end   

function ENT:Think()
	if !self:IsValid() or !self.valid then return end
	if self.Impacted then self.Impacted = false end

	if self.Timeleft < CurTime() then
		self:Impact()			
	end
	
	if self.Flightvector:Length() < 10 or self.Riccochet >= 5 then
		self:Impact()
	end

	self.sound:Play()
	
	self.Flightvector = self.Flightvector - (self.Flightvector+(1024/self.Flightvector))/self.BallisticDrag + (VectorRand():GetNormalized()*self.Drift)*.512
	if !self.Impacted then
		self:SetPos(self:GetPos() + self.Flightvector)
	end	
	
	self:SetAngles(self.Flightvector:Angle())		

	local tr = util.TraceLine({
		start 	= self:GetPos(),
		endpos 	= self:GetPos() + self.Flightvector,
		filter 	= self.AircraftFiring, self.AircraftFiring.RearRotor,
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
			self:Impact(tr)
			return true
		end
		
		self:Impact(tr)
		
	end
	
	self:CreateEffect()
	
	self:NextThink( CurTime() )

	return true
end

function ENT:CreateEffect()
	if self:IsValid() then
		local ed=EffectData()
		ed:SetEntity(self)
		ed:SetOrigin(self:GetPos())
		ed:SetScale(self.Size)
		ed:SetNormal(self:GetForward())
		smoke = util.Effect("hvap_rocket_trail", ed)
	else return end
end

function ENT:Impact(tr)
	local effectdata = EffectData()
	effectdata:SetOrigin(tr.HitPos or self:GetPos())
	effectdata:SetNormal(tr.HitNormal or (self:GetPos() + self:GetForward()*2) )
	effectdata:SetStart(self.Flightvector:GetNormalized())
	effectdata:SetScale(self.EffectSize)
	effectdata:SetRadius(tr.MatType or 1 )
	util.Effect("hvap_rocket_explode", effectdata )
	util.ScreenShake(tr.HitPos or self:GetPos(), 10, 5, 0.4, self.Size*2.56 )
	util.Decal("scorch", tr.HitPos or self:GetPos() + tr.HitNormal, tr.HitPos - tr.HitNormal)

	util.BlastDamage(self.Owner, self.Owner, tr.HitPosor (self:GetPos() + self:GetForward()*2), self.Radius*2, self.TissueDamage*2)
	self:Remove()
end

function ENT:OnRemove()
	self.sound:Stop()
end

end
