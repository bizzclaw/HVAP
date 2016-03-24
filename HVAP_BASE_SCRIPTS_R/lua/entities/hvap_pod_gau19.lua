AddCSLuaFile("hvap_pod_gau19.lua")

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "anim"

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

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 3//ammount taken from heat every sec
ENT.HeatMult = 8//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 4//time it takes for unoverheat
ENT.Caliber = 12.5
ENT.Spread = 0.512
ENT.SndPitch = 160

ENT.AmmoBelt = {--A165 Belt
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
			BallisticDrag	= 50.8,
			Drift=1.5875,
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
			BallisticDrag	= 50.8,
			Drift=1.5875,
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
			BallisticDrag	= 50.8,
			Drift=1.5875,
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
			BallisticDrag	= 50.8,
			Drift=1.5875,
			Mass=102,--g
			TissueDamage = math.Rand(34,42),--
			EffectSize = 10,
			Size=12.7--caliber
		}
	},
}

ENT.Sounds = {
	shoot = "hvap/gun/m3_loop.wav", -- sound played when firing
	stop = "hvap/gun/m3_end.wav", -- sound played when stop firing
	blankstop = "hvap/gun/misc/overheated_click_stop.wav", -- sound played when firing but jammed
	blankshoot = "hvap/gun/misc/overheated_click.wav", -- sound played when stop firing but hammed 
	clickstop = "hvap/gun/misc/overheat_click_stop.wav", -- sound plaed when near overheat
	clickshoot = "hvap/gun/misc/overheat_click.wav", -- sound plaed when near overheat stop
	Jam = "hvap/gun/misc/overheat.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/overheat_end.wav"
}
