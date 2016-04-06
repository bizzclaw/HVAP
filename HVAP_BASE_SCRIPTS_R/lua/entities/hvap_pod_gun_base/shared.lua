
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
	fire = "", -- single fire sound
	shoot = "", -- sound played when firing
	stop = "", -- sound played when stop firing
	blankstop = "", -- sound played when firing but jammed
	blankshoot = "", -- sound played when stop firing but hammed 
	clickstop = "", -- sound plaed when near overheat
	clickshoot = "", -- sound plaed when near overheat stop
	Jam = "" -- sound to play when gun jams	
}

function ENT:addSounds()
	self.sounds = {}
	for name, value in pairs(self.Sounds) do
		if name != "BaseClass" then
			sound.Add({
				name = "hvap."..self.ClassName.."."..name,
				channel = CHAN_AUTO,
				soundlevel = (name == "shoot" and 145 or name == "stop" and 145 or name == "fire" and 145 or 100),
				sound = value
			})
			self.sounds[name] = CreateSound(self, "hvap."..self.ClassName.."."..name)
			if name == "shoot" then
				self.sounds[name]:SetSoundLevel(145)
			elseif name == "stop" then
				self.sounds[name]:SetSoundLevel(145)
			elseif name == "fire" then
				self.sounds[name]:SetSoundLevel(145)
			elseif name == "blankstop" then
				self.sounds[name]:SetSoundLevel(100)
			elseif name == "blankshoot" then
				self.sounds[name]:SetSoundLevel(100)
			elseif name == "clickstop" then
				self.sounds[name]:SetSoundLevel(100)
			elseif name == "clickshoot" then
				self.sounds[name]:SetSoundLevel(100)
			elseif name == "Jam" then
				self.sounds[name]:SetSoundLevel(100)
			end
		end
	end
end