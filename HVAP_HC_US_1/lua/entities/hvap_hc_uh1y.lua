AddCSLuaFile("hvap_hc_uh1y.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft US"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 1
ENT.PrintName		= "UH-1Y Venom"

ENT.Model = "models/flyboi/uh1yvenom/uh1yvenom_fb.mdl"
ENT.Weight = 3020--empty weight in kg 
ENT.FuselageHealth = 290 --idk
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 100 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 3 -- fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(-68,20,102),	
		radius = 32, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-76,17,2),-- fire, relative to pos
			SmokePos = Vector(-76,17,0),-- smoke, relative to pos
			EffectPos = Vector(-76,17,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 120, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 120, -- base health of engine
			Power = 1150,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(-68,-20,102),	
		radius = 32,
		info = {
			FirePos = Vector(-76,-17,2),-- fire, relative to pos
			SmokePos = Vector(-76,-17,0),-- smoke, relative to pos
			EffectPos = Vector(-76,-17,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 120, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 120, -- base health of engine
			Power = 1150,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(-6.2,-1.5,138),
		ang = Angle(0, 0, 0),
		model = "models/flyboi/uh1yvenom/venomrotorm_fb.mdl",
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
		pos = Vector(-357.5,5.5,134),
		ang = Angle(0, 0, 0),
		model = "models/flyboi/uh1yvenom/venomrotort_fb.mdl",
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
		pos=Vector(95, 20, 48),
		exit=Vector(90,-80,10),
		weapons = {"Hydra 70 Left"},
		weapons2 = {"Hydra 70 Right"}
	},
	{
		pos=Vector(95, -20, 48),
		exit=Vector(90,80,10),
	},
	{
		pos=Vector(-5, -45, 40),
		ang=Angle(0,-90,0),
		exit=Vector(-5,-80,10),
	},
	{
		pos=Vector(-5, 45, 40),
		ang=Angle(0,90,0),
		exit=Vector(-5,80,10),
	},
	{
		pos=Vector(58, 24.5, 46),
		ang=Angle(0,180,0),
		exit=Vector(0,80,10),
	},
	{
		pos=Vector(58, -24.5, 46),
		ang=Angle(0,180,0),
		exit=Vector(0,-80,10),
	},
}

ENT.Weapons = {
	["Hydra 70 Left"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(40.25,60,32.93)
			},
			Sequential = false,
			Ammo = 19,
		}
	}
}

ENT.Weapons2 = {
	["Hydra 70 Right"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(40.25,-60,32.93),
			},
			Sequential = false,
			Ammo = 19,
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

ENT.Sounds = {
	Start = "HVAP.Engine.HC_5.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_3.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_6.Rotor.Near", -- rotor_close
	RotorFar = "HVAP.Engine.HC_6.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_6.Engine.Near", -- engine_close
	EngineFar = "HVAP.Engine.HC_6.Engine.Far", -- engine_far	
	EngineWhine = "HVAP.Engine.HC_6.Rotor.Turbine", -- turbine
}
