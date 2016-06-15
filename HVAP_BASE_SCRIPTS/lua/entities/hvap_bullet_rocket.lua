
AddCSLuaFile()

ENT.Type 			= "anim"  
ENT.Base 			= "base_anim"     
ENT.PrintName			= "Rocket"  
ENT.Author			= "The_HAVOK"  
ENT.Contact			= "The_HAVOK"  
ENT.Purpose			= ""  
ENT.Instructions		= ""  
 
ENT.Spawnable			= false


ENT.valid = false

if CLIENT then

function ENT:Draw()            
	self.Entity:DrawModel()
end

elseif SERVER then

function ENT:Initialize()   
	math.randomseed(CurTime())
	self.Flightvector 	= self:GetForward()*(self.Speed*52.459*FrameTime())
	self.Timeleft 		= CurTime() + 10
	self.Impacted 		= false
	self:SetModel( self.Mdl )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_FLYGRAVITY )
	self:SetSolid( SOLID_NONE )
	self:GetPhysicsObject():SetMass(1024)
	self:DrawShadow(false)
	self:SetNoDraw(false)
	self.Ricochet=0
	
	Glow = ents.Create("env_sprite")
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
	
	local crt = CurTime()
	
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
		
		self:Impact(tr)
	else
		self.Flightvector = self.Flightvector - ((self.Flightvector/self.BallisticDrag) + (VectorRand():GetNormalized()*self.Drift))*.512 + Vector(0,0,-30)/self.Flightvector:Length()
		
		if !self.Impacted then
			self:SetPos(self:GetPos() + self.Flightvector)
			self:SetAngles(self.Flightvector:Angle())	
		else
			self.Impacted = false
		end
	end

	self:CreateEffect()
	
	self:NextThink( crt )
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
		effectdata:SetEntity(tr.Entity)
		effectdata:SetMagnitude(self.EffectSize)
		effectdata:SetNormal(tr.HitNormal)
		effectdata:SetOrigin(tr.HitPos)
		effectdata:SetScale(self.Size)
		effectdata:SetStart(self.Flightvector:GetNormalized())
		effectdata:SetSurfaceProp(tr.MatType or 1)
	util.Effect("hvap_rocket_explode", effectdata )
	util.BlastDamage( self.AircraftFiring or self, self.Owner or self, self:GetPos(), self.Radius, self.TissueDamage )
	self:Remove()
end

end
