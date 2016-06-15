AddCSLuaFile()

ENT.Base = "hvap_pod_gun_base"
ENT.Type = "point"

ENT.PrintName = "2A42"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategoryC
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""

ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Name = "2A42"
ENT.Ammo = 550
ENT.FireRate = 550
ENT.Force = 9999999999

ENT.Belt = 1
ENT.IsAimed = false// false=(gun), true=(aimedgun)

ENT.CoolDown = 2.56//ammount taken from heat every sec
ENT.HeatMult = 16//ammount added per bullet fired  1000 threshold 39.5
ENT.HeatTime = 2//time it takes for unoverheat
ENT.Caliber = 30
ENT.Spread = 0.12
ENT.SndPitch = 160

ENT.AmmoBelt = {
	{
		"heit",
		"hei",
		"apt",
		"hei",
		"apt",	
	},
}

ENT.AmmoData = {
	["heit"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,
			Timer=12,
			col=Color(205, 215, 205),
			Speed=960,
			Radius=128,
			Penetrate= 15,
			BallisticDrag	= 20,
			Drift=1,
			Mass=388,
			TissueDamage = math.Rand(44,56),
			EffectSize = 10,
			Size=30,	
		}
	},
	["hei"] = {
		class = "hvap_bullet_he",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=false,
			Timer=12,
			col=Color(0, 0, 0),
			Speed=960,
			Radius=128,
			Penetrate= 16,
			BallisticDrag	= 20,
			Drift=1,
			Mass=390,
			TissueDamage = math.Rand(40,52),
			EffectSize = 10,
			Size=30,	
		}
	},	
	["apt"] = {
		class = "hvap_bullet_ap",
		info = {
			Large=false,
			SelfDestr=false,
			Flak=false,
			Tracer=true,
			Timer=12,
			col=Color(5, 255, 5),
			Speed=880,
			Radius=64,
			Penetrate= 30,
			BallisticDrag	= 20,
			Drift=1,
			Mass=400,
			TissueDamage = math.Rand(50,65),
			EffectSize = 10,
			Size=30,	
		}
	},	
}

ENT.Sounds = {
	shoot = "HVAP.Gun.MK103.Fire.Loop", -- sound played when firing
	stop = "HVAP.Gun.MK103.Fire.End", -- sound played when stop firing
	blank = "HVAP.Gun.Misc.BlankFire", -- sound played when stop firing but hammed 
	Jam = "HVAP.Gun.Jam.Start", -- sound to play when gun jams
	GunReady = "HVAP.Gun.Jam.Finish"
}
