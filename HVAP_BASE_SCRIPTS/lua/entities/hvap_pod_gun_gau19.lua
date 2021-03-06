AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "GAU-19"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "GAU-19"
ENT.Ammo = 2000
ENT.FireRate = 2000
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 3//ammount taken from heat every sec
ENT.HeatMult = 8//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 4//time it takes for unoverheat
ENT.Caliber = 12.5
ENT.Spread = 0.512
ENT.SndPitch = 160

ENT.AmmoBelt = {
	{
		"api",
		"ap",
		"api",
		
		"ap",
		"ap",
		"ap",
		
		"api",
		"apt",
		"apit",
		
		"ap",
		"ap",
		"ap",
		
		"api",
		"ap",
		"api",
		
		"ap",
		"ap",
		"ap",
		
		"api",	
		"ap",
		"api",
		
		"ap",
		"ap",
		"ap",
		
		"api",
		"ap",
		"api",
		
		"ap",
		"ap",
		"ap",
		
		"api",
		"ap",
		"api",
		
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
			Speed=890,--velocity m/s
			Radius=32,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.4,
			Mass=102,--g
			TissueDamage = math.Rand(34,45),--
			EffectSize = 10,
			Size=12.7--caliber
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
			Drift=1.4,
			Mass=102,--g
			TissueDamage = math.Rand(34,45),--
			EffectSize = 10,
			Size=12.7--caliber
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
			Drift=1.4,
			Mass=102,--g
			TissueDamage = math.Rand(34,42),--
			EffectSize = 10,
			Size=12.7--caliber
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
			Drift=1.4,
			Mass=102,--g
			TissueDamage = math.Rand(34,42),--
			EffectSize = 10,
			Size=12.7--caliber
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
