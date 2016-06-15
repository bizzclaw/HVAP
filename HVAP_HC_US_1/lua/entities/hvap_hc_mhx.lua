AddCSLuaFile("hvap_hc_mhx.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft US"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 32
ENT.PrintName = "MH-X Stealth Hawk"

ENT.Model = "models/sentry/mhx.mdl"
ENT.Weight = 5580--empty weight in kg 
ENT.FuselageHealth = 500 --idk

ENT.HasDoors = true
ENT.DoorBodygroup=1
ENT.DoorFlip=true

ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 100 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 4 -- fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(-12,32,88),	
		radius = 38, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-90,10,1),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 120, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 120, -- base health of engine
			Power = 1410,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(-12,-32,88),	
		radius = 38,
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-90,-10,1),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 120, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 120, -- base health of engine
			Power = 1410,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(-22,0,113),
		ang = Angle(0, 0, 0),
		model =  "models/sentry/mhx_tr.mdl",
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
		pos = Vector(-400,-8,130),
		ang = Angle(0, 0, 0),
		model = "models/sentry/mhx_rr.mdl",
		info = {
			Dir = 1,
			Mass = 5, --effects how shaky the aircraft is
			RotHealth = 64,--initial rotor health should be same as BaseHealth
			BaseHealth = 64,--rotor health
			MaxRPM = 2000, -- max(good) rpm for rotor
			Width = 90
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
		pos = Vector(110,-18,38),
		exit = Vector(140,-100,3),
	},
	{
		pos = Vector(110,18,38),
		exit = Vector(140,100,3),
	},
	{
		pos = Vector(65,-20,33),
		ang = Angle(0,-180,0),
		exit = Vector(33,-100,3),
	},
	{
		pos = Vector(65,20,33),
		ang = Angle(0,-180,0),
		exit = Vector(33,101.04,3),
	},
	{
		pos = Vector(18,-10,25),
		ang= Angle(0,180,0),
		exit = Vector(33,100,3),
	},
	{
		pos = Vector(18,10,25),
		ang= Angle(0,180,0),
		exit = Vector(-20,100,3),
	},
	{
		pos = Vector(-30,-10,25),
		exit = Vector(-20,-100,3),
	},
		{
		pos = Vector(-30,10,25),
		exit = Vector(-20,-100,3),
	},
}

ENT.Wheels={
	{
		mdl="models/sentry/mhx_rw.mdl",
		pos=Vector(-307,0,4),
		friction=100,
		mass=200,
	},
	{
		mdl="models/sentry/mhx_fw.mdl",
		pos=Vector(64.34,-45.59,5.76),
		friction=100,
		mass=200,
	},
	{
		mdl="models/sentry/mhx_fw.mdl",
		pos=Vector(64.34,45.59,5.76),
		friction=100,
		mass=200,
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
	Rotate = Vector(4, 3.8, 3.8),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "HVAP.Engine.HC_4.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_10.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_3.Rotor.Far", -- rotor_close
	RotorFar = "HVAP.Engine.HC_3.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_3.Engine.Far", -- engine_close
	EngineFar = "HVAP.Engine.HC_3.Engine.Far", -- engine_far	
	EngineWhine = "", -- turbine
}
