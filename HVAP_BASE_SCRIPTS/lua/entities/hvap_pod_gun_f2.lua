AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "F2"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "F2"
ENT.Ammo = 700
ENT.FireRate = 720
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 4//ammount taken from heat every sec
ENT.HeatMult = 8//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 1//time it takes for unoverheat
ENT.Caliber = 20
ENT.Spread = 0.256
ENT.SndPitch = 100

ENT.AmmoBelt = {
	{
		"apt",
		"apt",
		"he",
		"ap",
		"he",
		"he",
		"he",

	}
}

ENT.AmmoData = {
	["apt"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=true,
			Flak=true,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(255, 0, 0),
			Speed=1000,--velocity m/s
			Radius=32,--caliber
			Penetrate= 15,--caliber
			BallisticDrag	= 20,
			Drift=1.3,
			Mass=102,--g
			TissueDamage = math.Rand(128,160),--
			EffectSize = 10,
			Size=20--caliber
		}
	},
	["ap"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=true,
			Flak=true,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(255, 0, 0),
			Speed=1048.512,--velocity m/s
			Radius=32,--caliber
			Penetrate= 20,--caliber
			BallisticDrag	= 20,
			Drift=1.3,
			Mass=102,--g
			TissueDamage = math.Rand(128,160),--
			EffectSize = 10,
			Size=20--caliber
		}
	},
	["he"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=1249,--velocity m/s
			Radius=32,--caliber
			Penetrate= 0,--caliber
			BallisticDrag	= 20,
			Drift=1.256,
			Mass=102,--g
			TissueDamage = math.Rand(128,160),--
			EffectSize = 10,
			Size=20--caliber
		}
	},
}

ENT.Sounds = {
	shoot = "HVAP.Gun.MG151.Loop", -- sound played when firing
	stop = "HVAP.Gun.MG151.End", -- sound played when stop firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	clickstop = "HVAP.Gun.Jam.Click.End", -- sound plaed when near overheat
	clickshoot = "HVAP.Gun.Jam.Click.Loop", -- sound plaed when near overheat stop
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}
