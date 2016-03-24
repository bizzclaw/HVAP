AddCSLuaFile("hvap_hc_oh58d.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Vietnam"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 1.5
ENT.PrintName = "OH-58D Kiowa"

ENT.Model = "models/bf2/kiowa/body.mdl"
ENT.Weight = 1737--empty weight in kg 
ENT.FuselageHealth = 350 --idk make it non retarded, based off size and or armor
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 100 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 2 -- overall fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(-60,0,80),	
		radius = 64, -- max dist damage to engine to deal damage, closer means more dmg 
		info = {
			FirePos = Vector(-64,0,20),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-32,0,20),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 300, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 300, -- base health of engine
			Power = 970 ,-- engine power in kW --x2 for single engine  970
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(-35.5,2,96),
		ang = Angle(0, 0, 0),
		model = "models/bf2/kiowa/rotor.mdl",
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
		pos = Vector(-292.5,4,73.6),
		ang = Angle(0, 0, 0),
		model = "models/bf2/kiowa/tailrotor.mdl",
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
		pos=Vector(12, 14, 32),
		exit=Vector(28,50,10),
		weapons = {"M3P"},
		weapons2 = {"Hydra 70"}		
	},
	{
		pos=Vector(12, -9, 32),
		exit=Vector(38,-60,10),	
		weapons2 = {"Zoom"}
	},
}

ENT.Weapons = {
	["M3P"] = {
		class = "hvap_pod_m2",
		info = {
			Pods = {
				Vector(20,43,24),
			},
			Sequential = true,--fire all simultaneously?			
			Ammo = 1500,--750 a195
			FireRate = 1200,
		}
	}
}

ENT.CounterMeasures = {
	["Flares"] = {
		class = "hvap_pod_cm_flares",
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

ENT.Weapons2 = {
	["Hydra 70"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(20,-43,23),
			},
			Sequential = false,
			Ammo = 7,
			FireRate = 300
		}
	},
	["Zoom"] = {
		class = "hvap_pod_aimed_zoom",
		info = {
			ShootPos = Vector(0, 0, 0),
			ShootOffset = Vector(0, 0, 0)
		}
	}
}

ENT.WeaponAttachments = {
	radar1 = {
		model = "models/BF2/Kiowa/mms1.mdl",
		pos = Vector(-35.5,2,120),
	}
}

ENT.Camera = {
	model = "models/BF2/Kiowa/mms2.mdl",
	pos = Vector(-35.5,2,145),
	offset = Vector(-1,0,0),
	viewPos = Vector(15, 0, 3.5),
	maxAng = Angle(60, 360, 0),
	minAng = Angle(-50, -360, 0),
	seat = 2
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
	Rotate = Vector(3.8, 3, 3.2),-- rotation multipliers (roll) (pitch) (yaw)
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
