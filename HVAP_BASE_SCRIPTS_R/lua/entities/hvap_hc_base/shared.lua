
if !hvap or !hvap.aircraft then
	error("hvap scripts not loaded.")
end

ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.PrintName = "Base Helicopter"
ENT.Author = hvap.author
ENT.Category = hvap.aircraft.spawnCategory
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.ishvapAircraft = true

ENT.ExhaustPos = Vector(-60,0,60)
ENT.FuselageHealth = 1000

ENT.Fuel = 100
ENT.BaseFuel = 100
ENT.FuelConMult = 1
ENT.CoopEngines = true
--[[
ENT.Engines = {
	{
		pos = Vector(0,0,0),
		radius = 50,		
		info = {
			FirePos = Vector(0,0,0),-- relative to pos
			SmokePos = Vector(0,0,0),-- relative to pos
			EffectPos = Vector(0,0,0),-- relative to pos
			SmokeEffect = "hvap_smoke_trail",
			EngineEffect = "hvap_heatwave",
			engineHealth = 100,--health
			BaseHealth = 100,--must be same as BaseHealth
			Power = 1000,-- engine power in kW
			MaxRPM = 100,
			Consumption = 1,
		}
	}
}

ENT.Rotors = {
	{
		istail = false,
		pos = Vector(0,0,50),
		ang = Angle(0, 0, 0),
		model = "models/props_borealis/borealis_door001a.mdl",
		info = {
			Dir = 1,
			Mass = 256, --effects how shaky the aircraft is
			RotHealth = 100,--health
			BaseHealth = 100,--must be same as RotHealth
			MaxRPM = 2950
		}
	},
	
	{
		istail = true,
		pos = Vector(-185,-3,13),
		ang = Angle(0, 0, 0),
		model = "models/props_borealis/borealis_door001a.mdl",
		info = {
			Dir = 1,
			Mass = 256, --effects how shaky the aircraft is
			RotHealth = 100,--health
			BaseHealth = 100,--must be same as RotHealth
			MaxRPM = 2950
		}
	}
}

--[[
	Defines how the aircraft handles depending on where wind is coming from.
	Rotation defines how it rotates,
	Lift how it rises, sinks or gets pushed right/left,
	Rail defines how stable it is on its path, the higher the less it drifts when turning
]]

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
	Rotate = Vector(3.8, 3.8, 3.6),-- rotation multipliers (roll) (pitch) (yaw)
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
ENT.Lights = {}
ENT.Doors = {}

ENT.PlyDmgMult = 1 -- player damage multiplier
ENT.PlyDmgDist=50 -- max distance to damage player
ENT.PlyDmgDist=50 -- max distance to damage player

ENT.Function = 0
ENT.Function2 = 0

ENT.Skins = {}

ENT.Bodygroups = {}

ENT.Scale = 1

ENT.Anim1 = "" -- animation for function #3
ENT.Anim2 = "" -- animation for function #4
ENT.Bodygroup1 = "" -- bodygroup for function #5
ENT.Bodygroup2 = "" -- bodygroup for function #6
ENT.Boosters = { -- boosters for function #7

}

ENT.Throttle = "" -- throttle pose
ENT.StickP = "" -- stick pitch
ENT.StickR = "" -- stick roll
ENT.Pedals = "" -- pedal pose
ENT.GearUpAnim = "" --gear up animation
ENT.GearDownAnim = "" -- gear down animation
ENT.GearUp = "" -- gear up idle
ENT.GearDown = "" -- gear down idle
ENT.Pitch = "" -- elevator pose
ENT.Yaw = "" -- rudder pose
ENT.Roll = "" -- aileron pose

ENT.Seats = {
	{
		pos = Vector(68, 0, 48),
		exit = Vector(72,70,0),
	},
}

ENT.IgnoreDamage = true
ENT.hvap_ignore = true
ENT.Submersible = false
ENT.CrRotorWash = true

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
		local view = self:WorldToLocalAngles(p:GetAimVector():Angle())
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
