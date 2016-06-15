AddCSLuaFile("hvap_hc_milmi17.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft RU"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 24
ENT.PrintName		= "Mil Mi-17"

ENT.Model = "models/sentry/mi17.mdl"
ENT.Weight = 8500--empty weight in kg 
ENT.FuselageHealth = 860 --idk
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
		pos = Vector(64,19,138),	
		radius = 42, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-42,18,8),-- fire, relative to pos
			SmokePos = Vector(-108,13,16),-- smoke, relative to pos
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
		pos = Vector(64,-19,138),	
		radius = 42,
		info = {
			FirePos = Vector(-42,-18,8),-- fire, relative to pos
			SmokePos = Vector(-108,-13,16),-- smoke, relative to pos
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
		pos = Vector(-5,0,162),
		ang = Angle(0, 0, 0),
		model = "models/sentry/mi17_tr.mdl",
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
		pos = Vector(-491.3,23,176),
		ang = Angle(0, 0, 0),
		model = "models/sentry/mi17_br.mdl",
		info = {
			Dir = -1,
			Mass = 50, --effects how shaky the aircraft is
			RotHealth = 64,--initial rotor health should be same as BaseHealth
			BaseHealth = 64,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	}
}

ENT.thirdPerson = {
	distance = 660,
	angle = 4,
	position = Vector(-64,0,256)
}

ENT.Seats = {
	{
		pos=Vector(145,23,60),
		exit=Vector(147.5,120,50),
	},
	{
		pos=Vector(145,-23,60),
		exit=Vector(147.5,-120,50),
	},
	{
		pos=Vector(40,40,44),
		ang=Angle(0,-90,0),
		exit=Vector(-200,-40,10),
	},
	{
		pos=Vector(0,40,44),
		ang=Angle(0,-90,0),
		exit=Vector(-200,40,10),
	},
	{
		pos=Vector(-40,40,44),
		ang=Angle(0,-90,0),
		exit=Vector(-200,-20,10),
	},
	{
		pos=Vector(40,-40,44),
		ang=Angle(0,90,0),
		exit=Vector(-200,0,10),
	},
	{
		pos=Vector(0,-40,44),
		ang=Angle(0,90,0),
		exit=Vector(-200,20,10),
	},
	{
		pos=Vector(-40,-40,44),
		ang=Angle(0,90,0),
		exit=Vector(-240,0,10),
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

ENT.Wheels = {
	{
		mdl="models/sentry/mi17_fw.mdl",
		pos=Vector(119.5,0,8.6),
		friction=60,
		mass=800,
	},
	{
		mdl="models/sentry/mi17_bw_l.mdl",
		pos=Vector(-44.4,89,8.6),
		friction=60,
		mass=400,
	},
	{
		mdl="models/sentry/mi17_bw_r.mdl",
		pos=Vector(-44.4,-89,8.6),
		friction=60,
		mass=400,
	},
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
