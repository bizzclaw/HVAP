
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

ENT.IsHVAPAircraft = false
ENT.IsHVAPGround = true
ENT.AllowAmmo = true
ENT.AllowFuel = false
ENT.AllowRepair = true

if SERVER then

function ENT:Initialize() 
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self.phys = self:GetPhysicsObject()
	if self.phys:IsValid() then
		self.phys:EnableDrag(false)
		self.phys:Wake()
	end		
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

end