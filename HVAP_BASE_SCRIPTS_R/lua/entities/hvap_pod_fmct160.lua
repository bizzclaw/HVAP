AddCSLuaFile("hvap_pod_fmct160.lua")

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "anim"

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

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

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
			BallisticDrag	= 50.8,
			Drift=1.5875,
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
			BallisticDrag	= 50.8,
			Drift=1.5875,
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
			BallisticDrag	= 50.8,
			Drift=1.5875,
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
			BallisticDrag	= 50.8,
			Drift=1.5875,
			Mass=102,--g
			TissueDamage = math.Rand(138,160),--
			EffectSize = 10,
			Size=20--caliber
		}
	},	
}

ENT.Sounds = {
	shoot = "hvap/gun/fmct160_loop.wav", -- sound played when firing
	stop = "hvap/gun/fmct160_end.wav", -- sound played when stop firing
	blankstop = "hvap/gun/misc/overheated_click_stop.wav", -- sound played when firing but jammed
	blankshoot = "hvap/gun/misc/overheated_click.wav", -- sound played when stop firing but hammed 
	clickstop = "hvap/gun/misc/overheat_click_stop.wav", -- sound plaed when near overheat
	clickshoot = "hvap/gun/misc/overheat_click.wav", -- sound plaed when near overheat stop
	Jam = "hvap/gun/misc/overheat.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/overheat_end.wav"
}
