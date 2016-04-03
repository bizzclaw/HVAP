AddCSLuaFile("hvap_pod_m60.lua")

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "anim"

ENT.PrintName = "M60"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "M60"
ENT.Ammo = 750
ENT.FireRate = 650
ENT.Force = 9999999999

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 4//ammount taken from heat every sec
ENT.HeatMult = 22//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 4//time it takes for unoverheat
ENT.Caliber = 7.62
ENT.Spread = 0.512
ENT.SndPitch = 85

ENT.AmmoBelt = {--A165 Belt
	"ball",
	"ball",
	"ball",
	"ball",
	"apt",
}

ENT.AmmoData = {
	["apt"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 255, 0),
			Speed=850,--velocity m/s
			Radius=7.62,--caliber
			Penetrate= 7,--caliber
			BallisticDrag	= 32,
			Drift=2,
			Mass=9.5,--g
			TissueDamage = math.Rand(20,39),
			EffectSize=5,
			Size=7.62--caliber	
		}
	},
	["ball"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=853,--velocity m/s
			Radius=7.62,--caliber
			Penetrate= 7.62,--caliber
			BallisticDrag = 32,
			Drift=2,
			Mass=9.5,--g
			TissueDamage = math.Rand(20,39),
			EffectSize=5,
			Size=7.62--caliber	
		}
	},	
}

ENT.Sounds = {
	shoot = "hvap/gun/mg81_loop.wav", -- sound played when firing
	stop = "hvap/gun/mg81_end.wav", -- sound played when stop firing
	blankstop = "hvap/gun/misc/overheated_click_stop.wav", -- sound played when firing but jammed
	blankshoot = "hvap/gun/misc/overheated_click.wav", -- sound played when stop firing but hammed 
	clickstop = "hvap/gun/misc/overheat_click_stop.wav", -- sound plaed when near overheat
	clickshoot = "hvap/gun/misc/overheat_click.wav", -- sound plaed when near overheat stop
	Jam = "hvap/gun/misc/gun_jam.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/gun_ready.wav"
}
