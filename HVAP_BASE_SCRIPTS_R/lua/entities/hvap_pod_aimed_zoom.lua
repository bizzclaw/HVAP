AddCSLuaFile("hvap_pod_aimed_zoom.lua")

ENT.Base = "hvap_pod_base"
ENT.Type = "anim"

ENT.PrintName = "ZOOM"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "ZOOM"
ENT.Ammo = 0
ENT.FireRate = 120
ENT.Force = 9999999999

ENT.Zoom = 0
ENT.CanShoot = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Ammo")
	self:NetworkVar("Int", 1, "Secondary")
	self:NetworkVar("Float", 0, "LastShot")
	self:NetworkVar("Float", 1, "NextShot")
end

if SERVER then

function ENT:Initialize()
	self:SetAmmo(self.Ammo)
	self:base("hvap_pod_base").Initialize(self)
end

function ENT:Think()

	self:SetSecondary(self.Zoom*500)

	if IsValid(self.seat) and self:canFire() and self.shouldShoot and self:GetNextShot() <= CurTime() then
		if !IsValid(self.seat:GetDriver()) then
			self.shouldShoot = false
		else
			self:fire()	
			self:SetLastShot(CurTime())
			self:SetNextShot(self:GetLastShot() + 60/self.FireRate)
		end
	end
	
	if self:GetNextShot() <= CurTime() and self:GetNextShot() != 0 then		
		self:stop()			
	end
	self:NextThink(CurTime())
	return true
end

function ENT:fire()
	if !self.shooting then
		self.shooting = true
	end

	self.Zoom = self.Zoom + 1
	
	if self.Zoom > 2 then
		self.Zoom = 0 
		self.Entity:EmitSound( "hvap/gun/optic/zoom.wav" )
	else 
		self.Entity:EmitSound( "hvap/gun/optic/zoom.wav" )
	end
			
	self:SetNextShot(self:GetLastShot() + 60/self.FireRate)
	
end

function ENT:stop()
	if self.shooting then
		self.shooting = false
	end				
end

end