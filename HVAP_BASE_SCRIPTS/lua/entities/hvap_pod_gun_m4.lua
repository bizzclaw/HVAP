AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

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

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 12//ammount taken from heat every sec
ENT.HeatMult = 192//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 3//time it takes for unoverheat
ENT.Caliber = 37
ENT.Spread = 0.256
ENT.SndPitch = 100
ENT.SingleFire = true

ENT.AmmoBelt = {--A165 Belt
	{
		"het",
	}
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
			BallisticDrag	= 20,
			Drift=1.3,
			Mass=200,--g
			TissueDamage = math.Rand(66,70),--
			EffectSize = 20,
			Size=37--caliber
		}
	}
}

ENT.Sounds = {
	fire = "HVAP.Gun.M4.Fire", -- sound played when firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	clickstop = "HVAP.Gun.Jam.Click.End", -- sound plaed when near overheat
	clickshoot = "HVAP.Gun.Jam.Click.Loop", -- sound plaed when near overheat stop
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}