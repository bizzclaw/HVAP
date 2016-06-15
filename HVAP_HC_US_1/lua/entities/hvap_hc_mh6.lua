AddCSLuaFile("hvap_hc_mh6.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft US"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 1
ENT.PrintName = "MH-6 Little Bird"

ENT.Model = "models/flyboi/littlebird/littlebird_fb.mdl"
ENT.Weight = 722--empty weight in kg 
ENT.FuselageHealth = 350 --idk make it non retarded, based off size and or armor
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 128 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 3 -- overall fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(-60,0,50),	
		radius = 84, -- max dist damage to engine to deal damage, closer means more dmg 
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-32,0,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 256, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 256, -- base health of engine
			Power = 1600,-- engine power in kW --x2 for single engine 750
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(-10,0,100),
		ang = Angle(0, 0, 0),
		model = "models/flyboi/littlebird/littlebirdrotorm_fb.mdl",
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
		pos = Vector(-217,9,73),
		ang = Angle(0, 0, 0),
		model = "models/flyboi/littlebird/littlebirdt_fb.mdl",
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
		pos = Vector(22, 15, 49),
		exit = Vector(70,60,10),
		NoHud = true,
	},
	{
		pos = Vector(22, -12, 49),
		exit = Vector(70,-60,10),
		NoHud = true,
	},
	{
		pos = Vector(-5, -45, 35),
		exit = Vector(20,-100,10),
		NoHud = true,
	},
	{
		pos = Vector(-5, 45, 35),
		exit = Vector(20,100,10),
		NoHud = true,
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

ENT.Aerodynamics = {
	Rotation = {
		Forwards = Vector(0, -1, 0),-- rotate aircraft for (left) (down) (right) when moving forwards | 0,8,0 |
		Right = Vector(1, 0, 0), -- rotate aircraft for (left) (up) (right) when moving right | 0,0,0 |
		Up = Vector(0, 3, 0) -- rotate aircraft for (right) (down) (left) when moving up | 0,0,0 |
	},
	Movement = {
		Forwards = Vector(0, 0, -2), -- move aircraft for (forwards) (right) (up) when moving forwards | 0,0,-4 |
		Right = Vector(0, 0, 0), -- move aircraft for (backwards) (right) (down) when moving right | 0,0,0 |
		Up = Vector(4, 0, 0) -- move aircraft for (forwards) (right) (up) whem moving up | 1,0,-2 |
	},
	Rail = Vector(1, 1, 1),-- 0,0,0
	RailRotor = 1, -- like Z rail but only active when moving and the rotor is turning
	AngleDrag = Vector(0.1, 0.1, 0.1),
	Rotate = Vector(5, 4, 6),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "HVAP.Engine.HC_1.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_1.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_1.Rotor.Near", -- rotor_close
	RotorFar = "HVAP.Engine.HC_1.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_1.Engine.Near", -- engine_close
	EngineFar = "HVAP.Engine.HC_1.Engine.Far", -- engine_far	
	EngineWhine = "HVAP.Engine.HC_1.Rotor.Turbine", -- turbine
}
