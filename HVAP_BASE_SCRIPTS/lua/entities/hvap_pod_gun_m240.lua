AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "M240"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "m240"
ENT.Ammo = 750
ENT.FireRate = 950
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 9//ammount taken from heat every sec
ENT.HeatMult = 16//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 4//time it takes for unoverheat
ENT.Caliber = 7.62
ENT.Spread = 0.20
ENT.SndPitch = 90

ENT.AmmoBelt = {--A165 Belt
	{
		"apit",
		"ball",
		"ball",
		"ball",
		"ball",
		"ball",
		"ball",
	}
}

ENT.AmmoData = {
	["apit"] = {
		class = "hvap_bullet_api",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(255, 0, 0),
			Speed=853,--velocity m/s
			Radius=7.62,--caliber
			Penetrate= 7.62,--caliber
			BallisticDrag	= 20,
			Drift=1.28,
			Mass=9.5,--g
			TissueDamage = math.Rand(19.431,38.862),
			EffectSize=5,
			Size=7.62--caliber	
		}
	},
	["ball"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,--tracer?
			Timer=12,-- time to remove bullet or to explode if SelfDestr
			col=Color(0, 0, 0),
			Speed=853,--velocity m/s
			Radius=7.62,--caliber
			Penetrate= 10,--caliber
			BallisticDrag = 21,
			Drift=1.32,
			Mass=9.5,--g
			TissueDamage = math.Rand(19.431,38.862),
			EffectSize=5,
			Size=7.62--caliber	
		}
	},	
}

ENT.Sounds = {
	start = "HVAP.Gun.M134.Start.Close", -- sound played when firing
	loop = "HVAP.Gun.M134.Loop.Close", -- sound played when firing
	stop = "HVAP.Gun.M134.End.Close", -- sound played when stop firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	clickstop = "HVAP.Gun.Jam.Click.End", -- sound plaed when near overheat
	clickshoot = "HVAP.Gun.Jam.Click.Loop", -- sound plaed when near overheat stop
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}
