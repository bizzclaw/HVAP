AddCSLuaFile()

ENT.Base = "hvap_pod_base"
ENT.Type = "point"

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
ENT.Levels = 4

ENT.Zoom = 0
ENT.CanShoot = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Ammo")
	self:NetworkVar("Int", 1, "Secondary")
	self:NetworkVar("Float", 0, "LastShot")
	self:NetworkVar("Float", 1, "NextShot")
end

if CLIENT then

function ENT:drawCrosshair()
	surface.SetDrawColor(255,255,255,150)
	local center = {x=ScrW()/2, y=ScrH()/2}
	surface.DrawLine(center.x+10, center.y, center.x+30, center.y)
	surface.DrawLine(center.x-30, center.y, center.x-10, center.y)
	surface.DrawLine(center.x, center.y+10, center.x, center.y+30)
	surface.DrawLine(center.x, center.y-30, center.x, center.y-10)
	surface.DrawOutlinedRect(center.x-10, center.y-10, 20, 20)
	surface.DrawOutlinedRect(center.x-11, center.y-11, 22, 22)
end

elseif SERVER then

function ENT:Initialize()
	self:SetAmmo(self.Ammo)
	self:base("hvap_pod_base").Initialize(self)
end

function ENT:Think()

	self:SetSecondary(self.Zoom*256)

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
	
	if self.Zoom > self.Levels then
		self.Zoom = 0 
		sound.Play( "HVAP.Switch.Zoom", self:GetPos() )	
	else 
		sound.Play( "HVAP.Switch.Zoom", self:GetPos() )	
	end
			
	self:SetNextShot(self:GetLastShot() + 60/self.FireRate)
	
end

function ENT:stop()
	if self.shooting then
		self.shooting = false
	end				
end

end