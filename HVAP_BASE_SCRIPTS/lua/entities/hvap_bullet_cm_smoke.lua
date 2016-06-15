AddCSLuaFile("hvap_bullet_cm_smoke.lua")

ENT.Type 			= "anim"  
ENT.Base 			= "base_anim"     
ENT.PrintName			= "Smoke"  
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
	pos = self:GetPos()
	for i = 1, 5.12 do
		local particle = self.emitter:Add( "particle/smokesprites_000"..math.random(1,9), pos + VectorRand()* -128)	
		if (particle) then
			particle:SetVelocity(VectorRand()*400)
			particle:SetDieTime( math.Rand( 16, 18 ) )
			particle:SetStartAlpha( math.Rand( 76.8, 100 ) )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( 400 )
			particle:SetEndSize( 512 )
			particle:SetRoll( math.Rand(0, 360) )
			particle:SetRollDelta( math.Rand(-.5, .5) )
			particle:SetColor( math.Rand(165, 167) , math.Rand(168, 162) , math.Rand(158, 152) ) 
			particle:SetAirResistance( 32 ) 
		end		
	end
end

elseif SERVER then

function ENT:Initialize()
	math.randomseed(CurTime())
	self.Timeleft 		= CurTime() + 16
	self.Entity:SetModel( "models/hunter/blocks/cube4x4x4.mdl" )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_NONE )
	self.Entity:SetSolid( SOLID_NONE )
	self.Entity:DrawShadow(false)
	self.Entity:SetNoDraw(true)
	self:Think()
end

function ENT:Think()
	if !self.Entity:IsValid() then return end
	if self.Timeleft < CurTime() then
		self.Entity:Remove()			
	end
	self.Entity:NextThink( CurTime() )
	return true
end

end