
if !hvap or !hvap.aircraft then
	error("hvap scripts not loaded.")
end

ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.PrintName = "Base Emplacement"
ENT.Author = hvap.author
ENT.Category = hvap.aircraft.spawnCategory
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.ishvapAircraft = true

ENT.FuselageHealth = 1000

ENT.Weight = 1000

ENT.SeatSwitcherPos = Vector(0,0,50)

ENT.BullsEyePos	= Vector(20,0,50)

ENT.MaxEnterDistance = 50

ENT.WheelStabilize = -400
ENT.Wheels = {}

ENT.Weapons = {}
ENT.Weapons2 = {}
ENT.CounterMeasures = {}

ENT.PlyDmgMult = 1 -- player damage multiplier
ENT.PlyDmgDist=50 -- max distance to damage player
ENT.PlyDmgDist=50 -- max distance to damage player

ENT.Seats = {
	{
		pos = Vector(68, 0, 48),
		exit = Vector(72,70,0),
	},
}

ENT.IgnoreDamage = true
ENT.hvap_ignore = true
ENT.Submersible = false
ENT.CrRotorWash = false

ENT.thirdPerson = {
	distance = 600,
	angle = 10,
	position = Vector(-50,0,100)
}

ENT.HatingNPCs={
	"CombineElite",
	"npc_combinegunship",
	"npc_combine_s",
	"npc_helicopter",
	"npc_manhack",
	"npc_metropolice",
	"CombinePrison",
	"PrisonShotgunner",
	"npc_rollermine",
	"npc_clawscanner",
	"ShotgunSoldier",
	
	"npc_stalker",
	"npc_strider",
	"npc_turret_floor",
	"npc_combine_camera",
	"npc_turret_ceiling",
	"npc_hunter",
	"npc_antlion",
	"PrisonShotgunner",
	"npc_antlion_grub",
	"npc_antlionguard",
	"npc_antlionguardian",
	"npc_antlion_worker",
	"npc_barnacle",
	"npc_headcrab_fast",
	"npc_fastzombie",
	"npc_fastzombie_torso",
	"npc_headcrab",
	"npc_headcrab_black",
	"npc_poisonzombie",
	"npc_zombie",
	"npc_zombie_torso",
	"npc_zombine",
	"npc_cscanner",
	"npc_combinedropship",
}

ENT.Sounds = {
	Burning = "hvap/tank/tank_fire_0"..math.random(1,3)..".wav",
	Spinout = ""
}

function ENT:addSounds()
	self.sounds = {}
	for name, value in pairs(self.Sounds) do
		if name != "BaseClass" then
			sound.Add({
				name = "hvap."..self.ClassName.."."..name,
				channel = CHAN_AUTO,
				soundlevel = 100,
				sound = value
			})
			self.sounds[name] = CreateSound(self, "hvap."..self.ClassName.."."..name)

		end
	end
end

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "Switcher")
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

function ENT:updateSkin(n)
	if SERVER then
		for _, e in pairs(self.entities) do
			if IsValid(e) then
				e:SetSkin(n)
			end
		end
	end
end

function ENT:getPassenger(seat)
	if !IsValid(self:GetSwitcher()) then return end
	local s = self:GetSwitcher().seats[seat]
	if IsValid(s) then
		return s:GetDriver()
	end
end

function ENT:getCameraAngles()
	if !self.Camera then return nil end
	local p = self:getPassenger(self.Camera.seat)
	if IsValid(p) then
		local view = self.seats[self.Camera.seat]:WorldToLocalAngles(p:GetAimVector():Angle())
		ang = Angle(self.Camera.restrictPitch and 0 or view.p, self.Camera.restrictYaw and 0 or view.y, 0)
		if self.Camera.minAng then
			ang.p = (ang.p > self.Camera.minAng.p and ang.p or self.Camera.minAng.p)
			ang.y = (ang.y > self.Camera.minAng.y and ang.y or self.Camera.minAng.y)
		end
		if self.Camera.maxAng then
			ang.p = (ang.p < self.Camera.maxAng.p and ang.p or self.Camera.maxAng.p)
			ang.y = (ang.y < self.Camera.maxAng.y and ang.y or self.Camera.maxAng.y)
		end
	else return nil end
	return self:LocalToWorldAngles(ang)
end
