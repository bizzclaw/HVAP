AddCSLuaFile("hvap_hc_rah66.lua")

ENT.Base = "hvap_hc_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Aircraft US"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.SpawnHeight = 24
ENT.PrintName		= "RAH-66 Comanche"

ENT.Model = "Models/Sentry/RAH66.mdl"
ENT.Weight = 4218--empty weight in kg 
ENT.FuselageHealth = 500 --idk

ENT.HasGear = true
ENT.GearUpAnim = "gearup"
ENT.GearDownAnim = "geardown"
ENT.GearBodygroup = 1

ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 120 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 80 -- idk
ENT.Fuel = 100 -- starting fuel ammount should be same as BaseFuel
ENT.BaseFuel = 100 -- original fuel capacity
ENT.FuelConMult = 4 -- fuel consumption multiplier
ENT.CoopEngines = true -- engines work together powering 1 rotor with 1 tail rotor, else engines separate with no tail rotor
ENT.Engines = {
	{
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
			Consumption = 1, -- fuel taken mult
		}
	},

	{
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
			Consumption = 1, -- this engines fuel consumption multiplier
		}
	}
}

ENT.Rotors = {
	{
		istail = false, -- is this rotor a tail rotor?
		pos = Vector(30,0,113.5),
		ang = Angle(0, 0, 0),
		model = "Models/Sentry/RAH66_tr.mdl",
		info = {
			Dir = 1,
			Mass = 5, --effects how shaky the aircraft is
			RotHealth = 100,--initial rotor health should be same as BaseHealth
			BaseHealth = 100,--rotor health
			MaxRPM = 2000 -- max(good) rpm for rotor
		}
	},
	
	{
		istail = true, -- is this rotor a tail rotor?
		pos = Vector(-235.61,0,54),
		ang = Angle(0, 0, -15),
		model = "Models/sentry/RAH66_br.mdl",
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
		pos = Vector(134, 0, 46),
		exit = Vector(134,70,0),
		weapons = {"Hydra 70 Left"},
		weapons2 = {"Hydra 70 Right"}
	},
	{
		pos = Vector(78, 0, 56),
		exit = Vector(78,70,0),
		weapons = {"XM301"},
		weapons2 = {"Zoom"}
	},
}

ENT.Weapons = {
	["Hydra 70 Left"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(40.25, 48.33, 32.93),
			},
			Sequential = false,
			Ammo = 12,
		}
	},
	["XM301"] = {
		class = "hvap_pod_gun_m61",
		info = {
			Pods = {
				Vector(70, 0, 0),
			},
			ShootOffset = Vector(0, 0, 0),
			IsAimed = true,
			Ammo = 500,
			FireRate = 1500,--750 1500
		}
	},
	["Hellfire"] = {
		class = "hvap_pod_rkt_hellfire",
		info = {
			Pods = {
				Vector(50, 60, 40),
				Vector(50, -60, 40),
			}
		}
	}
}

ENT.Weapons2 = {
	["Hydra 70 Right"] = {
		class = "hvap_pod_rkt_hydra",
		info = {
			Pods = {
				Vector(40.25, -48.33, 32.93)
			},
			Sequential = false,
			Ammo = 12,
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
	model = "models/sentry/rah66_gun.mdl",
	pos = Vector(187, 0, 23),
	offset = Vector(-1,0,0),
	viewPos = Vector(40, 0, 24),
	maxAng = Angle(45, 120, 0),
	minAng = Angle(-15, -120, 0),
	seat = 2
}

ENT.WeaponAttachments = {

	gun = {
		model = "models/sentry/rah66_cam.mdl",
		pos = Vector(207,0,53),
		offset = Vector(2,0,0),
		restrictPitch = true
	},

}

ENT.Wheels={
	{
		mdl="models/sentry/rah66_fwheel.mdl",
		pos=Vector(106.5,-38,3.5),
		friction=70,
		mass=100,
	},
	{
		mdl="models/sentry/rah66_fwheel.mdl",
		pos=Vector(106.5,38,3.5),
		friction=70,
		mass=100,
	},
	{
		mdl="models/sentry/rah66_bwheel.mdl",
		pos=Vector(-199,0,2),
		friction=70,
		mass=160,
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
	Rotate = Vector(3.2, 4, 3.8),-- rotation multipliers (roll) (pitch) (yaw)
}

ENT.Sounds = {
	Start = "HVAP.Engine.HC_2.Start", -- heli_start_#
	Cockpit = "HVAP.Engine.HC_10.Cockpit", -- cockpit

	RotorNear = "HVAP.Engine.HC_9.Rotor.Far", -- rotor_close
	RotorFar = "HVAP.Engine.HC_9.Rotor.Far", -- rotor_far
	
	EngineNear = "HVAP.Engine.HC_3.Engine.Far", -- engine_close
	EngineFar = "HVAP.Engine.HC_3.Engine.Far", -- engine_far	
	EngineWhine = "", -- turbine
}

if SERVER then

function ENT:Initialize()
	self:base("hvap_hc_base").Initialize(self)
	self.Value=0
	self.TargetValue=0
end

function ENT:PhysicsUpdate(ph)
	self:base("hvap_hc_base").PhysicsUpdate(self,ph)
	if self:GetNWInt("seat_1_actwep") == 1 then
		self.TargetValue=1
	else
		self.TargetValue=0.01
	end
	self.Set = self.TargetValue
	if self.Set != self.TargetValue then 
		self.Value = math.Clamp(Lerp( .03, self.Value, self.TargetValue), 0 , 1)
		self:SetPoseParameter("weapons", self.Set)
	else
		self:SetPoseParameter("weapons", self.TargetValue)
	end
end

end
