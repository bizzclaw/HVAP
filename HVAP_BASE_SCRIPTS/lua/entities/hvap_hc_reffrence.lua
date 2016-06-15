AddCSLuaFile("hvap_hc_rah66.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK" -- i made this
ENT.Category = "REFFRENCE HELICOPTER" -- spawn category
ENT.Spawnable = false -- true
ENT.SpawnHeight = 24 --add height to spawn pos
ENT.PrintName		= "NAME"  -- name

ENT.Model = "MODEL" -- fuselage model dir
ENT.Weight = 4218--empty weight in kg 
ENT.FuselageHealth = 500 --health of fuselage

ENT.HasGear = true -- have anim landing gear?
ENT.GearUpAnim = "gearup" -- anim landing gear up anim
ENT.GearDownAnim = "geardown"-- anim landing gear down anim
ENT.GearBodygroup = 1 -- landing gear wheel bodygroup number

ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 120 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- max dist from seat to where player tried to enter  to enter seat
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 4 -- fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor for true, else engines separate with no tail rotor for false
ENT.Engines = {-- theoretically we should support infinite engines
	{-- engine 1
		pos = Vector(-16,19,80),	
		radius = 32, -- max dist damage to engine to deal damage, closer means more dmg
		info = {
			FirePos = Vector(0,12,4),-- fire, relative to pos
			SmokePos = Vector(18,19,5),-- smoke, relative to pos
			EffectPos = Vector(-56,0,8),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 200, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 200, -- base health of engine
			Power = 1165 ,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel consumption multiplier
		}
	},
	{-- engine 2
		pos = Vector(-16,-19,80),	
		radius = 32,
		info = {
			FirePos = Vector(0,-12,4),-- fire, relative to pos
			SmokePos = Vector(18,-19,5),-- smoke, relative to pos
			EffectPos = Vector(-56,0,8),-- exhaust, relative to pos
			SmokeEffect = "hvap_smoke_trail", -- smokes effect
			EngineEffect = "hvap_heatwave", -- exhaust effect
			engineHealth = 200, -- health of engine should be same as the engines BaseHealth
			BaseHealth = 200, -- base health of engine
			Power = 1165,-- engine power in kW
			MaxRPM = 100, -- engines max rpm
			Consumption = 1, -- fuel consumption multiplier
		}
	}
}

ENT.Rotors = {-- theoretically we should support infinite rotors when coop engines false
	{-- top rotor
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(0,0,0),-- pos for top rotor model
		ang = Angle(0, 0, 0),-- special angles for top rotor
		model = "MODEL",-- top rotor model
		info = {
			Dir = 1, -- spin direction
			Mass = 5, --if rotor dosent spin fast enough increace mass
			RotHealth = 100,--initial rotor health should be same as BaseHealth
			BaseHealth = 100,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor, should stay at 2000
		}
	},
	{--tail rotor
		istail = true, -- is this rotor a tail rotor?
		pos = Vector(0,0,0),-- pos for top rotor model
		ang = Angle(0, 0, 0),-- special angles for top rotor
		model = "MODEL",-- top rotor model
		info = {
			Dir = 1, -- spin direction
			Mass = 5, --if rotor dosent spin fast enough increace mass
			RotHealth = 100,--initial rotor health should be same as BaseHealth
			BaseHealth = 100,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor, should stay at 2000
		}
	}
}

ENT.thirdPerson = {-- thirdpserson view data
	distance = 640, -- distance from position to put camera
	angle = 4, -- vertical view angle
	position = Vector(-64,0,256) --origin for camera
}

ENT.Seats = {-- support for 9 seats 
	{-- this is the pilots seat (seat 1)
		pos = Vector(0, 5, 0),-- position
		exit = Vector(100,10,0),-- exit position
		weapons = {"Hydra 70 Left"}, -- weapon set 1
		weapons2 = {"Hydra 70 Right"} -- weapon set 2
	},
	{-- this seat has a turret attached to it (seat 2)
		pos = Vector(0, -5, 0),-- position
		exit = Vector(100,-10,0),-- exit position
		weapons = {"XM301"}, -- weapon set 1
		weapons2 = {"Zoom"} -- weapon set 2
	},
	{-- this is a passanger seat rotated 90 degrees (seat 3)
		pos = Vector(0, 0, 0),-- position
		exit = Vector(100,10,0),-- exit position
		ang = Angle(0,90,0) -- special angles rotating seat 90 degrees
	},
}

ENT.Weapons = {-- weapon set 1
	["Hydra 70 Left"] = {-- seat 1's left rocket pod
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(40.25, 48.33, 32.93),
			},
			Sequential = false,
			Ammo = 12,
		}
	},
	["XM301"] = {-- seat 2's aimed turret pod
		class = "hvap_pod_aimed_m61",
		info = {
			ShootPos = Vector(187, 0, 29),
			ShootOffset = Vector(0, 0, 0),
			Ammo = 500,
			FireRate = 1500,--750 1500
		}
	},
	["Hellfire"] = {-- seat 2's aimed lock on rocket pod
		class = "hvap_pod_hellfire",
		info = {
			Pods = {
				Vector(50, 60, 40),
				Vector(50, -60, 40),
			}
		}
	}
}

ENT.Weapons2 = {-- weapon set 2
	["Hydra 70 Right"] = {-- seat 1's right rocket pod
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(40.25, -48.33, 32.93)
			},
			Sequential = false,
			Ammo = 12,
		}
	},
	["Zoom"] = {-- seat 2's zoom weapon pod
		class = "hvap_pod_aimed_zoom",
		info = {
			ShootPos = Vector(0, 0, 0),
			ShootOffset = Vector(0, 0, 0)
		}
	}
}

ENT.CounterMeasures = {
	["Flares"] = {-- name dosent really matter
		class = "hvap_pod_cm_flares", -- "hvap_pod_cm_flares" or "hvap_pod_cm_smoke"
		info = {
			Pods = {-- fire countermeasure positions
				Vector(-34,34,58),
				Vector(-34,-34,58),
			},
			Angles = {-- angles to fire countermeasures at
				Angle(15,-90,0),
				Angle(15,90,0),
			},
		}
	}
}

ENT.Camera = {-- the camera for seat 2's turret
	model = "MODEL", --the camera model
	pos = Vector(207,0,53), -- position localto fuselage for camera
	offset = Vector(-1,0,0), -- camera model offset
	viewPos = Vector(10, 0, 5), -- cameras view position
	maxAng = Angle(45, 120, 0), --  angles for (-down, -left, 0)
	minAng = Angle(-15, -120, 0),--  angles for (-up, -right, 0)
	seat = 2 -- attach this to seat 2
}

ENT.WeaponAttachments = {

	gunMount1 = {-- dosent matter
		model = "models/props_junk/PopCan01a.mdl", -- part model
		pos = Vector(187,0,29), -- position localto fuselage 
		restrictPitch = true, -- dont elevate?
		restrictYaw = false -- dont rotate?
	},

}

ENT.Extras = { -- extra attachments
	RocketPods = { -- dosent matter
		model = "MODEL", -- model for extra attachment
		pos = Vector(0,0,0),-- pos for attachment
		ang = Angle(0,0,0),-- angle for attachment
	},
}

ENT.Wheels={
	{
		mdl="MODEL",-- wheel model
		pos=Vector(106.5,-38,3.5),-- wheel pos
		friction=70,-- friction
		mass=100,-- mass
	},
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
	Rail = Vector(3, 2, 1),-- 3,2,1
	RailRotor = 1, -- 1
	AngleDrag = Vector(0.1, 0.1, 0.1),
	Rotate = Vector(3.2, 4, 3.8),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "hvap/engine/air/helicopter/shared/heli_start_2.wav", -- heli_start_#
	Cockpit = "hvap/engine/air/helicopter/hc_2/cockpit.wav", -- cockpit

	RotorNear = "hvap/engine/air/helicopter/hc_9/rotor_close.wav", -- rotor_close
	RotorFar = "hvap/engine/air/helicopter/hc_9/rotor_far.wav", -- rotor_far
	
	EngineNear = "hvap/engine/air/helicopter/hc_2/engine_close.wav", -- engine_close
	EngineFar = "hvap/engine/air/helicopter/hc_2/engine_far.wav", -- engine_far	
	EngineWhine = "hvap/engine/air/helicopter/hc_2/turbine.wav", -- turbine
}
