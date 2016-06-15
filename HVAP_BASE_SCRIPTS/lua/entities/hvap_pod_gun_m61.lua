AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "M61"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "M61"
ENT.Ammo = 1000
ENT.FireRate = 1500
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 0//ammount taken from heat every sec
ENT.HeatMult = 19.81//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 0.2//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.24
ENT.SndPitch = 128

ENT.AmmoBelt = {
	{
		"ap",
		"apt",
		"ap",

		"api",
		"api",
		"api",
		
		"ap",
		"ap",
		"ap",
		
		"api",
		"apit",
		"api",	
		
		"ap",
		"ap",	
		
		"api",
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
			Speed=890,--velocity m/s
			Radius=32,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.15,
			Mass=102,--g
			TissueDamage = math.Rand(34,45),--
			EffectSize = 10,
			Size=20--caliber
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
			Speed=890,--velocity m/s
			Radius=32,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.16,
			Mass=102,--g
			TissueDamage = math.Rand(34,45),--
			EffectSize = 10,
			Size=20--caliber
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
			col=Color(255, 20, 0),
			Speed=890,--velocity m/s
			Radius=32,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.128,
			Mass=102,--g
			TissueDamage = math.Rand(34,42),--
			EffectSize = 10,
			Size=20--caliber
		}
	},
	["apit"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(255, 10, 10),
			Speed=890,--velocity m/s
			Radius=32,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.2,
			Mass=102,--g
			TissueDamage = math.Rand(34,42),--
			EffectSize = 10,
			Size=20--caliber
		}
	},
}


ENT.Sounds = {
	shoot = "HVAP.Gun.M2.Loop", -- sound played when firing
	stop = "HVAP.Gun.M2.End", -- sound played when stop firing
	blank = "", -- sound played when stop firing but hammed 
	clickstop = "", -- sound plaed when near overheat
	clickshoot = "", -- sound plaed when near overheat stop
	Jam = "", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Ready"
}
