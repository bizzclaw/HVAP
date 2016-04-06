
AddCSLuaFile("hvap_turret_g.lua")

ENT.Base 				= "base_anim"
ENT.Type 				= "anim"

ENT.PrintName			= "HVAP Turret"
ENT.Author				= hvap.author
ENT.Category			= ""
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""

ENT.Spawnable			= false
ENT.AdminSpawnable	= false
ENT.Disabled = false
ENT.Pitch = true	
ENT.Yaw = true
ENT.valid = false

function ENT:Initialize() 
	self.Entity:PhysicsInit( SOLID_BSP )
	self.Entity:SetMoveType( MOVETYPE_NONE )
	self.Entity:SetSolid( SOLID_BSP )	
	self.ph = self.Entity:GetPhysicsObject()
--	self.ph:SetMass(128)
--	self.ph:EnableGravity(false)
--	self.ph:EnableDrag(false)

	self.valid = true
end

function ENT:Think()
	return true
end

function ENT:DamageTurret(dmg)

end

function ENT:OnTakeDamage(dmg)
	self.aircraft:TakeDamageInfo(dmg)
end

function ENT:OnRemove()

end