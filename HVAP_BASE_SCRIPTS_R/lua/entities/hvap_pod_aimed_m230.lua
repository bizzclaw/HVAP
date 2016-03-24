AddCSLuaFile("hvap_pod_aimed_m230.lua")

ENT.Base = "hvap_pod_aimedgun_base"
ENT.Type = "anim"

ENT.PrintName = "M230"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "M230"
ENT.Ammo = 750
ENT.FireRate = 630
ENT.Force = 9999999999

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 10//ammount taken from heat every sec
ENT.HeatMult = 32//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 10//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.24
ENT.SndPitch = 128

ENT.AmmoBelt = {
	"api",--hdep (heat)
	"apit",--hdep (heat)
	"api",--hdep (heat)
	"he",--hdep (heat)
	"hei",
	"he",--hdep (heat)
	"hei",
}

ENT.AmmoData = {
	["he"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,-- makes tracer thicker, plays flyby, larger explosion effect (really for tank caliber shells)
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=805,--velocity m/s
			Radius=80,--caliber
			Penetrate= 30,--caliber
			BallisticDrag	= 53.08,--Caliber/Case*100 if < 40 then *2
			Drift=1.9,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(35,45),--
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
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=805,--velocity m/s
			Radius=80,--caliber
			Penetrate= 30,--caliber
			BallisticDrag	= 53.08,--Caliber/Case*100
			Drift=2.04,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(40,45),--
			EffectSize = 12,
			Size=20,--caliber
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
			col=Color(255, 10, 10),
			Speed=800,--velocity m/s
			Radius=80,--caliber
			Penetrate= 30,--caliber
			BallisticDrag	= 53.08,--Caliber/Case*100 if < 40 then *2
			Drift=1.6,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(40,50),--
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
			Speed=800,--velocity m/s
			Radius=80,--caliber
			Penetrate= 30,--caliber
			BallisticDrag	= 53.08,--Caliber/Case*100 if < 40 then *2
			Drift=1.6,--case*.02
			Mass=102,--g
			TissueDamage = math.Rand(40,50),--
			EffectSize = 12,
			Size=30,--caliber
		}
	},	
}

ENT.Sounds = {
	shoot = "hvap/gun/mk103_loop.wav",
	stop = "hvap/gun/mk103_end.wav",
	blankstop = "hvap/gun/misc/overheated_click_stop.wav", -- sound played when firing but jammed
	blankshoot = "hvap/gun/misc/overheated_click.wav", -- sound played when stop firing but hammed 
	clickstop = "", -- sound plaed when near overheat
	clickshoot = "", -- sound plaed when near overheat stop
	Jam = "hvap/gun/misc/gun_jam.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/gun_ready.wav"
}
