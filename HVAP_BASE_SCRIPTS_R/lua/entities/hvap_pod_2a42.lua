AddCSLuaFile("hvap_pod_2a42.lua")

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "anim"

ENT.PrintName = "2A42"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "2A42"
ENT.Ammo = 550
ENT.FireRate = 800
ENT.Force = 9999999999

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 2.56//ammount taken from heat every sec
ENT.HeatMult = 16//ammount added per bullet fired  1000 threshold 39.5
ENT.HeatTime = 2//time it takes for unoverheat
ENT.Caliber = 30
ENT.Spread = 0.512
ENT.SndPitch = 148

ENT.AmmoBelt = {--A165 Belt
	"heit",
	"hei",
	"apt",
	"hei",
	"apt",
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
			BallisticDrag	= 36,--Caliber/Case*100
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
			BallisticDrag	= 36,--Caliber/Case*100
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
			BallisticDrag	= 36,--Caliber/Case*100
			Drift=1.3,--case*.02
			Mass=400,--g
			TissueDamage = math.Rand(50,65),
			EffectSize = 10,
			Size=30--caliber	
		}
	}
}

ENT.Sounds = {
	shoot = "hvap/gun/vya23_loop.wav",
	stop = "hvap/gun/vya23_end.wav",
	blankstop = "hvap/gun/misc/overheated_click_stop.wav",
	blankshoot = "hvap/gun/misc/overheated_click.wav",
	clickstop = "",
	clickshoot = "",	
	Jam = "hvap/gun/misc/overheat.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/overheat_end.wav"
}
