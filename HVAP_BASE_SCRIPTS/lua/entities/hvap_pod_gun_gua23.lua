AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "GUA23"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "GUA23"
ENT.Ammo = 550
ENT.FireRate = 800
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 2.56//ammount taken from heat every sec
ENT.HeatMult = 16//ammount added per bullet fired  1000 threshold 39.5
ENT.HeatTime = 2//time it takes for unoverheat
ENT.Caliber = 30
ENT.Spread = 0.512
ENT.SndPitch = 160

ENT.AmmoBelt = {--A165 Belt
	{
		"heit",
		"hei",
		"apt",
		"hei",
		"apt",
	}
}

ENT.AmmoData = {
	["heit"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(205, 215, 205),
			Speed=960,--velocity m/s
			Radius=64,--caliber
			Penetrate= 150,--caliber
			BallisticDrag	= 20,--Caliber/Case*100
			Drift=1.3,--case*.02
			Mass=388,--g
			TissueDamage = math.Rand(30,40),
			EffectSize = 10,
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
			Speed=960,--velocity m/s
			Radius=64,--caliber
			Penetrate= 150,--caliber
			BallisticDrag	= 20,--Caliber/Case*100
			Drift=1.3,--case*.02
			Mass=390,--g
			TissueDamage = math.Rand(32,45),
			EffectSize = 10,
			Size=30,--caliber	
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
			col=Color(5, 255, 5),
			Speed=880,--velocity m/s
			Radius=64,--caliber
			Penetrate= 30,--caliber
			BallisticDrag	= 20,--Caliber/Case*100
			Drift=1.3,--case*.02
			Mass=400,--g
			TissueDamage = math.Rand(50,65),
			EffectSize = 10,
			Size=30--caliber	
		}
	}
}

ENT.Sounds = {
	shoot = "HVAP.Gun.MK103.Fire.Loop", -- sound played when firing
	stop = "HVAP.Gun.MK103.Fire.End", -- sound played when stop firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}
