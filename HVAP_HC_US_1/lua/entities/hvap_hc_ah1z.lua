AddCSLuaFile("hvap_hc_ah1z.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft US"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 2
ENT.PrintName		= "AH-1Z Viper"

ENT.Model = "models/bf2/helicopters/ah-1 cobra/ah1z_b.mdl"
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
		pos = Vector(-50,19,80),	
		radius = 38, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-56,0,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 160, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 160, -- base health of engine
			Power = 1340,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(-50,-19,80),	
		radius = 38,
		info = {
			FirePos = Vector(-64,0,0),-- fire, relative to pos
			SmokePos = Vector(-32,0,0),-- smoke, relative to pos
			EffectPos = Vector(-56,0,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 160, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 160, -- base health of engine
			Power = 1340,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(0,0,120),
		ang = Angle(0, 0, 0),
		model = "models/bf2/helicopters/ah-1 cobra/ah1z_r.mdl",
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
		pos = Vector(-362.61,22.06,107.22),
		ang = Angle(0, 0, 0),
		model = "models/bf2/helicopters/ah-1 cobra/ah1z_tr.mdl",
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
		pos = Vector(70, 0, 48),
		exit = Vector(72,70,0),
		weapons = {"Hydra 70 Left"},
		weapons2 = {"Hydra 70 Right"}
	},
	{
		pos = Vector(120, 0, 42),
		exit = Vector(120,70,0),
		weapons = {"M197", "Hellfire"},
		weapons2 = {"Zoom", "Zoom"}
	},
}

ENT.Weapons = {
	["Hydra 70 Left"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(40.25, 36.33, 32.93),
			},
			Ammo = 7,
		}
	},
	["M197"] = {
		class = "hvap_pod_gun_m197",
		info = {
			Pods = {
				Vector(58, 0, 0),
			},
			ShootOffset = Vector(0, 0, 0),
			IsAimed = true,
			Ammo = 750,
			FireRate = 1500,
		}
	},
	["Hellfire"] = {
		class = "hvap_pod_rkt_hellfire",
		info = {
			Pods = {
				Vector(50, 60, 40),
				Vector(50, -60, 40),
			},
			Ammo = 8
		}
	}
}

ENT.Weapons2 = {
	["Hydra 70 Right"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(40.25, -36.33, 32.93)
			},
			Ammo = 7,
		}
	},
	["Zoom"] = {
		class = "hvap_pod_zoom",
		info = {
			ShootPos = Vector(0, 0, 0),
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

ENT.Camera = {
	model = "models/bf2/helicopters/ah-1 cobra/ah1z_g.mdl", -- gun model
	pos = Vector(137, 0, 23), --pos to aircraft for model
	offset = Vector(-1,0,0), -- offset rot around pos axis
	viewPos = Vector(175,0,42), -- view pos
	maxAng = Angle(45, 90, 0), -- (-)max down, max left, 0
	minAng = Angle(-3, -90, 0), -- (-)max up, max right, 0
	seat = 2
}

ENT.WeaponAttachments = {

	gunMount1 = {
		model = "models/bf2/helicopters/ah-1 cobra/ah1z_g1.mdl",
		pos = Vector(137,0,29),
		restrictPitch = true
	},
	
	gunMount2 = {
		model = "models/bf2/helicopters/ah-1 cobra/ah1z_g2.mdl",
		pos = Vector(137,0,23),
		offset = Vector(2,0,0)
	},

	gun = {
		model = "models/bf2/helicopters/ah-1 cobra/ah1z_radar1.mdl",
		pos = Vector(175,0,42),
		offset = Vector(-1,0,0)
	},
	
	radar1 = {
		model = "models/bf2/helicopters/ah-1 cobra/ah1z_radar2.mdl",
		pos = Vector(175,0,52),
		restrictPitch = true
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
	Rotate = Vector(4, 3, 5),-- rotation multipliers (roll) (pitch) (yaw)
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
