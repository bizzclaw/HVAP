AddCSLuaFile("hvap_hc_ka50.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft RU"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 16
ENT.PrintName = "Ka-50 Black Shark"

ENT.Model = "models/sentry/ka-50.mdl"
ENT.Weight =  7700--empty weight in kg 
ENT.FuselageHealth = 450 --idk make it non retarded, based off size and or armor
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 100 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 2.5 -- overall fuel consumption multiplier
ENT.CoopEngines = false -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(30,32,92),	
		radius = 84, -- max dist damage to engine to deal damage, closer means more dmg 
		info = {
			FirePos = Vector(42,0,6),-- fire, relative to pos
			SmokePos = Vector(-52,20,0),-- smoke, relative to pos
			EffectPos = Vector(-42,20,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 256, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 256, -- base health of engine
			Power = 1800,-- engine power in kW --x2 for single engine  
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},
	{
		pos = Vector(30,-32,92),	
		radius = 84, -- max dist damage to engine to deal damage, closer means more dmg 
		info = {
			FirePos = Vector(42,0,6),-- fire, relative to pos
			SmokePos = Vector(-52,-20,0),-- smoke, relative to pos
			EffectPos = Vector(-42,-20,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 256, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 256, -- base health of engine
			Power = 1800,-- engine power in kW --x2 for single engine  
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos =  Vector(30,0,106),
		ang = Angle(0, 0, 0),
		model = "models/sentry/ka-50_br.mdl",
		info = {
			Dir = 1,
			Mass = 5, --effects how shaky the aircraft is
			RotHealth = 100,--initial rotor health should be same as BaseHealth
			BaseHealth = 100,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	},
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(30,0,158.5),
		ang = Angle(0, 0, 0),
		model = "models/sentry/ka-50_tr.mdl",
		info = {
			Dir = -1,
			Mass = 5, --effects how shaky the aircraft is
			RotHealth = 100,--initial rotor health should be same as BaseHealth
			BaseHealth = 100,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	}
}

ENT.thirdPerson = {
	distance = 512,
	angle = 5,
	position = Vector(-50,0,200)
}

ENT.Seats = {
	{
		pos=Vector(116, 0, 50),
		exit=Vector(160,70,40),
		weapons = {"2A42", "S-8", "9A4172"},
		weapons2 = {"Zoom", "Zoom", "Zoom"}		
	},
}

ENT.Weapons = {
	["2A42"] = {
		class = "hvap_pod_gun_2A42", --hvap_pod_mg_m134
		info = {
			Pods = {
				Vector(160,-35,43)
			},
			Ammo = 460,
			Sequential = true,--fire all simultaneously?			
		}
	},
	["S-8"] = {
		class = "hvap_pod_rkt_hydra40",
		info = {
			Pods = {
				Vector(16,-80,46),
				Vector(16,80,46),
			},
			Sequential = false,
			Ammo = 80,
			FireRate = 600
		}
	},
	["9A4172"] = {
		class = "hvap_pod_rkt_hellfire",
		info = {
			Pods = {
				Vector(180,120,50),
				Vector(180,-120,50),
			},
			Sequential = false,--fire all simultaneously?	
			Ammo = 12
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

ENT.Weapons2 = {
	["Zoom"] = {
		class = "hvap_pod_zoom",
		info = {
			ShootPos = Vector(0, 0, 0),
			ShootOffset = Vector(0, 0, 0)
		}
	}
}

ENT.Camera = {
	model = "models/props_junk/PopCan01a.mdl",
	pos = Vector(228,0,30),
	offset = Vector(0,0,0),
	viewPos = Vector(228,0,30),
	maxAng = Angle(0, 0, 0),
	minAng = Angle(0, 0, 0),
	seat = 1
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
	Rail = Vector(3, 2, 1),-- 0,0,0
	RailRotor = 1, -- like Z rail but only active when moving and the rotor is turning
	AngleDrag = Vector(0.1, 0.1, 0.1),
	Rotate = Vector(5.12, 3.2, 5.12),-- rotation multipliers (roll) (pitch) (yaw) 5 4 6
}

ENT.Wheels={
	{
		mdl="models/sentry/ka-50_fwheel.mdl",
		pos=Vector(163,0,4),
		friction=100,
		mass=100,
	},
	{
		mdl="models/sentry/ka-50_bwheel.mdl",
		pos=Vector(-25.5,-56,10),
		friction=100,
		mass=100
	},
	{
		mdl="models/sentry/ka-50_bwheel.mdl",
		pos=Vector(-25.5,56,10),
		friction=100,
		mass=100,
	},

}

ENT.Sounds = {
	Start = "HVAP.Engine.HC_2.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_4.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_7.Rotor.Near", -- rotor_close
	RotorFar = "HVAP.Engine.HC_7.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_3.Engine.Near", -- engine_close
	EngineFar = "HVAP.Engine.HC_3.Engine.Far", -- engine_far	
	EngineWhine = "HVAP.Engine.HC_3.Rotor.Turbine", -- turbine
}
