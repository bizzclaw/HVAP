AddCSLuaFile("hvap_pod_aimed_giat30.lua")

ENT.Base = "hvap_pod_aimedgun_base"
ENT.Type = "anim"

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

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 2//ammount taken from heat every sec
ENT.HeatMult = 13//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 4//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.24
ENT.SndPitch = 84

ENT.AmmoBelt = {
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
			BallisticDrag	= 53.08,
			Drift=2,
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
			BallisticDrag	= 53.08,
			Drift=2,
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
			BallisticDrag	= 53.08,
			Drift=2,
			Mass=244,
			TissueDamage = math.Rand(60,66),
			EffectSize = 12,
			Size=30,
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
