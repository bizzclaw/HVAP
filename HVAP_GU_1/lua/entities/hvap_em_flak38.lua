AddCSLuaFile("hvap_em_flak38.lua")

ENT.Base = "hvap_em_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Ground Forces"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.AdminOnly = false

ENT.PrintName		= "2cm FlaK 38"
ENT.SpawnHeight = 16
ENT.Model = "models/hvap/em/flak38_hull.mdl"
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
		pos = Vector(0, -10, 16),
		exit = Vector(120,70,0),
		weapons = {"M2HB"},
		weapons2 = {"Zoom"},
	},
}

ENT.Weapons = {
	["M2HB"] = {
		class = "hvap_pod_aimed_flak38",
		info = {
			Pods = {
				Vector(0,0,34),
			},
			Sequential = false,
			ShootOffset = Vector(120, 0, 0),
			Ammo = 360
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
	model = "models/hvap/em/flak38_pipe.mdl",
	pos = Vector(0,0,0),
	offset = Vector(-1,0,0),
	viewPos = Vector(42, -15, 50),
	maxAng = Angle(10, 360, 0),--maxdown, max left
	minAng = Angle(-90, -360, 0),--maxup, max right
	seat = 1,
	rotseat = true
}

ENT.WeaponAttachments = {
	radar1 = {
		model = "models/hvap/em/flak38_tower.mdl",
		pos = Vector(0,0,0),
		restrictPitch = true
	}
}
