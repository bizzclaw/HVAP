
ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.PrintName = "Base Helicopter"
ENT.Author = hvap.author
ENT.Category = hvap.aircraft.spawnCategory
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Name = "Base"
ENT.Ammo = 10
ENT.FireRate = 60
ENT.CanShoot = true
ENT.Overheated = false
ENT.shooting = false
ENT.CurrentHeat = 0
ENT.SndPitch = 100

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

ENT.Sounds = {
	shoot = {
		"",
	},
	reload = {
		""
	}
}