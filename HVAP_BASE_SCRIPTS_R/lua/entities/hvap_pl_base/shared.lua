
if !hvap or !hvap.aircraft then
	error("hvap scripts not loaded.")
end

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"

ENT.PrintName = "Base Plane"
ENT.Author = hvap.author
ENT.Category = hvap.aircraft.spawnCategory
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.ishvapAircraft = true

ENT.FuselageHealth = 1000

ENT.Fuel = 100
ENT.BaseFuel = 100
ENT.FuelConMult = 1

ENT.Aerodynamics = {
	Rotation = {
		Forwards = Vector(0, -2, 0),-- rotate aircraft for (left) (down) (right) when moving forwards | 0,8,0 |
		Right = Vector(1, 0, 0), -- rotate aircraft for (left) (up) (right) when moving right | 0,0,0 |
		Up = Vector(0, 1, 0) -- rotate aircraft for (right) (down) (left) when moving up | 0,0,0 |
	},
	Movement = {
		Forwards = Vector(-1, 0, -2), -- move aircraft for (forwards) (right) (up) when moving forwards | 0,0,-4 |
		Right = Vector(0, -1, 0), -- move aircraft for (backwards) (right) (down) when moving right | 0,0,0 |
		Up = Vector(1, 0, -2) -- move aircraft for (forwards) (right) (up) whem moving up | 1,0,-2 |
	},
	Rail = Vector(0.01, 0.01, 0.01),-- 0,0,0
	RailRotor = 1, -- like Z rail but only active when moving and the rotor is turning
	AngleDrag = Vector(0.1, 0.1, 0.1),
	Rotate = Vector(4, 3.5, 4),-- rotation multipliers (roll) (pitch) (yaw)
}

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

ENT.Scale = 1

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

ENT.Sounds = {
	Start = "hvap/engine/air/helicopter/shared/heli_start_1.wav",

	RPM1 = "hvap/engine/air/plane/attacker_01/external_800.wav",
	RPM2 = "hvap/engine/air/plane/attacker_01/external_1600.wav",
	RPM3 = "hvap/engine/air/plane/attacker_01/external_2000.wav",
	RPM4 = "hvap/engine/air/plane/attacker_01/external_2000.wav",
	RPM5 = "hvap/engine/air/plane/attacker_01/external_2500.wav",
	
	RPM1in = "hvap/engine/air/plane/attacker_01/internal_800.wav",
	RPM2in = "hvap/engine/air/plane/attacker_01/internal_1600.wav",
	RPM3in = "hvap/engine/air/plane/attacker_01/internal_2000.wav",
	RPM4in = "hvap/engine/air/plane/attacker_01/internal_2000.wav",
	RPM5in = "hvap/engine/air/plane/attacker_01/internal_2500.wav",

	MissileAlert = "hvap/alarm/missilenearby.wav",
	MinorAlarm = "hvap/alarm/minor_alarm.wav",
	LowHealth = "hvap/alarm/low_health.wav",
	CrashAlarm = "hvap/alarm/crash_alarm.wav",
	Burning = "hvap/tank/tank_fire_0"..math.random(1,3)..".wav",
	Stall = ""
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
			if name == "RPM1" then
				self.sounds[name]:SetSoundLevel(132)
			elseif name == "RPM2" then
				self.sounds[name]:SetSoundLevel(132)
			elseif name == "RPM3" then
				self.sounds[name]:SetSoundLevel(132)
			elseif name == "RPM4" then
				self.sounds[name]:SetSoundLevel(132)
			elseif name == "RPM5" then
				self.sounds[name]:SetSoundLevel(132)
			elseif name == "RPM1in" then
				self.sounds[name]:SetSoundLevel(75)
			elseif name == "RPM2in" then
				self.sounds[name]:SetSoundLevel(75)
			elseif name == "RPM3in" then
				self.sounds[name]:SetSoundLevel(75)
			elseif name == "RPM4in" then
				self.sounds[name]:SetSoundLevel(75)
			elseif name == "RPM5in" then
				self.sounds[name]:SetSoundLevel(75)
			elseif name == "Start" then
				self.sounds[name]:SetSoundLevel(90)
			elseif name == "Stall" then
				self.sounds[name]:SetSoundLevel(90)
			end
		end
	end
end

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Hover")
	self:NetworkVar("Entity", 0, "Switcher")
end
