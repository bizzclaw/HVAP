AddCSLuaFile("hvap_pod_aimed_flak18.lua")

ENT.Base = "hvap_pod_tankgun_base"
ENT.Type = "point"

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

ENT.ReloadTime = 5//time it takes for unoverheat
ENT.Caliber = 88
ENT.Spread = 0.128
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
			Timer=0.98,
			col=Color(228, 228, 204),
			Speed=820,
			Radius=math.Rand(900,1280),
			Penetrate= 1,
			BallisticDrag	= 36,
			Drift=1,
			Mass=388,
			TissueDamage = math.Rand(420,512),
			EffectSize = 10,
			Size=88
		}
	}	
}

ENT.Sounds = {
	Fire = "HVAP.Gun.88pak.Fire",
	Close = "HVAP.Gun.88pak.Fire",
	Near = "HVAP.Gun.88pak.Far",
	Far = "HVAP.Gun.88pak.Far",
	Distant = "HVAP.Gun.88pak.Far",

	Reload = "HVAP.Reload.Cannon",
	GunReady = "HVAP.Reload.ShellDrop.Large"
}
