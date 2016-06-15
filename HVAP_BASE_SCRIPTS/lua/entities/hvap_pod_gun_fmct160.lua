AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "FMC T160"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "FMC T160"
ENT.Ammo = 1000
ENT.FireRate = 1500
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 4//ammount taken from heat every sec
ENT.HeatMult = 15//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 1//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.6144
ENT.SndPitch = 100

ENT.CoolDown = 5//ammount taken from heat every sec
ENT.HeatMult = 6.4//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 3//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.256
ENT.SndPitch = 100

ENT.AmmoBelt = {--A165 Belt
	{
		"heit",
		"api",	
		"heit",
		"api",		
		"heit",
		"api",	
		"heit",
		"api",	

		"api",	
		"heit",
		"api",	
		"heit",
		"api",		
		"heit",
		"api",	
		"heit",
		
		"hei",
		"aphe",	
		"hei",
		"aphe",	
		
		"api",	
		"api",	
		"api",	
		"api",	
		
		"hei",
		"aphe",	
		"hei",
		"aphe",	
		
		"api",	
		"api",	
		"api",	
		"api",	
		
		"hei",
		"aphe",	
		"hei",
		"aphe",		
	}
}

ENT.AmmoData = {
	["heit"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=true,
			Flak=true,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(255, 32, 32),
			Speed=700,--velocity m/s
			Radius=32,--caliber
			Penetrate= 0,--caliber
			BallisticDrag	= 20,
			Drift=1.2,
			Mass=102,--g
			TissueDamage = math.Rand(128,160),--
			EffectSize = 10,
			Size=20--caliber
		}
	},
	["hei"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=true,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=700,--velocity m/s
			Radius=32,--caliber
			Penetrate= 0,--caliber
			BallisticDrag	= 20,
			Drift=1.3,
			Mass=102,--g
			TissueDamage = math.Rand(128,160),--
			EffectSize = 10,
			Size=20--caliber
		}
	},
	["aphe"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=785,--velocity m/s
			Radius=32,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.2,
			Mass=102,--g
			TissueDamage = math.Rand(128,160),--
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
			Speed=785,--velocity m/s
			Radius=32,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.2,
			Mass=102,--g
			TissueDamage = math.Rand(138,160),--
			EffectSize = 10,
			Size=20--caliber
		}
	},	
}

ENT.Sounds = {
	shoot = "HVAP.Gun.T160.Loop", -- sound played when firing
	stop = "HVAP.Gun.T160.End", -- sound played when stop firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	clickstop = "HVAP.Gun.Jam.Click.End", -- sound plaed when near overheat
	clickshoot = "HVAP.Gun.Jam.Click.Loop", -- sound plaed when near overheat stop
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}