AddCSLuaFile("hvap_pod_aimed_2a42.lua")

ENT.Base = "hvap_pod_aimedgun_base"
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
ENT.FireRate = 550
ENT.Force = 9999999999

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 0//ammount taken from heat every sec
ENT.HeatMult = 39.5//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 1//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.24
ENT.SndPitch = 132

ENT.AmmoBelt = {
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
			Tracer=true,
			Timer=12,
			col=Color(205, 215, 205),
			Speed=960,
			Radius=64,
			Penetrate= 15,
			BallisticDrag	= 36,
			Drift=1.3,
			Mass=388,
			TissueDamage = math.Rand(30,40),
			EffectSize = 10,
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
			Speed=960,
			Radius=64,
			Penetrate= 16,
			BallisticDrag	= 36,
			Drift=1.3,
			Mass=390,
			TissueDamage = math.Rand(32,45),
			EffectSize = 10,
			Size=30,	
		}
	},	
	["apt"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,
			Timer=12,
			col=Color(5, 255, 5),
			Speed=880,
			Radius=64,
			Penetrate= 30,
			BallisticDrag	= 36,
			Drift=1.3,
			Mass=400,
			TissueDamage = math.Rand(50,65),
			EffectSize = 10,
			Size=30,	
		}
	},	
}

ENT.Sounds = {
	shoot = "hvap/gun/vya23_loop.wav",
	stop = "hvap/gun/vya23_end.wav",
	blankstop = "hvap/gun/misc/overheated_click_stop.wav", -- sound played when firing but jammed
	blankshoot = "hvap/gun/misc/overheated_click.wav", -- sound played when stop firing but hammed 
	clickstop = "", -- sound plaed when near overheat
	clickshoot = "", -- sound plaed when near overheat stop
	Jam = "hvap/gun/misc/gun_jam.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/gun_ready.wav"
}
