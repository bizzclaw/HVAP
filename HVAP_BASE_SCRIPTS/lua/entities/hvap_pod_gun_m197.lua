AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "M197"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "M197"
ENT.Ammo = 750
ENT.FireRate = 1500
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 0//ammount taken from heat every sec
ENT.HeatMult = 39.41//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 0.256//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.12
ENT.SndPitch = 100

ENT.AmmoBelt = {
	{
		"apit",
		"hei",
		"hei",
		"heit",
		"apit",
	}
}

ENT.AmmoData = {
	["apit"] = {
		class = "hvap_bullet_api",
		info = {
			Large=false,-- makes tracer thicker, plays flyby, larger explosion effect (really for tank caliber shells)
			SelfDestr=false,
			Flak=false,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(255, 20, 20),
			Speed=1030,--velocity m/s
			Radius=76,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,--Caliber/Case*100
			Drift=1.1,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(40,55),--
			EffectSize = 10,
			Size=20,--caliber
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
			Speed=1030,--velocity m/s
			Radius=80,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,--Caliber/Case*100
			Drift=1.3,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(32,45),--
			EffectSize = 10,
			Size=20,--caliber
		}
	},	
	["heit"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=true,
			Flak=false,
			Tracer=true,--tracer?
			Timer=0.4,-- time to remove bullet or to explode if SelfDestr
			col=Color(200, 200, 200),
			Speed=1000,--velocity m/s
			Radius=76,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,--Caliber/Case*100
			Drift=1.2,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(30,40),--
			EffectSize = 10,
			Size=20,--caliber
		}
	},	
}

ENT.Sounds = {
	shoot = "HVAP.Gun.M230.Loop", -- sound played when firing
	stop = "HVAP.Gun.M230.End", -- sound played when stop firing
	blank = "", -- sound played when stop firing but hammed 
	clickstop = "", -- sound plaed when near overheat
	clickshoot = "", -- sound plaed when near overheat stop
	Jam = "", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Ready"
}
