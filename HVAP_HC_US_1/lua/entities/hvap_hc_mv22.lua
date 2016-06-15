AddCSLuaFile("hvap_hc_mv22.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft US"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 32
ENT.PrintName		= "MV-22 Osprey"

ENT.Model = "models/sentry/osprey.mdl"
ENT.Weight = 15032--empty weight in kg 
ENT.FuselageHealth = 1600 --idk
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = .64 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 160 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 200 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 200 -- original fuel capacity
ENT.FuelConMult = 4 -- fuel consumption multiplier
ENT.CoopEngines = false -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(32,278.5,140),	
		radius = 80, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(14,0,78),-- fire, relative to pos
			SmokePos = Vector(2,0,-96),-- smoke, relative to pos
			EffectPos = Vector(4,0,-96),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 400, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 400, -- base health of engine
			Power = 1000,-- engine power in kW (SO OP SO ROUND DOWN TO 1000THS)
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(32,-278.5,140),	
		radius = 80,
		info = {
			FirePos = Vector(14,0,78),-- fire, relative to pos
			SmokePos = Vector(2,0,-96),-- smoke, relative to pos
			EffectPos = Vector(4,0,-96),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 400, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 400, -- base health of engine
			Power = 1000,-- engine power in kW (SO OP SO ROUND DOWN TO 1000THS)
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(9,278.5,236),
		ang = Angle(0, 0, 0),
		model = "models/sentry/osprey_prop.mdl",
		info = {
			Dir = 1,
			Mass = 25, --effects how shaky the aircraft is
			RotHealth = 100,--initial rotor health should be same as BaseHealth
			BaseHealth = 100,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	},
	
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(9,-278.5,236),
		ang = Angle(0, 0, 0),
		model = "models/sentry/osprey_prop.mdl",
		info = {
			Dir = 1,
			Mass = 25, --effects how shaky the aircraft is
			RotHealth = 64,--initial rotor health should be same as BaseHealth
			BaseHealth = 64,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	}
}

ENT.thirdPerson = {
	distance = 700,
	angle = 7,
	position = Vector(-64,0,256)
}

ENT.Seats = {
	{
		pos=Vector(165, 24, 68),
		exit=Vector(160,70,40),
	},
	{
		pos=Vector(165, -24, 68),
		exit=Vector(160,-70,40),
		weapons={"GAU-17"},
		weapons2={"Zoom"}
	},
	{
		pos=Vector(25, 28, 60),
		exit=Vector(-320,0,10),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(0, 28, 60),
		exit=Vector(-320,0,10),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(105, 28, 60),
		exit=Vector(-320,0,10),
		ang=Angle(0,-90,0),
	},
	{
		pos=Vector(65, -28, 60),
		exit=Vector(-320,0,10),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(-40, -28, 60),
		exit=Vector(-320,0,10),
		ang=Angle(0,90,0),
	},
	{
		pos=Vector(-80, -28, 60),
		exit=Vector(-320,0,10),
		ang=Angle(0,90,0),
	},
}

ENT.Weapons = {
	["GAU-17"] = {
		class = "hvap_pod_gun_m134",
		info = {
			Pods = {
				Vector(28, 0, 0),
			},
			ShootOffset = Vector(0, 0, 0),
			IsAimed = true,
			Ammo = 5000,
			HeatTime = 0.1
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

ENT.CounterMeasures = {
	["OP Flares"] = {
		class = "hvap_pod_cm_flares",--2
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

ENT.WeaponAttachments={

	gunMount1 = {
		model = "models/sentry/osprey_gun1.mdl",
		pos = Vector(-15,0,25),
		restrictPitch = true
	},
	
	gun = {
		model = "models/sentry/osprey_barrel.mdl",
		pos = Vector(-15,10,18),
	},

}

ENT.Camera = {
	model = "models/sentry/osprey_gun2.mdl",
	pos = Vector(-15,10,18),
	offset = Vector(0,0,0),
	viewPos = Vector(52, 0, -16),
	maxAng = Angle(60, 360, 0),
	minAng = Angle(-8, -360, 0),
	seat = 2
}

ENT.Wheels={
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-98,-66,5),
		friction=100,
		mass=250,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-98,-79,5),
		friction=100,
		mass=250
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-98,66,5),
		friction=100,
		mass=250,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-98,79,5),
		friction=100,
		mass=250
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(225,-6,5),
		friction=100,
		mass=250
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(225,6,5),
		friction=100,
		mass=250
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
	Rotate = Vector(2, 2.56, 2),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "HVAP.Engine.HC_2.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_2.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_8.Rotor.Near", -- rotor_close
	RotorFar = "HVAP.Engine.HC_8.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_2.Engine.Near", -- engine_close
	EngineFar = "HVAP.Engine.HC_2.Engine.Far", -- engine_far	
	EngineWhine = "HVAP.Engine.HC_2.Rotor.Turbine", -- turbine
}
