AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "Yak-B"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "Yak-B"
ENT.Ammo = 1470 
ENT.FireRate = 4000
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 1.5//ammount taken from heat every sec
ENT.HeatMult = 8//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 8//time it takes for unoverheat
ENT.Caliber = 12.7
ENT.Spread = 0.64
ENT.SndPitch = 180

ENT.AmmoBelt = {--A165 Belt
	{
		"api",
		"apt",
		"api",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"ap",
		"api",
		"ap",
		"api",	
	}
}

ENT.AmmoData = {
	["ap"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=824,--velocity m/s
			Radius=128,--caliber
			Penetrate= 16,--caliber
			BallisticDrag	= 20,
			Drift=1.2,
			Mass=102,--g
			TissueDamage = math.Rand(30,45),--
			EffectSize = 10,
			Size=12.7,--caliber
		}
	},
	["api"] = {
		class = "hvap_bullet_api",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=824,--velocity m/s
			Radius=128,--caliber
			Penetrate= 16,--caliber
			BallisticDrag	= 20,
			Drift=1.3,
			Mass=102,--g
			TissueDamage = math.Rand(30,45),--
			EffectSize = 10,
			Size=12.7,--caliber
		}
	},
	["apt"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(20, 250, 20),
			Speed=824,--velocity m/s
			Radius=128,--caliber
			Penetrate= 16,--caliber
			BallisticDrag	= 20,
			Drift=1.1,
			Mass=102,--g
			TissueDamage = math.Rand(30,45),--
			EffectSize = 10,
			Size=12.7,--caliber
		}
	},
}

ENT.Sounds = {
	shoot = "HVAP.Gun.M3.Loop", -- sound played when firing
	stop = "HVAP.Gun.M3.End", -- sound played when stop firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	clickstop = "HVAP.Gun.Jam.Click.End", -- sound plaed when near overheat
	clickshoot = "HVAP.Gun.Jam.Click.Loop", -- sound plaed when near overheat stop
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}
