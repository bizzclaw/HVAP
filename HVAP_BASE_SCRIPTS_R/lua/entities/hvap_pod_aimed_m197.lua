AddCSLuaFile("hvap_pod_aimed_m197.lua")

ENT.Base = "hvap_pod_aimedgun_base"
ENT.Type = "anim"

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

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 0//ammount taken from heat every sec
ENT.HeatMult = 19.7//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 1//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.24
ENT.SndPitch = 192

ENT.AmmoBelt = {
	"apit",
	"hei",
	"hei",
	"heit",
	"apit",
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
			BallisticDrag	= 40,--Caliber/Case*100
			Drift=2.04,--case*.02
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
			BallisticDrag	= 40,--Caliber/Case*100
			Drift=2.04,--case*.02
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
			Timer=1,-- time to remove bullet or to explode if SelfDestr
			col=Color(200, 200, 200),
			Speed=1000,--velocity m/s
			Radius=76,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 40,--Caliber/Case*100
			Drift=2.04,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(30,40),--
			EffectSize = 10,
			Size=20,--caliber
		}
	},	
}

ENT.Sounds = {
	shoot = "hvap/gun/hsmk5_loop.wav",
	stop = "hvap/gun/hsmk5_end.wav",
	blankstop = "hvap/gun/misc/overheated_click_stop.wav", -- sound played when firing but jammed
	blankshoot = "hvap/gun/misc/overheated_click.wav", -- sound played when stop firing but hammed 
	clickstop = "hvap/gun/misc/overheat_click_stop.wav", -- sound plaed when near overheat
	clickshoot = "hvap/gun/misc/overheat_click.wav", -- sound plaed when near overheat stop
	Jam = "hvap/gun/misc/gun_jam.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/gun_ready.wav"
}
