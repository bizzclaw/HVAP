AddCSLuaFile("hvap_pod_aimed_flak18.lua")

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
	"flak",
}


ENT.AmmoData = {
	["flak"] = {
		class = "hvap_bullet_flak",
		info = {
			Large=true,
			SelfDestr=true,
			Flak=true,
			Tracer=true,
			Timer=2.56,
			col=Color(228, 228, 204),
			Speed=820,
			Radius=400,
			Penetrate= 1,
			BallisticDrag	= 36,
			Drift=1.6,
			Mass=388,
			TissueDamage = math.Rand(200,256),
			EffectSize = 10,
			Size=88,	
		}
	}	
}

ENT.Sounds = {
	shoot = {
		"hvap/gun/aa37mm_fire_01.wav",
		"hvap/gun/aa37mm_fire_02.wav",
		"hvap/gun/aa37mm_fire_03.wav",
	},
	reload = {
		"hvap/gun/misc/gun_ready.wav"
	}
}
