AddCSLuaFile("hvap_hc_ah1w.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft US"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 64
ENT.PrintName		= "AH-1W Super Cobra"

ENT.Model = "models/chippy/ah1w/body.mdl"
ENT.Weight = 5580--empty weight in kg 
ENT.FuselageHealth = 560 --idk
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
		pos = Vector(-80,25,24),	
		radius = 38, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(-90,-8,0),-- fire, relative to pos
			SmokePos = Vector(-90,-8,0),-- smoke, relative to pos
			EffectPos = Vector(-56,0,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 180, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 180, -- base health of engine
			Power = 1690,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(-80,-25,24),	
		radius = 38,
		info = {
			FirePos = Vector(-90,8,0),-- fire, relative to pos
			SmokePos = Vector(-90,8,0),-- smoke, relative to pos
			EffectPos = Vector(-56,0,0),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 180, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 180, -- base health of engine
			Power = 1690,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(-29,2,65),
		ang = Angle(0, 0, 0),
		model = "models/chippy/ah1w/mainrotor.mdl",
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
		pos = Vector(-432.5,-11.06,63),
		ang = Angle(0, 0, 0),
		model = "models/chippy/ah1w/tailrotor.mdl",
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
	distance = 700,
	angle = 4,
	position = Vector(0,0,50)
}

ENT.Seats = {
	{
		pos=Vector(39, 1.2, -1.3),
		exit=Vector(72,70,0),
		weapons = {"Hydra 40 Left"},
		weapons2 = {"Hydra 40 Right"}
	},
	{
		pos=Vector(100, 1, -10),
		exit=Vector(120,70,0),
		weapons = {"M197", "Hellfire"},
		weapons2 = {"Zoom", "Zoom"}
	},
}

ENT.Weapons = {
	["Hydra 40 Left"] = {
		class = "hvap_pod_rkt_hydra40",
		info = {
			Pods = {
				Vector(35, 45, -20)
			},
			Ammo = 19,
		}
	},
	["M197"] = {
		class = "hvap_pod_gun_m197",
		info = {
			Pods = {
				Vector(0, 0, -23),
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
				Vector(50, 60, -20),
				Vector(50, -60, -20),
			},
			Ammo = 8
		}
	}
}

ENT.Weapons2 = {
	["Hydra 40 Right"] = {
		class = "hvap_pod_rkt_hydra40",
		info = {
			Pods = {
				Vector(35, -45, -20)
			},
			Ammo = 19,
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
	pos = Vector(111,0,-37),
	offset = Vector(-1,0,0), -- offset rot around pos axis
	viewPos = Vector(64, 0, 32),
	maxAng = Angle(45, 90, 0), -- (-)max down, max left, 0
	minAng = Angle(-3, -90, 0), -- (-)max up, max right, 0
	seat = 2
}

ENT.WeaponAttachments={

	gunMount1 = {
		model = "models/BF2/helicopters/AH-1 Cobra/ah1z_g1.mdl",
		pos = Vector(107.5,0,-30.5),
		restrictPitch=true,
	},
	
	gunMount2 = {
		model = "models/BF2/helicopters/AH-1 Cobra/ah1z_g2.mdl",
		pos = Vector(111,0,-37),
		localTo = "gunMount1",
	},
	
	radar1 = {
		model = "models/chippy/ah1w/tgp.mdl",
		pos = Vector(160,0,-15),
		restrictPitch=true
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
	Rotate = Vector(4.2, 3.2, 5.4),-- rotation multipliers (roll) (pitch) (yaw)
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
