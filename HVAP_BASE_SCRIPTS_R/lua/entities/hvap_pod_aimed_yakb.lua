AddCSLuaFile("hvap_pod_aimed_yakb.lua")

ENT.Base = "hvap_pod_aimedgun_base"
ENT.Type = "anim"

ENT.PrintName = "Yak-B"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "Yak-B"
ENT.Ammo = 1470 
ENT.FireRate = 4000
ENT.Force = 9999999999

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 1.5//ammount taken from heat every sec
ENT.HeatMult = 12//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 10//time it takes for unoverheat
ENT.Caliber = 12.7
ENT.Spread = 0.64
ENT.SndPitch = 192

ENT.AmmoBelt = {--A165 Belt
	"api",
	"apt",
	"api",
	"ap",
	"ap",
	"ap",
	"ap",
	"ap",
	"ap",
	"ap",
	"ap",
	"ap",
	"ap",
	"ap",
	"ap",
	"ap",
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
			Speed=824,--velocity m/s
			Radius=128,--caliber
			Penetrate= 16,--caliber
			BallisticDrag	= 50.8,
			Drift=1.5875,
			Mass=102,--g
			TissueDamage = math.Rand(30,45),--
			EffectSize = 10,
			Size=12.7,--caliber
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
			Speed=824,--velocity m/s
			Radius=128,--caliber
			Penetrate= 16,--caliber
			BallisticDrag	= 50.8,
			Drift=1.5875,
			Mass=102,--g
			TissueDamage = math.Rand(30,45),--
			EffectSize = 10,
			Size=12.7,--caliber
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
			col=Color(20, 250, 20),
			Speed=824,--velocity m/s
			Radius=128,--caliber
			Penetrate= 16,--caliber
			BallisticDrag	= 50.8,
			Drift=1.5875,
			Mass=102,--g
			TissueDamage = math.Rand(30,45),--
			EffectSize = 10,
			Size=12.7,--caliber
		}
	},
}

ENT.Sounds = {
	shoot = "hvap/gun/brezenub_loop.wav",
	stop = "hvap/gun/brezenub_end.wav",
	blankstop = "hvap/gun/misc/overheated_click_stop.wav", -- sound played when firing but jammed
	blankshoot = "hvap/gun/misc/overheated_click.wav", -- sound played when stop firing but hammed 
	clickstop = "hvap/gun/misc/overheat_click_stop.wav", -- sound plaed when near overheat
	clickshoot = "hvap/gun/misc/overheat_click.wav", -- sound plaed when near overheat stop
	Jam = "hvap/gun/misc/gun_jam.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/gun_ready.wav"
}
