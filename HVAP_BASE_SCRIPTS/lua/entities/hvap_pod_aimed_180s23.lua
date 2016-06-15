AddCSLuaFile("hvap_pod_aimed_180s23.lua")

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

ENT.ReloadTime = 50//time it takes for unoverheat
ENT.Caliber = 180
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
			col=Color(200, 180, 54),
			Speed=850,
			Radius=math.Rand(1700,1900),
			Penetrate= 2,
			BallisticDrag	= 20,
			Drift=1,
			Mass=388,
			TissueDamage = math.Rand(5120,6400),
			EffectSize = 10,
			Size=180,
			TracerBurnout = 16
		}
	}	
}

ENT.Sounds = {
	Fire = "HVAP.Gun.152m10.Fire",
	Close = "HVAP.Gun.152m10.Close",
	Near = "HVAP.Gun.152m10.Near",
	Far = "HVAP.Gun.152m10.Far",
	Distant = "HVAP.Gun.152m10.Distant",

	Reload = "HVAP.Reload.Cannon",
	GunReady = "HVAP.Reload.ShellDrop.Large"
}