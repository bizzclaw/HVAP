AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "M129"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "M129"
ENT.Ammo = 300
ENT.FireRate = 400
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 4//ammount taken from heat every sec
ENT.HeatMult = 15//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 1//time it takes for unoverheat
ENT.Caliber = 12.5
ENT.Spread = 0.6144
ENT.SndPitch = 100
ENT.SingleFire = true

ENT.AmmoBelt = {--A165 Belt
	{
		"he"
	}
}

ENT.AmmoData = {
	["he"] = {
		class = "hvap_bullet_he",
		info = {
			Large=true,
			SelfDestr=false,
			Flak=false,
			Tracer=true,--tracer?
			Timer=30,-- time to remove bullet or to explode if SelfDestr
			col=Color(200, 200, 200),
			Speed=260,--velocity m/s
			Radius=200,--caliber
			Penetrate= 0.1,--caliber
			BallisticDrag	= 50,
			Drift=1.29,
			Mass=320,--g
			TissueDamage = math.Rand(340,450),--
			EffectSize = 32,
			Size=40--caliber
		}
	}
}


ENT.Sounds = {
	shoot = "HVAP.Gun.M2.Loop", -- sound played when firing
	stop = "HVAP.Gun.M2.End", -- sound played when stop firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	clickstop = "HVAP.Gun.Jam.Click.End", -- sound plaed when near overheat
	clickshoot = "HVAP.Gun.Jam.Click.Loop", -- sound plaed when near overheat stop
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}
