AddCSLuaFile("hvap_pl_c172.lua")

ENT.Base = "hvap_pl_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategory
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 60
ENT.PrintName = "Cessna C172"
ENT.AdminOnly = true

ENT.Model = "models/cessna/cessna172.mdl"
ENT.Weight = 722--empty weight in kg -engine
ENT.FuselageHealth = 512 --idk make it non retarded, based off size and or armor
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 128 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 100 -- idk

ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 3 -- overall fuel consumption multiplier

ENT.CenterOfMass = Vector(20,0,0)

ENT.MaxSpeed = 302
ENT.CruiseSpeed = 226 
ENT.MinSpeed = 87
ENT.Engines = {
	{
		pos = Vector(64,0,0),	
		radius = 70, -- max dist damage to engine to deal damage, closer means more dmg 
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-32,0,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "", -- exhaust effect
			engineHealth = 512, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 512, -- base health of engine
			Power = 160,-- engine power in kW --x2 for single engine  750
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	}
}

ENT.Rotors = {
	{
		pos = Vector(83,0,0.5),
		ang = Angle(0, 0, 0),
		model = "models/cessna/cessna172_prop.mdl",
		info = {
			Dir = -1,
			Mass = 16, --effects how shaky the aircraft is
			RotHealth = 100,--initial rotor health should be same as BaseHealth
			BaseHealth = 100,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	}
}

ENT.thirdPerson = {
	distance = 800,
	angle = 5,
	position = Vector(-50,0,200)
}

ENT.Seats = {
	{
		pos = Vector(1.4, 9.5, -10),
		exit = Vector(60, 50, -45),
		weapons = {"M134"},
		weapons2 = {"Hydra 70"}	
	},
	{
		pos = Vector(1.4, -9.5, -10),
		exit = Vector(60, -50, -45),
	},
	{
		pos = Vector(-40,-10,-13),
		exit = Vector(-50, -70, -45),
	},
	{
		pos = Vector(-40,10,-13),
		exit = Vector(-50, 70, -45),
	},
}

ENT.Weapons = {
	["M134"] = {
		class = "hvap_pod_m134", --hvap_pod_mg_m134
		info = {
			Pods = {
				Vector(40,40,30),
				Vector(40,-40,30),
			},
			Sequential = true,--fire all simultaneously?			
			Ammo = 1500,--750 a195
			FireRate = 3000,--2000low 3000fixed 6000high
		}
	}
}

ENT.Weapons2 = {
	["Hydra 70"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(50,50,40),
				Vector(50,-50,40),
			},
			Sequential = false,
			Ammo = 14,
		}
	}
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

ENT.Wheels = {
	{
		mdl = "models/cessna/cessna172_mlwheel.mdl",
		pos = Vector(-13.73,45.36,-39),
		friction = 1,
		mass = 100,
	},
	{
		mdl = "models/cessna/cessna172_mwheel.mdl",
		pos = Vector(-13.73,-45.36,-39),
		friction = 1,
		mass = 100,
	},
	{
		mdl = "models/cessna/cessna172_nwheel.mdl",
		pos = Vector(53.31,0,-41.89),
		friction = 4,
		mass = 400,
	},
}

ENT.Aerodynamics = {
	Rotation = {
		Forwards = Vector(0, 0, 0),-- rotate aircraft for (left)R (down)P (right)Y when moving forwards | 0,0.5,0 |
		Right = Vector(3, 0, 5), -- rotate aircraft for (left)R (up)P (right)Y when moving right | 0,-5,0 |
		Up = Vector(0, 0, 0) -- rotate aircraft for (right) (down) (left) when moving up | 0,-8,0 |
	},
	Movement = {
		Forwards = Vector(0, 0, 6), -- move aircraft for (forwards) (right) (up) when moving forwards | 0,0,-4 | lift
		Right = Vector(0, -2, 0), -- move aircraft for (backwards) (right) (down) when moving right | 0,0,0 |
		Up = Vector(-8, 0, 0) -- move aircraft for (forwards) (right) (up) whem moving up | -5.12,0,0 | 
	},
	Rail = Vector(1, 2, 4), -- resist s left/right up/down
	RailRotor = 1, -- like Z rail but only active when moving and the rotor is turning
	AngleDrag = Vector(0.01, 0.01, 0.01),
	Rotate = Vector(3, 3, 3),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "hvap/engine/air/helicopter/shared/heli_start_1.wav", -- heli_start_#
	Cockpit = "hvap/engine/air/helicopter/hc_1/cockpit.wav", -- cockpit

	RotorNear = "hvap/engine/air/helicopter/hc_1/rotor_close.wav", -- rotor_close
	RotorFar = "hvap/engine/air/helicopter/hc_1/rotor_far.wav", -- rotor_far
	
	EngineNear = "hvap/engine/air/helicopter/hc_1/engine_close.wav", -- engine_close
	EngineFar = "hvap/engine/air/helicopter/hc_1/engine_far.wav", -- engine_far	
	EngineWhine = "hvap/engine/air/helicopter/hc_1/turbine.wav", -- turbine
}
