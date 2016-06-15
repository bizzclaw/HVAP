AddCSLuaFile("hvap_pod_aimed_122a19.lua")

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

ENT.ReloadTime = 18//time it takes for unoverheat
ENT.Caliber = 122
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
			Radius=math.Rand(1120,1320),
			Penetrate= 2,
			BallisticDrag	= 24,
			Drift=1,
			Mass=388,
			TissueDamage = math.Rand(5120,6400),
			EffectSize = 10,
			Size=122,
			TracerBurnout = 16
		}
	}	
}

ENT.Sounds = {
	Fire = "HVAP.Gun.122d25t.Fire",
	Close = "HVAP.Gun.122d25t.Close",
	Near = "HVAP.Gun.122d25t.Near",
	Far = "HVAP.Gun.122d25t.Far",
	Distant = "HVAP.Gun.122d25t.Distant",

	Reload = "HVAP.Reload.Cannon",
	GunReady = "HVAP.Reload.ShellDrop.Large"
}
