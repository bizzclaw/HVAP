AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "M230"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "M230"
ENT.Ammo = 750
ENT.FireRate = 600
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 10//ammount taken from heat every sec
ENT.HeatMult = 32//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 10//time it takes for unoverheat
ENT.Caliber = 30
ENT.Spread = 0.12
ENT.SndPitch = 88

ENT.AmmoBelt = {
	{
		"apit",
		"api",
		"he",
		"apit",
		"hei",
		"he",
	}
}

ENT.AmmoData = {
	["he"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,-- makes tracer thicker, plays flyby, larger explosion effect (really for tank caliber shells)
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=805,--velocity m/s
			Radius=80,--caliber
			Penetrate= 30,--caliber
			BallisticDrag	= 20,--Caliber/Case*100 if < 40 then *2
			Drift=1.4,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(35,45),--
			EffectSize = 12,
			Size=30,--caliber
		}
	},
	["hei"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=805,--velocity m/s
			Radius=80,--caliber
			Penetrate= 30,--caliber
			BallisticDrag	= 20,--Caliber/Case*100
			Drift=1.43,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(40,45),--
			EffectSize = 12,
			Size=30,--caliber
		}
	},	
	["apit"] = {
		class = "hvap_bullet_api",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(255, 10, 10),
			Speed=800,--velocity m/s
			Radius=80,--caliber
			Penetrate= 30,--caliber
			BallisticDrag	= 20,--Caliber/Case*100 if < 40 then *2
			Drift=1.2,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(40,50),--
			EffectSize = 12,
			Size=30,--caliber
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
			Speed=800,--velocity m/s
			Radius=80,--caliber
			Penetrate= 30,--caliber
			BallisticDrag	= 20,--Caliber/Case*100 if < 40 then *2
			Drift=1.128,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(40,50),--
			EffectSize = 12,
			Size=30,--caliber
		}
	},	
}


ENT.Sounds = {
	shoot = "HVAP.Gun.M230.Loop", -- sound played when firing
	stop = "HVAP.Gun.M230.End", -- sound played when stop firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}
