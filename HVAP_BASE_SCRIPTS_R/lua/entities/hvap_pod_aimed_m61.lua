AddCSLuaFile("hvap_pod_aimed_m61.lua")

ENT.Base = "hvap_pod_aimedgun_base"
ENT.Type = "anim"

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

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 0//ammount taken from heat every sec
ENT.HeatMult = 19.8//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 1//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.24
ENT.SndPitch = 128

ENT.AmmoBelt = {
	"api",
	"apit",
	"api",
	"hei",--aphei
	"hei",
	"hei",
	"saphei",
	"api",
	"saphei",
}


ENT.AmmoData = {
	["apit"] = {
		class = "hvap_bullet_api",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(10, 250, 10),
			Speed=1030,--velocity m/s
			Radius=128,--caliber
			Penetrate= 32,--caliber
			BallisticDrag	= 53.08,--Caliber/Case*100 if < 40 then *2
			Drift=2.26,--case*.02
			Mass=100,--g
			TissueDamage = math.Rand(70,80),--
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
			Speed=1030,--velocity m/s
			Radius=128,--caliber
			Penetrate= 32,--caliber
			BallisticDrag	= 53.08,--Caliber/Case*100 if < 40 then *2
			Drift=2.26,--case*.02
			Mass=101,--g
			TissueDamage = math.Rand(70,80),--
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
			Timer=10,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=1030,--velocity m/s
			Radius=128,--caliber
			Penetrate= 30,--caliber
			BallisticDrag	= 53.08,--Caliber/Case*100 if < 40 then *2
			Drift=2.26,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(60,66),--
			EffectSize = 12,
			Size=30,--caliber
		}
	},	
	["saphei"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=10,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=1050,--velocity m/s
			Radius=128,--caliber
			Penetrate= 40,--caliber
			BallisticDrag	= 53.08,--Caliber/Case*100 if < 40 then *2
			Drift=2.26,--case*.02
			Mass=102.4,--g
			TissueDamage = math.Rand(60,66),--
			EffectSize = 12,
			Size=30,--caliber
		}
	},	
}

ENT.Sounds = {
	shoot = "hvap/gun/fmct160_loop.wav",
	stop = "hvap/gun/fmct160_end.wav",
	blankstop = "hvap/gun/misc/overheated_click_stop.wav", -- sound played when firing but jammed
	blankshoot = "hvap/gun/misc/overheated_click.wav", -- sound played when stop firing but hammed 
	clickstop = "", -- sound plaed when near overheat
	clickshoot = "", -- sound plaed when near overheat stop
	Jam = "hvap/gun/misc/gun_jam.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/gun_ready.wav"
}
