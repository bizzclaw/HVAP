AddCSLuaFile("hvap_hc_mi28.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft RU"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 18
ENT.PrintName = "Mi-28 Havoc"

ENT.Model = "models/bf2/helicopters/mil mi-28/mi28_b.mdl"
ENT.Weight = 17400--empty weight in kg 
ENT.FuselageHealth = 700 --idk
ENT.Deatheffect = "500lb_air" -- effect created on death of vehicle
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 98 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 5 -- fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
		pos = Vector(-36,42,110),	
		radius = 56, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(58,4,5),-- fire, relative to pos
			SmokePos = Vector(-80,-12,1),-- smoke, relative to pos
			EffectPos = Vector(-64,12,-32),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 256, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 256, -- base health of engine
			Power = 1340,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel taken mult
		}
	},

	{
		pos = Vector(-36,-42,110),	
		radius = 56,
		info = {
			FirePos = Vector(58,-4,5),-- fire, relative to pos
			SmokePos = Vector(-80,12,1),-- smoke, relative to pos
			EffectPos = Vector(-64,-12,-32),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 256, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 256, -- base health of engine
			Power = 1340,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(0,0,119),
		ang = Angle(0, 0, 0),
		model = "models/bf2/helicopters/mil mi-28/mi28_r.mdl",
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
		pos = Vector(-435.09,18.46,164.91),
		ang = Angle(0, 0, 0),
		model = "models/bf2/helicopters/mil mi-28/mi28_tr.mdl",
		info = {
			Dir = -1,
			Mass = 5, --effects how shaky the aircraft is
			RotHealth = 100,--initial rotor health should be same as BaseHealth
			BaseHealth = 100,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	}
}

ENT.thirdPerson = {
	distance = 700,
	angle = 10,
	position = Vector(-50,0,256)
}

ENT.Seats = {
	{
		pos = Vector(54.74,0,85.22),
		exit = Vector(54.74,80,5),
		weapons = {"S-8 Left"},
		weapons2 = {"S-8 Right"}
	},
	{
		pos = Vector(115.3,0,61),
		exit = Vector(115.3,60,5),
		weapons = {"2A42", "9M120"},
		weapons2 = {"Zoom", "Zoom"}
	},
}

ENT.Weapons = {
	["S-8 Left"] = {
		class = "hvap_pod_rkt_hydra40",
		info = {
			Pods = {
				Vector(40.25, 36.33, 32.93),
			},
			Sequential = false,
			Ammo = 20,
		}
	},
	["2A42"] = {
		class = "hvap_pod_gun_2a42",
		info = {
			Pods = {
				Vector(100, 0, 0),
			},
			ShootOffset = Vector(0, 0, 0),
			IsAimed = true,
			Ammo = 250,
			FireRate = 550,--200low 300fixed 550high
		}
	},
	["9M120"] = {
		class = "hvap_pod_rkt_hellfire",
		info = {
			Pods = {
				Vector(3.22,102.38,59.59),
				Vector(3.22,-102.38,59.59),
			},
			Sequential = false,
			Ammo = 16
		}
	}
}

ENT.Weapons2 = {
	["Zoom"] = {
		class = "hvap_pod_zoom",
		info = {
			ShootPos = Vector(175, 0, 23),
			ShootOffset = Vector(-640, 0, 0)
		}
	},
	["S-8 Right"] = {
		class = "hvap_pod_rkt_hydra40",
		info = {
			Pods = {
				Vector(40.25, -36.33, 32.93)
			},
			Sequential = false,
			Ammo = 20,
		}
	},
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
	model = "models/bf2/helicopters/mil mi-28/mi28_g1.mdl",
	pos = Vector(120,0,20),
	offset = Vector(0,0,0),
	viewPos = Vector(202,0,52),
	maxAng = Angle(45, 120, 0),--maxdown, max left
	minAng = Angle(-10, -120, 0),--maxup, max right
	seat = 2
}

ENT.WeaponAttachments = {

	gunMount1 = {
		model = "models/bf2/helicopters/mil mi-28/mi28_g2.mdl",
		pos = Vector(120,0,33),
		restrictPitch = true
	},
	
	gun = {
		model = "models/bf2/helicopters/mil mi-28/mi28_w2.mdl",
		pos = Vector(182,0,47),
		offset = Vector(1,0,0)
	},
	
	radar1 = {
		model = "models/bf2/helicopters/mil mi-28/mi28_radar1.mdl",
		pos = Vector(181.44,0,56.65),
		restrictPitch = true
	},

}

ENT.Wheels = {
	{
		mdl="models/bf2/helicopters/mil mi-28/mi28_w2.mdl",
		pos=Vector(-416.87,0,52),
		friction=100,
		mass=800,
	},
	{
		mdl="models/bf2/helicopters/mil mi-28/mi28_w1.mdl",
		pos=Vector(48.68,-49.39,3),
		friction=100,
		mass=1000,
	},
	{
		mdl="models/bf2/helicopters/mil mi-28/mi28_w1.mdl",
		pos=Vector(48.68,49.39,3),
		friction=100,
		mass=1000,
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
	Rotate = Vector(3.8, 3.4, 4),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "HVAP.Engine.HC_4.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_4.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_5.Rotor.Near", -- rotor_close
	RotorFar = "HVAP.Engine.HC_5.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_5.Engine.Near", -- engine_close
	EngineFar = "HVAP.Engine.HC_5.Engine.Far", -- engine_far	
	EngineWhine = "HVAP.Engine.HC_4.Rotor.Turbine", -- turbine
}
