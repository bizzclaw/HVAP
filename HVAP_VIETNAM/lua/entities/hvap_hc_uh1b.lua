AddCSLuaFile("hvap_hc_uh1b.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Vietnam"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 1
ENT.PrintName = "UH-1B Iroquois"

ENT.Model = "models/FSX/Helicopters/uh-1 iroquois.mdl"
ENT.Weight = 2700--empty weight in kg 
ENT.FuselageHealth = 500 --idk

ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 48 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 3.5 -- fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(-60,0,98),	
		radius = 42, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(0,0,10),-- fire, relative to pos
			SmokePos = Vector(-20,0,10),-- smoke, relative to pos
			EffectPos = Vector(-20,0,8),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 256, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 256, -- base health of engine
			Power = 1640 ,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(-2,0,90),
		ang = Angle(0, 0, 0),
		model =  "models/FSX/Helicopters/uh-1 iroquois_rotor.mdl",
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
		pos = Vector(-302.67,0,118.66),
		ang = Angle(0, 0, 0),
		model = "models/FSX/Helicopters/uh-1 iroquois_tailrotor.mdl",
		info = {
			Dir = 1,
			Mass = 5, --effects how shaky the aircraft is
			RotHealth = 64,--initial rotor health should be same as BaseHealth
			BaseHealth = 64,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	}
}

ENT.thirdPerson = {
	distance = 512,
	angle = 4,
	position = Vector(-64,0,256)
}

ENT.Seats = {
	{
		pos=Vector(82,24.5,36),
		exit=Vector(100,-120,10),
	},
	{
		pos=Vector(82, -20, 36),
		exit=Vector(100,120,10),
	},
	{
		pos=Vector(20,-24.5,39),
		exit=Vector(20,-120,10),
	},
	{
		pos=Vector(20,0,39),
		exit=Vector(40,-120,10),
	},
	{
		pos=Vector(20, 24.5, 39),
		exit=Vector(20,120,10),
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

ENT.Weapons = {
	["GAU-17/A"] = {
		class = "hvap_pod_m134",
		info = {
			Pods = {
				Vector(25,86.817,32.261),
				Vector(25,-86.298,32.261),
			},
			Ammo = 1500,
			Sequential = false
		}
	},
	["Hydra 70 Left"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(4.485,74.554,23.97),
			},
			Ammo = 7,
		}
	},
}

ENT.Weapons2 = {
	["M60"] = {
		class = "hvap_pod_m60",
		info = {
			Pods = {
				Vector(53.397,62.987,66.09),
				Vector(53.372,-62.493,66.09),
			},
			Ammo = 800,
			Sequential = false
		}
	},
	["Hydra 70 Right"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(4.485,-74.035,23.97),
			},
			Ammo = 7,
		}
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
	Rotate = Vector(3.1, 3, 3.3),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "hvap/engine/air/helicopter/shared/heli_start_5.wav", -- heli_start_#
	Cockpit = "hvap/engine/air/helicopter/hc_2/cockpit.wav", -- cockpit

	RotorNear = "hvap/engine/air/helicopter/hc_6/rotor_close.wav", -- rotor_close
	RotorFar = "hvap/engine/air/helicopter/hc_6/rotor_far.wav", -- rotor_far
	
	EngineNear = "hvap/engine/air/helicopter/hc_6/engine_close.wav", -- engine_close
	EngineFar = "hvap/engine/air/helicopter/hc_6/engine_far.wav", -- engine_far	
	EngineWhine = "hvap/engine/air/helicopter/hc_6/turbine.wav", -- turbine
}
