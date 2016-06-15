AddCSLuaFile("hvap_hc_milmi35.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft RU"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 24
ENT.PrintName		= "Mil Mi-35"

ENT.Model = "models/sentry/mi-35.mdl"
ENT.Weight = 8500--empty weight in kg 
ENT.FuselageHealth = 768 --idk
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 100 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 4.5 -- fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(56,21,128),	
		radius = 42, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-32,18,8),-- fire, relative to pos
			SmokePos = Vector(-98,13,16),-- smoke, relative to pos
			EffectPos = Vector(-16,22,2),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 200, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 200, -- base health of engine
			Power = 1600,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(56,-21,128),	
		radius = 42,
		info = {
			FirePos = Vector(-32,-18,8),-- fire, relative to pos
			SmokePos = Vector(-98,-13,16),-- smoke, relative to pos
			EffectPos = Vector(-16,-22,2),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 200, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 200, -- base health of engine
			Power = 1600,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(-7.5,0,160),
		ang = Angle(0, 0, 0),
		model = "models/sentry/mi-35_tr.mdl",
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
		pos = Vector(-415.5,25,174.5),
		ang = Angle(0, 0, 0),
		model = "models/sentry/mi-35_rr.mdl",
		info = {
			Dir = -1,
			Mass = 50, --effects how shaky the aircraft is
			RotHealth = 64,--initial rotor health should be same as BaseHealth
			BaseHealth = 64,--rotor health
			MaxRPM = 2000, -- max(good) rpm for rotor
			Width = 68
		}
	}
}

ENT.thirdPerson = {
	distance = 840,
	angle = 4,
	position = Vector(-64,0,256)
}

ENT.Seats = {
	{
		pos=Vector(125, 0, 68),
		exit=Vector(125, 70, 0),
		weapons = {"S-5 Left"},
		weapons2 = {"S-5 Right"}
	},
	{
		pos=Vector(180, 0, 40),
		exit=Vector(180, 70, 0),
		weapons = {"Yak-B", "9M17 Phalanga"},
		weapons2 = {"Zoom", "Zoom"}
	},
}

ENT.Weapons = {
	["S-5 Left"] = {
		class = "hvap_pod_rkt_hydra40",
		info = {
			Pods = {
				Vector(40.25, 36.33, 32.93),
			},
			Sequential = false,
			Ammo = 20,
		}
	},
	["Yak-B"] = {
		class = "hvap_pod_yakb",
		info = {
			Pods = {
				Vector(54, 0, 0),
			},
			ShootOffset = Vector(0, 0, 0)
		},
		IsAimed = true,
		Ammo = 1470,		
	},
	["9M17 Phalanga"] = {
		class = "hvap_pod_rkt_hellfire",
		info = {
			Pods = {
				Vector(50, 60, 40),
				Vector(50, -60, 40),
			},
			Ammo = 4,
			HeatMult = 250
		}
	}
}

ENT.Weapons2 = {
	["S-5 Right"] = {
		class = "hvap_pod_rkt_hydra40",
		info = {
			Pods = {
				Vector(40.25, -36.33, 32.93)
			},
			Sequential = false,
			Ammo = 20,
		}
	},
	["Zoom"] = {
		class = "hvap_pod_zoom",
		info = {
			ShootPos = Vector(175, 0, 23),
			ShootOffset = Vector(-640, 0, 0)
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

ENT.WeaponAttachments = {

	gunMount1 = {
		model = "models/sentry/mi-35_gun1.mdl",
		pos = Vector(219,0,34),
	},

}

ENT.Camera = {
	model = "models/bf2/helicopters/ah-1 cobra/ah1z_g.mdl",
	pos = Vector(200,0,34),
	offset = Vector(0,0,0),
	viewPos = Vector(200,25,20),
	maxAng = Angle(60, 60, 0),
	minAng = Angle(-20, -60, 0),
	seat = 2
}

ENT.Wheels = {
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-46,65,10),
		friction=100,
		mass=350,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-46,-65,10),
		friction=100,
		mass=350,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(124,10,5),
		friction=100,
		mass=150,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(124,-10,5),
		friction=100,
		mass=150,
	},
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
	Rotate = Vector(4, 3.2, 3),-- rotation multipliers (roll) (pitch) (yaw) 5 4 6
}

ENT.Sounds = {
	Start = "HVAP.Engine.HC_2.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_2.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_2.Rotor.Near", -- rotor_close
	RotorFar = "HVAP.Engine.HC_2.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_2.Engine.Near", -- engine_close
	EngineFar = "HVAP.Engine.HC_2.Engine.Far", -- engine_far	
	EngineWhine = "HVAP.Engine.HC_2.Rotor.Turbine", -- turbine
}
