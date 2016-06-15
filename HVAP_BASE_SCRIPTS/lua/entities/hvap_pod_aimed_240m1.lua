AddCSLuaFile("hvap_pod_aimed_240m1.lua")

ENT.Base = "hvap_pod_tankgun_base"
ENT.Type = "point"

ENT.PrintName = "150"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "150"
ENT.Ammo = 16
ENT.Force = 9999999999

ENT.bulletIndex = 1
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.ReloadTime = 110//time it takes for unoverheat
ENT.Caliber = 240
ENT.Spread = 0.1
ENT.SndPitch = 100

ENT.AmmoBelt = {
	"he",
}

ENT.AmmoData = {
	["he"] = {
		class = "hvap_bullet_he",
		info = {
			Large=true,
			SelfDestr=false,
			Flak=false,
			Tracer=true,
			Timer=16,
			col=Color(234, 32, 64),
			Speed=701,
			Radius=math.Rand(2300,2500),
			Penetrate= 2,
			BallisticDrag	= 28,
			Drift=1,
			Mass=388,
			TissueDamage = math.Rand(5120,6400),
			EffectSize = 10,
			Size=240,
			TracerBurnout = 16
		}
	}	
}

ENT.Sounds = {
	Fire = "HVAP.Gun.128pak44.Fire",
	Close = "HVAP.Gun.128pak44.Close",
	Near = "HVAP.Gun.128pak44.Near",
	Far = "HVAP.Gun.128pak44.Far",
	Distant = "HVAP.Gun.128pak44.Distant",

	Reload = "HVAP.Reload.Cannon",
	GunReady = "HVAP.Reload.ShellDrop.Large"
}
