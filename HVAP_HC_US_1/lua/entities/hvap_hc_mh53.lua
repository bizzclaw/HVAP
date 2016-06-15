AddCSLuaFile("hvap_hc_mh53.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft US"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 40
ENT.PrintName = "MH-53J Pave Low IIIE"

ENT.Model = "models/bf2/helicopters/MH-53J Pave Low IIIE/mh53_b.mdl"
ENT.Weight = 14515--empty weight in kg 
ENT.FuselageHealth = 1240 --idk
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 100 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 4 -- fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(120,70,150),	
		radius = 42, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-128,14,4),-- fire, relative to pos
			SmokePos = Vector(-120,14,0),-- smoke, relative to pos
			EffectPos = Vector(-128,14,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 300, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 300, -- base health of engine
			Power = 1920,-- engine power in kW (so op so round to 1000th) 3230
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(120,-70,150),	
		radius = 42,
		info = {
			FirePos = Vector(-128,-14,4),-- fire, relative to pos
			SmokePos = Vector(-120,-14,0),-- smoke, relative to pos
			EffectPos = Vector(-128,-14,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 300, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 300, -- base health of engine
			Power = 1920,-- engine power in kW (so op so round to 1000th) 3230
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(0,0,168.5),
		ang = Angle(0, 0, 0),
		model =  "models/bf2/helicopters/MH-53J Pave Low IIIE/mh53_r.mdl",
		info = {
			Dir = -1,
			Mass = 5, --effects how shaky the aircraft is
			RotHealth = 256,--initial rotor health should be same as BaseHealth
			BaseHealth = 256,--rotor health
			MaxRPM = 2000, -- max(good) rpm for rotor
	--		Width = 800
		}
	},
	
	{
		istail = true, -- is this rotor a tail rotor?
		pos = Vector(-691,22,236),
		ang = Angle(0, 0, 0),
		model = "models/bf2/helicopters/mh-53j pave low iiie/mh53_tr.mdl",
		info = {
			Dir = -1,
			Mass = 50, --effects how shaky the aircraft is 
			RotHealth = 128,--initial rotor health should be same as BaseHealth
			BaseHealth = 128,--rotor health
			MaxRPM = 2000, -- max(good) rpm for rotor
	--		Width = 800
		}
	}
}

ENT.thirdPerson = {
	distance = 1000,
	angle = 4,
	position = Vector(-64,0,256)
}

ENT.Seats = {
	{
		pos=Vector(256,32,70),
		exit=Vector(250,100,20),
	},
	{
		pos=Vector(256,-30,70),
		exit=Vector(250,-100,20),
	},
	{
		pos=Vector(81.58,-38,30),
		ang=Angle(0,90,0),
		exit=Vector(81.58,0,30),
	},
	{
		pos=Vector(81.58,38,30),
		ang=Angle(0,-90,0),
		exit=Vector(81.58,0,30),
	},
	{
		pos=Vector(43.72,38,30),
		ang=Angle(0,-90,0),
		exit=Vector(43.72,0,30),
	},
	{
		pos=Vector(-60.01,-38,30),
		ang=Angle(0,90,0),
		exit=Vector(-60.01,0,30),
	},
	{
		pos=Vector(-160.01,-38,30),
		ang=Angle(0,90,0),
		exit=Vector(-60.01,0,30),
	},
	{
		pos=Vector(-160.01,38,30),
		ang=Angle(0,-90,0),
		exit=Vector(-160.01,0,30),
	},
	{
		pos=Vector(-350,0,20),
		ang=Angle(0,180,0),
		exit=Vector(-340,0,20),
	},
}

ENT.Wheels={
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(278,-8,-12),
		friction=100,
		mass=200,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(278,8,-12),
		friction=100,
		mass=200,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-56,-88,-12),
		friction=100,
		mass=200,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-56,88,-12),
		friction=100,
		mass=200,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-56,-72,-12),
		friction=100,
		mass=200,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(-56,72,-12),
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
	Rotate = Vector(2.3, 1.8, 2),-- rotation multipliers (roll) (pitch) (yaw)
}

--[[ENT.Camera = {
	model = "models/props_marines/50cal.mdl",
	pos = Vector(-350,0,20),
	offset = Vector(0, 0, 0),
	viewPos = Vector(-350,0,20),
	maxAng = Angle(60, 100, 0),
	minAng = Angle(-11, -100, 0),
	seat = 9
}]]

ENT.Sounds = {
	Start = "HVAP.Engine.HC_5.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_5.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_6.Rotor.Near", -- rotor_close
	RotorFar = "HVAP.Engine.HC_6.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_6.Engine.Near", -- engine_close
	EngineFar = "HVAP.Engine.HC_6.Engine.Far", -- engine_far	
	EngineWhine = "HVAP.Engine.HC_6.Rotor.Turbine", -- turbine
}
