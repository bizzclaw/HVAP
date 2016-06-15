
ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.PrintName = "Base Gat"
ENT.Author = hvap.author
ENT.Category = hvap.aircraft.spawnCategory
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Name = "Base"
ENT.Ammo = 0
ENT.FireRate = 600
ENT.Force = 9999999999

ENT.Belt = 1

ENT.CoolDown = 1
ENT.HeatMult = 1
ENT.HeatTime = 1
ENT.Caliber = 1
ENT.Spread = 1
ENT.SndPitch = 100

ENT.CanShoot = true
ENT.Overheated = false
ENT.shooting = false
ENT.CurrentHeat = 0
ENT.SingleFire = false
ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Ammo");
	self:NetworkVar("Int", 1, "Secondary");
	self:NetworkVar("Float", 0, "LastShot")
	self:NetworkVar("Float", 1, "NextShot")
end

function ENT:AddOnRemove(f)
	if type(f)=="function" then
		table.insert(self.OnRemoveFunctions,f)
	elseif type(f)=="Entity" or type(f)=="Vehicle" then
		table.insert(self.OnRemoveEntities,f)
	end
end

function ENT:addSounds()
	self.sounds = {}
	for k, v in pairs(self.Sounds) do
		if k != "BaseClass" then
			self.sounds[k] = CreateSound(self, v)
		end
	end
end

ENT.Sounds = {
	start = "", -- sound played when firing
	loop = "", -- sound played when firing
	stop = "", -- sound played when stop firing
	blankshoot = "", -- sound played when stop firing but hammed 
	clickstop = "", -- sound plaed when near overheat
	clickshoot = "", -- sound plaed when near overheat stop
	Jam = "", -- sound to play when gun jams
	GunReady = ""
}
