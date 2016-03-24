AddCSLuaFile("hvap_pod_aimed_m134.lua")

ENT.Base = "hvap_pod_aimedgun_base"
ENT.Type = "anim"

ENT.PrintName = "M134"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "M134"
ENT.Ammo = 750
ENT.FireRate = 3000
ENT.Force = 9999999999

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 9//ammount taken from heat every sec
ENT.HeatMult = 16//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 4//time it takes for unoverheat
ENT.Caliber = 7.62
ENT.Spread = 0.20
ENT.SndPitch = 90

ENT.AmmoBelt = {--A165 Belt
	"apit",
	"ball",
	"ball",
	"ball",
	"ball",
	"ball",
	"ball",
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
			col=Color(255, 0, 0),
			Speed=853,--velocity m/s
			Radius=7.62,--caliber
			Penetrate= 7.62,--caliber
			BallisticDrag	= 21,
			Drift=2,
			Mass=9.5,--g
			TissueDamage = math.Rand(19.431,38.862),
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
			Penetrate= 10,--caliber
			BallisticDrag = 21,
			Drift=2,
			Mass=9.5,--g
			TissueDamage = math.Rand(19.431,38.862),
			EffectSize=5,
			Size=7.62--caliber	
		}
	},	
}

ENT.Sounds = {
	shoot = "hvap/gun/m134_loop.wav", -- sound played when firing
	stop = "hvap/gun/m134_end.wav", -- sound played when stop firing
	blankstop = "hvap/gun/misc/overheated_click_stop.wav", -- sound played when firing but jammed
	blankshoot = "hvap/gun/misc/overheated_click.wav", -- sound played when stop firing but hammed 
	clickstop = "hvap/gun/misc/overheat_click_stop.wav", -- sound plaed when near overheat
	clickshoot = "hvap/gun/misc/overheat_click.wav", -- sound plaed when near overheat stop
	Jam = "hvap/gun/misc/gun_jam.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/gun_ready.wav"
}
