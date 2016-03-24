AddCSLuaFile("hvap_pod_aimed_artty.lua")

ENT.Base = "hvap_pod_tankgun_base"
ENT.Type = "anim"

ENT.PrintName = "Flak18"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "Flak18"
ENT.Ammo = 75
ENT.Force = 9999999999

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.ReloadTime = 3.5//time it takes for unoverheat
ENT.Caliber = 88
ENT.Spread = 0.24
ENT.SndPitch = 132

ENT.AmmoBelt = {
	"he",
}


ENT.AmmoData = {
	["he"] = {
		class = "hvap_bullet_cnn_he",
		info = {
			Large=true,
			SelfDestr=false,
			Flak=false,
			Tracer=true,
			Timer=60,
			col=Color(228, 228, 204),
			Speed=420,
			Radius=700,
			Penetrate= 2,
			BallisticDrag = 51.2,
			Drift=0.1,
			Mass=10000,
			TissueDamage = math.Rand(300,400),
			EffectSize = 60,
			Size=120,	
		}
	}	
}

ENT.Sounds = {
	shoot = {
		"hvap/gun/cannon_105mm_howitzer.wav",
	},
	reload = {
		"hvap/gun/misc/gun_ready.wav"
	}
}
