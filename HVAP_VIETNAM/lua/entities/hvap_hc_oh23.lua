AddCSLuaFile("hvap_hc_oh23.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Vietnam"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 1
ENT.PrintName = "OH-23G Raven"

ENT.Model = "models/chippy/oh23g/body.mdl"
ENT.Weight = 1227--empty weight in kg 
ENT.FuselageHealth = 128 --idk make it non retarded, based off size and or armor
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 100 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 4.5 -- overall fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(-40,0,38),	
		radius = 38, -- max dist damage to engine to deal damage, closer means more dmg 
		info = {
			FirePos = Vector(-18,0,8),-- fire, relative to pos
			SmokePos = Vector(-8,0,0),-- smoke, relative to pos
			EffectPos = Vector(-6,0,6),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 85, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 85, -- base health of engine
			Power = 1870 ,-- engine power in kW --x4 for single engine  93
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(-0.71,0,109.12),
		ang = Angle(0, 0, 0),
		model = "models/chippy/oh23g/mainrotor.mdl",
		info = {
			Dir = -1,
			Mass = 5, --effects how shaky the aircraft is
			RotHealth = 100,--initial rotor health should be same as BaseHealth
			BaseHealth = 100,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	},
	{
		istail = true, -- is this rotor a tail rotor?
		pos = Vector(-241.20,-1.00,74.36),
		ang = Angle(0, 0, 0),
		model = "models/chippy/oh23g/tailrotor.mdl",
		info = {
			Dir = -1,
			Mass = 5, --effects how shaky the aircraft is
			RotHealth = 55,--initial rotor health should be same as BaseHealth
			BaseHealth = 55,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	}
}

ENT.thirdPerson = {
	distance = 400,
	angle = 5,
	position = Vector(-50,0,200)
}

ENT.Seats = {
	{
		pos=Vector(32.56,-0.7,31.35),
		exit=Vector(32.56,84.79,7),
	},
	{
		pos=Vector(32.56,16.57,31.35),
		exit=Vector(32.56,84.79,7),
	},
	{
		pos=Vector(32.56,-18.61,31.35),
		exit=Vector(32.56,84.79,7),
	},
}

ENT.CounterMeasures = {
	["IR Smoke"] = {
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
	Rotate = Vector(5, 4.5, 6.5),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "hvap/engine/air/helicopter/shared/heli_start_1.wav", -- heli_start_#
	Cockpit = "hvap/engine/air/helicopter/hc_4/cockpit.wav", -- cockpit

	RotorNear = "hvap/engine/air/helicopter/hc_1/rotor_close.wav", -- rotor_close
	RotorFar = "hvap/engine/air/helicopter/hc_1/rotor_far.wav", -- rotor_far
	
	EngineNear = "hvap/engine/air/helicopter/hc_1/engine_close.wav", -- engine_close
	EngineFar = "hvap/engine/air/helicopter/hc_1/engine_far.wav", -- engine_far	
	EngineWhine = "hvap/engine/air/helicopter/hc_1/turbine.wav", -- turbine
}
