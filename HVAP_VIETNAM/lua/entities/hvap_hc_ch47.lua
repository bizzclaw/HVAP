AddCSLuaFile("hvap_hc_ch47.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Community Helicopters"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 1
ENT.PrintName = "CH-47 Chinook"

ENT.Model = "models/wac/ch47b.mdl"
ENT.Weight = 5255 --empty weight in kg 
ENT.FuselageHealth = 500 --idk
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 100 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 4 -- fuel consumption multiplier
ENT.CoopEngines = false -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(-192,58,166),	
		radius = 42, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-2,16,4),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-24,0,1),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 140, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 140, -- base health of engine
			Power = 1400,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(-192,-58,166),	
		radius = 42,
		info = {
			FirePos = Vector(-2,-16,4),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-24,0,1),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 140, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 140, -- base health of engine
			Power = 1400,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(288,0,181),
		ang = Angle(0, 0, 0),
		model =  "models/wac/chinookbladerr.mdl",
		info = {
			Dir = -1,
			Mass = 25, --effects how shaky the aircraft is
			RotHealth = 128,--initial rotor health should be same as BaseHealth
			BaseHealth = 128,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	},
	
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(-246,0,247),
		ang = Angle(0, 0, 0),
		model = "models/wac/chinookbladef.mdl",
		info = {
			Dir = 1,
			Mass = 25, --effects how shaky the aircraft is
			RotHealth = 128,--initial rotor health should be same as BaseHealth
			BaseHealth = 128,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	}
}

ENT.thirdPerson = {
	distance = 640,
	angle = 4,
	position = Vector(-64,0,256)
}

ENT.Seats = {
	{
		pos=Vector(284, 30, 77),
		exit=Vector(195,0,50),
	},
	{
		pos=Vector(284, -29, 77),
		exit=Vector(195,0,50),
	},
	{
		pos=Vector(110, -45, 65),
		exit=Vector(110,0,50),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(40, -45, 65),
		exit=Vector(40,0,50),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(-50, -45, 65),
		exit=Vector(-50,0,50),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(-50, 45, 65),
		exit=Vector(-50,0,50),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(40, 45, 65),
		exit=Vector(40,0,50),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(115, 45, 65),
		exit=Vector(115,0,50),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(-115, 45, 65),
		exit=Vector(-115,0,50),
		ang=Angle(0,-90,0),
	},
}

ENT.CounterMeasures = {
	["Flares"] = {
		class = "hvap_pod_cm_smoke",
		info = {
			Pods = {
				Vector(-34,34,58),
				Vector(-34,-34,58),
			},
			Angles = {
				Angle(15,-90,0),
				Angle(15,90,0),
			},
		}
	}
}

ENT.Wheels={
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-204,-74,32),
		friction=100,
		mass=400,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-204,73,32),
		friction=100,
		mass=400,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(104,-71.8,16),
		friction=100,
		mass=400,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(104,72,16),
		friction=100,
		mass=400,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(104,-56,16),
		friction=100,
		mass=400,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(104,56.3,16),
		friction=100,
		mass=400,
	},
}


ENT.Aerodynamics = {
	Rotation = {
		Forwards = Vector(0, -1, 0),-- rotate aircraft for (left) (down) (right) when moving forwards | 0,8,0 |
		Right = Vector(2, 0, 0), -- rotate aircraft for (left) (up) (right) when moving right | 0,0,0 |
		Up = Vector(0, 3, 0) -- rotate aircraft for (right) (down) (left) when moving up | 0,0,0 |
	},
	Movement = {
		Forwards = Vector(0, 0, -2), -- move aircraft for (forwards) (right) (up) when moving forwards | 0,0,-4 |
		Right = Vector(0, -1, 0), -- move aircraft for (backwards) (right) (down) when moving right | 0,0,0 |
		Up = Vector(4, 0, -1) -- move aircraft for (forwards) (right) (up) whem moving up | 1,0,-2 |
	},
	Rail = Vector(3, 2, 1),-- 0,0,0
	RailRotor = 1, -- like Z rail but only active when moving and the rotor is turning
	AngleDrag = Vector(0.1, 0.1, 0.1),
	Rotate = Vector(2.3, 1.8, 1.8),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "hvap/engine/air/helicopter/shared/heli_start_5.wav", -- heli_start_#
	Cockpit = "hvap/engine/air/helicopter/hc_4/cockpit.wav", -- cockpit

	RotorNear = "hvap/engine/air/helicopter/hc_4/rotor_close.wav", -- rotor_close
	RotorFar = "hvap/engine/air/helicopter/hc_4/rotor_far.wav", -- rotor_far
	
	EngineNear = "hvap/engine/air/helicopter/hc_4/engine_close.wav", -- engine_close
	EngineFar = "hvap/engine/air/helicopter/hc_4/engine_far.wav", -- engine_far	
	EngineWhine = "hvap/engine/air/helicopter/hc_4/turbine.wav", -- turbine
}
