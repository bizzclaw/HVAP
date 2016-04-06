AddCSLuaFile("hvap_pod_m4.lua")

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "anim"

ENT.PrintName = "M4"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "M4"
ENT.Ammo = 30
ENT.FireRate = 150
ENT.Force = 9999999999

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 12//ammount taken from heat every sec
ENT.HeatMult = 192//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 3//time it takes for unoverheat
ENT.Caliber = 37
ENT.Spread = 0.256
ENT.SndPitch = 100
ENT.SingleFire = true

ENT.AmmoBelt = {--A165 Belt
	"het",
}

ENT.AmmoData = {
	["het"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=true,
			Flak=true,
			Tracer=true,--tracer?
			Timer=2,-- time to remove bullet or to explode if SelfDestr
			col=Color(192, 128, 128),
			Speed=610,--velocity m/s
			Radius=64,--caliber
			Penetrate= 1,--caliber
			BallisticDrag	= 50.8,
			Drift=1.6,
			Mass=200,--g
			TissueDamage = math.Rand(66,70),--
			EffectSize = 20,
			Size=37--caliber
		}
	}
}

ENT.Sounds = {
	fire = "hvap/gun/m4_shoot.wav",
	blankstop = "hvap/gun/misc/overheated_click_stop.wav", -- sound played when firing but jammed
	blankshoot = "hvap/gun/misc/overheated_click.wav", -- sound played when stop firing but hammed 
	clickstop = "hvap/gun/misc/overheat_click_stop.wav", -- sound plaed when near overheat
	clickshoot = "hvap/gun/misc/overheat_click.wav", -- sound plaed when near overheat stop
	Jam = "hvap/gun/misc/overheat.wav", -- sound to play when gun jams
	GunReady = "hvap/gun/misc/overheat_end.wav"
}
