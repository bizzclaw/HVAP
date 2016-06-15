
AddCSLuaFile("hvap_wheel.lua")

ENT.Base 				= "base_anim"
ENT.Type 				= "anim"

ENT.PrintName			= "HVAP Wheel"
ENT.Author				= hvap.author
ENT.Category			= ""
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""

ENT.Spawnable			= false
ENT.AdminSpawnable	= false
ENT.Disabled = false
ENT.valid = false

if SERVER then

function ENT:Initialize() 

	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )	
	self.phy = self.Entity:GetPhysicsObject()
	self.steerdir = 0
	self.angles = 0
	self.Force = 0
	self.TurnDirection=0
	self.valid = true
end

function ENT:Think()
	if !self.valid then return end
	local crt = CurTime()


	self:NextThink(crt)
	return true
end

function ENT:PhysicsUpdate(ph)
	if self.LastPhys == CurTime() then return end
	local vel = ph:GetVelocity()	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local lang = self.vehicle:LocalToWorldAngles(ang)
	local vehang = self.vehicle:GetAngles()
	local up = self:GetUp()
	local fwd = self:GetForward()
	local phm = FrameTime()*66

	if self.torque then
		ph:AddAngleVelocity(Vector(0,self.Force*6400*phm,0))
		ph:AddVelocity(self.Force*16*self.vehicle:GetForward()*phm)		
	end
	
	self.LastPhys = CurTime()
end

function ENT:DamageTurret(dmg)

end

function ENT:OnTakeDamage(dmg)
	self.vehicle:TakeDamageInfo(dmg)
end

function ENT:OnRemove()

end

end
