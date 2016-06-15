AddCSLuaFile("hvap_bullet_cm_flare.lua")

ENT.Type 			= "anim"  
ENT.Base 			= "base_anim"     
ENT.PrintName			= "Flare"  
ENT.Author			= "The_HAVOK"  
ENT.Contact			= "The_HAVOK"  
ENT.Purpose			= ""  
ENT.Instructions		= ""  
 
ENT.Spawnable			= false
ENT.AdminSpawnable		= false

if CLIENT then 

function ENT:Draw()            
end

function ENT:Initialize()
pos = self:GetPos()
self.emitter = ParticleEmitter( pos )
end

function ENT:Think()
	
	pos = self:GetPos()
	for i=0, (1) do
		local particle = self.emitter:Add( "particle/smokesprites_000"..math.random(1,9), pos + (self:GetForward() * -100 * i))
		if (particle) then
			particle:SetVelocity((self:GetForward() *1) )
			particle:SetDieTime( math.Rand( 2, 3 ) )
			particle:SetStartAlpha( math.Rand( 24, 48 ) )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( 16 )
			particle:SetEndSize( 32 )
			particle:SetRoll( math.Rand(0, 360) )
			particle:SetRollDelta( math.Rand(-1, 1) )
			particle:SetColor( math.Rand(193, 197) , math.Rand(188, 192) , math.Rand(178, 182) ) 
			particle:SetAirResistance( 200 ) 
		end		
	end

end

elseif SERVER then

function ENT:Initialize()
math.randomseed(CurTime())
self.Data 		= self.Entity:GetVar("Data")
self.Flightvector 	= self.Entity:GetForward()*((self.Speed*52.5)/66)
self.Timeleft 		= CurTime() + 24
self.Entity:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )
self.Entity:SetMoveType( MOVETYPE_NONE )
self.Entity:SetSolid( SOLID_NONE )
self.Entity:DrawShadow(false)

	local trail=util.SpriteTrail(self.Entity, 0, Color(255, 200, 100), true, 2, 0, .512, 1/120*0.5, "trails/hvap_tracer.vmt")
	local light = ents.Create("env_sprite")
	light:SetPos(self.Entity:GetPos())
	light:SetKeyValue("renderfx", "0")
	light:SetKeyValue("rendermode", "5")
	light:SetKeyValue("renderamt", "255")
	light:SetKeyValue("rendercolor", "255 200 100")
	light:SetKeyValue("framerate12", "20")
	light:SetKeyValue("model", "light_glow03.spr")
	light:SetKeyValue("scale", "1")
	light:SetKeyValue("GlowProxySize", "32")
	light:Spawn()
	light:SetParent(self.Entity)	
	
self:Think()
end

 function ENT:Think()
	if !self.Entity:IsValid() then return end
		if self.Timeleft < CurTime() then
			self.Entity:Remove()			
		end
		
	local tr = util.TraceLine( {
		start 	= self.Entity:GetPos(),
		endpos 	= self.Entity:GetPos() + self.Flightvector,
		filter 	= {self.Entity, self.AircraftFiring},
		mask 	= MASK_SOLID_BRUSHONLY	
	} )
	
	if tr.Hit then
		if tr.HitSky then
			self.Entity:Remove()
			return true
		end
		
		if tr.MatType==83 then
			local effectdata = EffectData()
			effectdata:SetOrigin( tr.HitPos )
			effectdata:SetNormal( tr.HitNormal )
			effectdata:SetScale( 15*self.EffectSize )
			util.Effect( "watersplash", effectdata )
		end
		
		util.Decal("fadingScorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		self.Entity:Remove()
		return true
	end		
		
	self.Entity:SetPos(self.Entity:GetPos() + self.Flightvector)
	
	self.Flightvector = self.Flightvector - self.Flightvector/self.BallisticDrag + (VectorRand():GetNormalized()*self.Drift) + Vector(0,0,-0.111)
	self.Entity:SetAngles(self.Flightvector:Angle() + Angle(0,0,0))
	self.Entity:NextThink( CurTime() )
return true
end

end