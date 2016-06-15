AddCSLuaFile("hvap_pod_aimed_flak38.lua")

ENT.Base = "hvap_pod_autotankgun_base"
ENT.Type = "point"

ENT.PrintName = "flak38"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "flak38"
ENT.Ammo = 1000
ENT.FireRate = 800
ENT.Force = 9999999999

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 0//ammount taken from heat every sec
ENT.HeatMult = 50.05//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 0.6//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.25
ENT.SndPitch = 100

ENT.AmmoBelt = {--A165 Belt
	"heit",
	"hei",
	"aphet",
	"hei",
	"apit",	
	"hei"
}

ENT.AmmoData = {
	["heit"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=true,
			Flak=true,
			Tracer=true,--tracer?
			Timer=0.76,-- time to remove bullet or to explode if SelfDestr
			col=Color(250, 250, 250),
			Speed=900,--velocity m/s
			Radius=64,--caliber
			Penetrate= 2,--caliber
			BallisticDrag	= 18,
			Drift=1.4,
			Mass=120,--g
			TissueDamage = math.Rand(66,70),
			EffectSize = 10,
			Size=20--caliber
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
			Speed=900,--velocity m/s
			Radius=80,--caliber
			Penetrate= 2,--caliber
			BallisticDrag	= 17,
			Drift=1.4,
			Mass=120,--g
			TissueDamage = math.Rand(88,95),
			EffectSize = 10,
			Size=20--caliber
		}
	},	
	["aphet"] = {
		class = "hvap_bullet_api",
		info = {
			Large=false,
			SelfDestr=true,
			Flak=false,
			Tracer=true,--tracer?
			Timer=0.58,-- time to remove bullet or to explode if SelfDestr
			col=Color(255, 255, 255),
			Speed=900,--velocity m/s
			Radius=48,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.2,
			Mass=102,--g
			TissueDamage = math.Rand(80,90),--
			EffectSize = 10,
			Size=20--caliber
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
			col=Color(250, 200, 200),
			Speed=800,--velocity m/s
			Radius=44,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 30,
			Drift=1.1,
			Mass=120,--g
			TissueDamage = math.Rand(80,90),--
			EffectSize = 10,
			Size=20--caliber
		}
	},
}

ENT.Sounds = {
	Fire = "HVAP.Gun.20flak38.Fire",
	Close = "HVAP.Gun.20flak38.Far",
	Near = "",
	Far = "",
	Distant = "",
	
	Reload = "HVAP.Reload.AutoCannon",
	GunReady = ""
}
