AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "GIAT30"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "GIAT30"
ENT.Ammo = 750
ENT.FireRate = 2500
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 2//ammount taken from heat every sec
ENT.HeatMult = 13//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 4//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.24
ENT.SndPitch = 84

ENT.AmmoBelt = {
	{
		"ap",
		"ap",
		"ap",
		"hei",
		"hei",
		"hei",
		"ap",
		"apit",--aphei
		"ap",
		"hei",
		"hei",
		"hei",
	}
}


ENT.AmmoData = {
	["apit"] = {
		class = "hvap_bullet_api",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,
			Timer=12,
			col=Color(10, 250, 10),
			Speed=1025,
			Radius=80,
			Penetrate= 30,
			BallisticDrag	= 20,
			Drift=1.28,
			Mass=270,
			TissueDamage = math.Rand(70,80),
			EffectSize = 12,
			Size=30,
		}
	},
	["ap"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,
			Timer=12,
			col=Color(0, 0, 0),
			Speed=1025,
			Radius=80,
			Penetrate= 30,
			BallisticDrag	= 20,
			Drift=1.3,
			Mass=270,
			TissueDamage = math.Rand(70,80),
			EffectSize = 12,
			Size=30,
		}
	},	
	["hei"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,
			Timer=12,
			col=Color(0, 0, 0),
			Speed=810,
			Radius=80,
			Penetrate= 30,
			BallisticDrag	= 20,
			Drift=1.6,
			Mass=244,
			TissueDamage = math.Rand(60,66),
			EffectSize = 12,
			Size=30,
		}
	},	
}

ENT.Sounds = {
	shoot = "HVAP.Gun.ShVAK.Fire.Loop", -- sound played when firing
	stop = "HVAP.Gun.ShVAK.Fire.End", -- sound played when stop firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}
