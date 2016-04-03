
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
	Start = "hvap/engine/air/helicopter/shared/heli_start_1.wav", -- heli_start_#
	Cockpit = "hvap/engine/air/helicopter/hc_1/cockpit.wav", -- cockpit
	
	BladesNear = "hvap/engine/air/helicopter/hc_1/rotor_close.wav", -- rotor_close
	EngineNear = "hvap/engine/air/helicopter/hc_1/engine_close.wav", -- engine_close
	EngineWhine = "hvap/engine/air/helicopter/hc_1/turbine.wav", -- turbine
	
	BladesFar = "hvap/engine/air/helicopter/hc_1/rotor_far.wav", -- rotor_far
	EngineFar = "hvap/engine/air/helicopter/hc_1/engine_far.wav", -- engine_far

	MissileAlert = "hvap/alarm/missilenearby.wav",
	MinorAlarm = "hvap/alarm/minor_alarm.wav",
	LowHealth = "hvap/alarm/low_health.wav",
	CrashAlarm = "hvap/alarm/crash_alarm.wav",
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
				soundlevel = (name == "RotorNear" and 116 or name == "RotorFar" and 132 or name == "EngineNear" and 105 or name == "EngineFar" and 120 or name == "EngineWhine" and 80 or 100),
				sound = value
			})
			self.sounds[name] = CreateSound(self, "hvap."..self.ClassName.."."..name)
			if name == "RotorNear" then
				self.sounds[name]:SetSoundLevel(116)
			elseif name == "RotorFar" then
				self.sounds[name]:SetSoundLevel(132)
			elseif name == "EngineNear" then
				self.sounds[name]:SetSoundLevel(105)
			elseif name == "EngineFar" then
				self.sounds[name]:SetSoundLevel(120)
			elseif name == "EngineWhine" then
				self.sounds[name]:SetSoundLevel(80)
			elseif name == "Cockpit" then
				self.sounds[name]:SetSoundLevel(75)
			end
		end
	end
end

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Hover")
	self:NetworkVar("Entity", 0, "Switcher")
end
