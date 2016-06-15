
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
ENT.Heat = 0
ENT.FireRate = 100 -- rpm

ENT.Sounds = {}

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

function ENT:base(name)
	local current = self
	while current do
		if current.ClassName == name then
			return current
		end
		current = current.BaseClass
	end
	error("No base class with name \"" .. name .. "\"", 2)
end