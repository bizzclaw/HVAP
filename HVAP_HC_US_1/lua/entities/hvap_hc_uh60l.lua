AddCSLuaFile("hvap_hc_uh60l.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft US"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 32
ENT.PrintName = "UH-60L Black Hawk Gunship"

ENT.Model = "models/wac/uh60_lau61ca.mdl"
ENT.Weight = 6400--empty weight in kg 
ENT.FuselageHealth = 640 --idk
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 0.8 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 100 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 90 -- idk
ENT.Fuel = 300 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 300 -- original fuel capacity
ENT.FuelConMult = 4 -- fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(-12,32,88),	
		radius = 41, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-90,4,1),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 256, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 256, -- base health of engine
			Power = 1490,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(-12,-32,88),	
		radius = 41,
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-90,-4,1),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 256, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 256, -- base health of engine
			Power = 1490,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(-13.95,-0.33,111.58),
		ang = Angle(0, 0, 0),
		model =  "models/wac/uh60_rotor.mdl",
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
		pos = Vector(-376.98,-9.1,136.11),
		ang = Angle(0, 0, 0),
		model = "models/wac/uh60_back_rotor.mdl",
		info = {
			Dir = -1,
			Mass = 5, --effects how shaky the aircraft is
			RotHealth = 64,--initial rotor health should be same as BaseHealth
			BaseHealth = 64,--rotor health
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
		pos=Vector(80.4, 24.09, 45),
		exit=Vector(120, -90, 40),
		weapons = {"GAU-19"},
		weapons2 = {"Hydra 70"}
	},
	{
		pos=Vector(80.4, -24.49, 45),
		exit=Vector(120, 90, 40),
	},
	{
		pos=Vector(48.12, -16.99, 40),
		ang=Angle(0,-90,0),
		exit=Vector(120, -90, 40),
	},
	{
		pos=Vector(48.11, 15.07, 40),
		ang=Angle(0,90,0),
		exit=Vector(120, 90, 40),
	},
	{
		pos=Vector(48.52, -1.06, 40),
		ang=Angle(0,180,0),
		exit=Vector(120, -90, 40),
	},
	{
		pos=Vector(-52.96, -24.79, 40),
		exit=Vector(-100, -100, 40),
	},
	{
		pos=Vector(-52.96, 26.39, 40),
		exit=Vector(-100, 100, 40),
	},
	{
		pos=Vector(-52.96, -7.64, 40),
		exit=Vector(-100, -100, 40),
	},
	{
		pos=Vector(-52.96, 9.24, 40),
		exit=Vector(-100, 100, 40),
	},
}

ENT.Wheels={
	{
		mdl="models/wac/uh60_back_wheel.mdl",
		pos=Vector(-288.5,-0.02,9.71),
		friction=60,
		mass=600,
	},
	{
		mdl="models/wac/uh60_front_wheel_left.mdl",
		pos=Vector(29.02,52.71,11.41),
		friction=60,
		mass=600,
	},
	{
		mdl="models/wac/uh60_front_wheel_right.mdl",
		pos=Vector(29.04,-52.44,11.39),
		friction=60,
		mass=600,
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
	["GAU-19"] = {
		class = "hvap_pod_gun_gau19",
		info = {
			Pods = {
				Vector(88.41,-54.2,57.56),
				Vector(88.41,54.2,57.56),
			},
			Sequential = false,
			FireRate = 4000
		}
	}
}

ENT.Weapons2 = {
	["Hydra 70"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(33.97,74.94,56.26),
				Vector(33.97,-75.03,56.26),
			},
			Ammo = 38,
		}
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
	Rotate = Vector(3.1, 3.1, 3.1),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "HVAP.Engine.HC_5.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_2.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_6.Rotor.Near", -- rotor_close
	RotorFar = "HVAP.Engine.HC_6.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_6.Engine.Near", -- engine_close
	EngineFar = "HVAP.Engine.HC_6.Engine.Far", -- engine_far	
	EngineWhine = "HVAP.Engine.HC_6.Rotor.Turbine", -- turbine
}
