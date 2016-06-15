AddCSLuaFile("hvap_em_150.lua")

ENT.Base = "hvap_em_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Ground Forces"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.AdminOnly = false

ENT.PrintName		= "150mm Cannon"
ENT.SpawnHeight = 16
ENT.Model = "models/hunter/tubes/circle2x2.mdl"
ENT.Weight = 10000--empty weight in kg 
ENT.FuselageHealth = 200 --idk make it non retarded, based off size and or armor
ENT.PlyDmgMult = 0.8 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 256 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 192 -- idk
ENT.thirdPerson = {
	distance = 300,
	angle = 0,
	position = Vector(-200,0,100)
}

ENT.Seats = {
	{
		pos = Vector(0, 0, 42),
		exit = Vector(120,70,0),
		weapons = {"150mm Cannon"},
		weapons2 = {"Zoom"},
	},
}

ENT.Weapons = {
	["150mm Cannon"] = {
		class = "hvap_pod_aimed_150",
		info = {
			Pods = {
				Vector(32, 0, 20),
			},
			ShootOffset = Vector(290, 0, -40),
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
	model = "models/150mmgun.mdl",
	pos = Vector(0,0,88),
	offset = Vector(-1,0,0),
	viewPos = Vector(64, 46, 17),
	maxAng = Angle(6, 360, 0),--maxdown, max left
	minAng = Angle(-14, -360, 0),--maxup, max right
	seat = 1,
	rotseat = true,
	atchseat = true
}

ENT.WeaponAttachments = {
	radar1 = {
		model = "models/150mmgun base.mdl",
		pos = Vector(0,0,0),
		restrictPitch = true
	}
}
