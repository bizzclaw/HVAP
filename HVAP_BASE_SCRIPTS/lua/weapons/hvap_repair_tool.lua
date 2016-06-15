AddCSLuaFile( "hvap_repair_tool.lua" )

SWEP.Category = "HVAP SWeps"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.PrintName = "Repair Tool"
SWEP.Base = "weapon_base"
SWEP.Author = "The_HAVOK"
SWEP.DrawCrosshair = false
SWEP.Slot = 2

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_bar.mdl"
SWEP.WorldModel		= "models/weapons/w_bar.mdl"

SWEP.Primary.ClipSize		= 100
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= 100
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= "none"

function SWEP:Initialize()
	self.Welding = false
	self.UnWelding = false
end

function SWEP:PrimaryAttack() --repair
	if self:CanPrimaryAttack() then
		self.Welding = true
	else 
		self.Welding = false
	end
end

function SWEP:SecondaryAttack() --damage
	if self:CanSecondaryAttack() then
		self.UnWelding = true
	else
		self.UnWelding = false
	end
end

function SWEP:CanPrimaryAttack() 
	if self.UnWelding then
	return false
	end
end

function SWEP:Think()
	local crt =CurTime()

	
	
end

function SWEP:Repair()


end