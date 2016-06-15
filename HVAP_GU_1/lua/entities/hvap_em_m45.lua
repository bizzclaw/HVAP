AddCSLuaFile("hvap_em_m45.lua")

ENT.Base = "hvap_em_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Ground Forces"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.AdminOnly = false

ENT.PrintName		= "M45 Quadmount"
ENT.SpawnHeight = 16
ENT.Model = "models/jessev92/ww2_dods/flak18_base.mdl"
ENT.Weight = 10000--empty weight in kg 
ENT.FuselageHealth = 200 --idk make it non retarded, based off size and or armor
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 256 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 192 -- idk
ENT.thirdPerson = {
	distance = 200,
	angle = 0,
	position = Vector(0,0,100)
}

ENT.Seats = {
	{
		pos = Vector(0, 0, 42),
		exit = Vector(120,70,0),
		weapons = {"M2HB"},
		weapons2 = {"Zoom"},
	},
}

ENT.Weapons = {
	["M2HB"] = {
		class = "hvap_pod_gun_m2hb",
		info = {
			Pods = {
				Vector(4, 27, 7),
				Vector(4, -27, 7),
				Vector(-13.5, 31, -1.5),
				Vector(-13.5, -31, -1.5)
			},
			IsAimed = true,
			Sequential = false,
			ShootOffset = Vector(64, 0, 0),
			Belt = 4,
			Ammo = 4000,
			FireRate = 450,
			CoolDown = 0,//ammount taken from heat every sec
			HeatMult = 1.25,//ammount added per bullet fired  1000 threshold
			HeatTime = 16,//time it takes for unoverheat
			Spread = 0.32,
			SndPitch = 99
		}
	},
}

ENT.Weapons2 = {
	["Zoom"] = {
		class = "hvap_pod_zoom",
		info = {
			ShootPos = Vector(0, 0, 0),
			ShootOffset = Vector(0, 0, 0)
		}
	}
}

ENT.Camera = {
	model = "models/jessev92/ww2_dods/m45_turret.mdl",
	pos = Vector(0,0,60),
	offset = Vector(-1,0,0),
	viewPos = Vector(100, 0, 3.5),
	maxAng = Angle(10, 360, 0),--maxdown, max left
	minAng = Angle(-90, -360, 0),--maxup, max right
	seat = 1,
	rotseat = true
}

ENT.WeaponAttachments = {
	radar1 = {
		model = "models/jessev92/ww2_dods/m45_tower.mdl",
		pos = Vector(0,0,0),
		restrictPitch = true
	}
}
