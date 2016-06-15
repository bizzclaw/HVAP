AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "M1919"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "M1919"
ENT.Ammo = 1000
ENT.FireRate = 600
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 4//ammount taken from heat every sec
ENT.HeatMult = 12//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 1//time it takes for unoverheat
ENT.Caliber = 7.62
ENT.Spread = 0.6144
ENT.SndPitch = 100

ENT.AmmoBelt = {--A165 Belt
	{
		"apt",
		"apt",
		"apt",
		"apt",
		
		"ap",
		"ap",

		"apt",
		"apt",
		"apt",
		"apt",	

		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",

		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",

		"ap",
		"ap",
		"ap",
		"ap",

		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",

		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",

		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",

		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",

		"ap",
		"ap",
		"ap",
		"ap",

		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",

		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",
		
		"ap",
		"ap",
		"ap",
		"ap",

		"ap",
		"ap",
		"ap",
		"ap",	
	}
}

ENT.AmmoData = {
	["ap"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=850,--velocity m/s
			Radius=32,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.3,
			Mass=102,--g
			TissueDamage = math.Rand(34,45),--
			EffectSize = 10,
			Size=7.62--caliber
		}
	},
	["apt"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(220, 220, 20),
			Speed=850,--velocity m/s
			Radius=32,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.3,
			Mass=102,--g
			TissueDamage = math.Rand(34,42),--
			EffectSize = 10,
			Size=7.62--caliber
		}
	}
}

ENT.Sounds = {
	shoot = "HVAP.Gun.M1919.Loop", -- sound played when firing
	stop = "HVAP.Gun.M1919.End", -- sound played when stop firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	clickstop = "HVAP.Gun.Jam.Click.End", -- sound plaed when near overheat
	clickshoot = "HVAP.Gun.Jam.Click.Loop", -- sound plaed when near overheat stop
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}