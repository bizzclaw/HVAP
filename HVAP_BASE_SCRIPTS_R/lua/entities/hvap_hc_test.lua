AddCSLuaFile("hvap_hc_test.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategory
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.AdminOnly = true
ENT.SpawnHeight = 16
ENT.PrintName		= "TH-1 Tester"

ENT.Model = "models/weltensturm/wac/helicopter/ahx1.mdl"
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
		pos = Vector(-5,13,75),	
		radius = 42, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-150,15,79.51),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 100, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 100, -- base health of engine
			Power = 1600,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(-5,-13,75),	
		radius = 42,
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-150,15,79.51),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 100, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 100, -- base health of engine
			Power = 1600,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(0,0,110),
		ang = Angle(0, 0, 0),
		model = "models/weltensturm/wac/helicopter/ahx1_r.mdl",
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
		pos = Vector(-298.2,11.6,88),
		ang = Angle(0, 0, 0),
		model = "models/weltensturm/wac/helicopter/ahx1_br.mdl",
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
		pos = Vector(70, 0, 43),
		exit = Vector(72,70,0),
		weapons = {"Gun 1"},
		weapons2 = {"Rocket 1"}
	},
	{
		pos = Vector(108, 0, 32),
		exit = Vector(120,70,0),
		weapons = {"Gun 2", "Rocket 2"},
		weapons2 = {"Zoom", "Zoom"}
	},
}

ENT.Weapons = {
	["Gun 1"] = {
		class = "hvap_pod_test_2",
		info = {
			Pods = {
				Vector(40, 64, 32),
				Vector(40, -64, 32)
			},
			Sequential = true,
			Ammo = 1500
		}
	},
	["Gun 2"] = {
		class = "hvap_pod_aimed_test",
		info = {
			ShootPos = Vector(140,2,1),
			ShootOffset = Vector(0, 0, 0),
			Ammo = 750,
			FireRate = 1650,
		}
	},
	["Rocket 2"] = {
		class = "hvap_pod_hellfire",
		info = {
			Pods = {
				Vector(50, 60, 40),
				Vector(50, -60, 40),
			}
		}
	}
}

ENT.Weapons2 = {
	["Rocket 1"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(40, 64, 32),
				Vector(40, -64, 32)
			},
			Sequential = false,
			Ammo = 38,
		}
	},
	["Zoom"] = {
		class = "hvap_pod_aimed_zoom",
		info = {
			ShootPos = Vector(175, 0, 23),
			ShootOffset = Vector(0, 0, 0)
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

ENT.Camera = {
	model = "models/weltensturm/wac/helicopter/ahx1_gun.mdl",
	pos = Vector(140,2,1.5),
	offset = Vector(0,0,0),
	viewPos = Vector(2, 5, 3.5),
	maxAng = Angle(90, 360, 0),
	minAng = Angle(-1, -360, 0),
	seat = 2
}

ENT.Turrets = {
	{
		model = "models/bf2/helicopters/ah-1 cobra/ah1z_radar1.mdl",
		pos = Vector(175,0,42),
		offset = Vector(-1,0,0),
		viewPos = Vector(2, 0, 3.5),
		maxAng = Angle(45, 90, 0),
		minAng = Angle(-3, -90, 0),
		seat = 2
	}
}

ENT.WeaponAttachments = {

	gunMount1 = {
		model = "models/weltensturm/wac/helicopter/ahx1_gunm.mdl",
		pos = Vector(140,0,1.5),
		restrictPitch = true
	},

}

ENT.Sounds = {
	Start = "hvap/engine/air/helicopter/shared/heli_start_3.wav", -- heli_start_#
	Cockpit = "hvap/engine/air/helicopter/hc_3/cockpit.wav", -- cockpit

	RotorNear = "hvap/engine/air/helicopter/hc_5/rotor_close.wav", -- rotor_close
	RotorFar = "hvap/engine/air/helicopter/hc_5/rotor_far.wav", -- rotor_far
	
	EngineNear = "hvap/engine/air/helicopter/hc_5/engine_close.wav", -- engine_close
	EngineFar = "hvap/engine/air/helicopter/hc_5/engine_far.wav", -- engine_far	
	EngineWhine = "hvap/engine/air/helicopter/hc_6/turbine.wav", -- turbine
}
