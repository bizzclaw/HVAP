AddCSLuaFile("hvap_hc_uh60.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategory
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 32
ENT.PrintName = "UH-60 Black Hawk"

ENT.Model = "models/bf2/helicopters/uh-60 blackhawk/uh60_b.mdl"
ENT.Weight = 5580--empty weight in kg 
ENT.FuselageHealth = 500 --idk
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
		pos = Vector(0,0,100),
		ang = Angle(0, 0, 0),
		model =  "models/bf2/helicopters/uh-60 blackhawk/uh60_r.mdl",
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
		pos = Vector(-400,17,134),
		ang = Angle(0, 0, 192),
		model = "models/bf2/helicopters/uh-60 blackhawk/uh60_rr.mdl",
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
	distance = 640,
	angle = 4,
	position = Vector(-64,0,256)
}

ENT.Seats = {
	{
		pos = Vector(110,31,30),
		exit = Vector(140,-100,3),
	},
	{
		pos = Vector(110,-31,30),
		exit = Vector(140,100,3),
	},
	{
		pos = Vector(65,-24,33),
		ang = Angle(0,-90,0),
		exit = Vector(33,-100,3),
	},
	{
		pos = Vector(65,24,33),
		ang = Angle(0,90,0),
		exit = Vector(33,101.04,3),
	},
	{
		pos = Vector(34.5,34,33),
		ang= Angle(0,180,0),
		exit = Vector(33,100,3),
	},
	{
		pos = Vector(-48,34,33),
		exit = Vector(-20,100,3),
	},
	{
		pos = Vector(-48,-34,33),
		exit = Vector(-20,-100,3),
	},
}

ENT.Wheels = {
	{
		mdl="models/bf2/helicopters/mil mi-28/mi28_w2.mdl",
		pos=Vector(-307,0,4),
		friction=100,
		mass=400,
	},
	{
		mdl="models/bf2/helicopters/mil mi-28/mi28_w1.mdl",
		pos=Vector(46.34,-60.59,5.76),
		friction=100,
		mass=400,
	},
	{
		mdl="models/bf2/helicopters/mil mi-28/mi28_w1.mdl",
		pos=Vector(46.34,60.59,5.76),
		friction=100,
		mass=400,
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
	Rotate = Vector(4, 3.8, 3.8),-- rotation multipliers (roll) (pitch) (yaw)
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
