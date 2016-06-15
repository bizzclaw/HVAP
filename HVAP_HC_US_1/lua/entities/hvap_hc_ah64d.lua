AddCSLuaFile("hvap_hc_ah64d.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft US"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 80
ENT.PrintName		= "AH-64D Longbow"

ENT.Model = "models/sentry/apache.mdl"
ENT.Weight = 5165 --empty weight in kg 
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
		pos = Vector(-20,38,48),	
		radius = 32, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-64,0,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 100, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 100, -- base health of engine
			Power = 1408,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Width = 300, -- width of rotor
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(-20,-38,48),	
		radius = 32,
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-64,0,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 100, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 100, -- base health of engine
			Power = 1408,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Width = 80, -- width of rotor
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(37,0,80),
		ang = Angle(0, 0, 0),
		model = "models/sentry/apachemain.mdl",
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
		pos = Vector(-332.5,-17,93.5),
		ang = Angle(0, 0, 0),
		model = "models/sentry/apacherear.mdl",
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
		pos = Vector(93, 0, 10),
		exit = Vector(93,120,10),
		weapons = {"Hydra 70 Left"},
		weapons2 = {"Hydra 70 Right"}
	},
	{
		pos = Vector(142.5, 0, 0),
		exit = Vector(142.5,120,10),
		weapons = {"M230", "Hellfire"},
		weapons2 = {"Zoom", "Zoom"}
	},
}

ENT.Weapons = {
	["Hydra 70 Left"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(90.25,65.33,-15),
			},
			Sequential = false,
			Ammo = 19,
		}
	},
	["M230"] = {
		class = "hvap_pod_gun_m230",--230
		info = {
			Pods = {
				Vector(70, 0, 0),
			},
			ShootOffset = Vector(0, 0, 0),
			IsAimed = true,
			Ammo = 300,
		}
	},
	["Hellfire"] = {
		class = "hvap_pod_rkt_hellfire",
		info = {
			Pods = {
				Vector(70, 70, 40),
				Vector(70, -70, 40),
			}
		}
	}
}

ENT.Weapons2 = {
	["Hydra 70 Right"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(90.25,-65.33,-15)
			},
			Sequential = false,
			Ammo = 19,
		}
	},
	["Zoom"] = {
		class = "hvap_pod_zoom",
		info = {
			ShootPos = Vector(175, 0, 23),
			ShootOffset = Vector(0, 0, 0)
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

ENT.WeaponAttachments={

	gunMount2 = {
		model = "models/sentry/apachegun1.mdl",
		pos = Vector(125,0,-32),
		restrictPitch = true
	},

	radar1 = {
		model = "models/sentry/apachecam.mdl",
		pos = Vector(215,0,12),
		restrictPitch = true
	},

}

ENT.Camera = {
	model = "models/sentry/apachegun2.mdl",
	pos = Vector(125,0,-42),
	offset = Vector(0, 0, 0),
	viewPos = Vector(256,0,-20),
	maxAng = Angle(60, 100, 0),
	minAng = Angle(-11, -100, 0),
	seat = 2
}

ENT.Wheels={
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w2.mdl",
		pos=Vector(-361,0,-27),
		friction=100,
		mass=100,
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(70,-45,-55),
		friction=100,
		mass=300
	},
	{
		mdl="models/BF2/helicopters/Mil Mi-28/mi28_w1.mdl",
		pos=Vector(70,45,-55),
		friction=100,
		mass=300
	},
}

ENT.Sounds = {
	Start = "HVAP.Engine.HC_2.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_4.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_5.Rotor.Near", -- rotor_close
	RotorFar = "HVAP.Engine.HC_5.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_5.Engine.Near", -- engine_close
	EngineFar = "HVAP.Engine.HC_5.Engine.Far", -- engine_far	
	EngineWhine = "HVAP.Engine.HC_6.Rotor.Turbine", -- turbine
}
