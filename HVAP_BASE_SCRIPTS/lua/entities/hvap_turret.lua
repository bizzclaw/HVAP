
AddCSLuaFile()

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
ENT.IsHVAP = true

ENT.IsHVAPAircraft = true
ENT.IsHVAPGround = false
ENT.AllowAmmo = true
ENT.AllowFuel = true
ENT.AllowRepair = true

function ENT:Initialize() 
	self.Entity:PhysicsInit( SOLID_NONE )
	self.Entity:SetMoveType( MOVETYPE_NONE )
	self.Entity:SetSolid( SOLID_BSP )	
	self.Owner=self.aircraft
	self.ph = self.Entity:GetPhysicsObject()
	self.valid = true
end

function ENT:Think()
	if !self.valid then return end
	return true
end

function ENT:DamageTurret(dmg)

end

function ENT:OnTakeDamage(dmg)
	self.aircraft:TakeDamageInfo(dmg)
end

function ENT:Use(a, b, c, d)
	self.aircraft:Use(a, b, c, d)
end

function ENT:Rearm()
	self.aircraft:Rearm()
end

function ENT:Refuel(amt)
	self.aircraft:Refuel(amt)
end

function ENT:Repair(amt)
	self.aircraft:Repair(amt)
end

function ENT:OnRemove()

end
