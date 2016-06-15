AddCSLuaFile("hvap_em_flak18.lua")

ENT.Base = "hvap_em_base"
ENT.Type = "anim"
ENT.Author = "The_HAVOK"
ENT.Category = "HVAP Ground Forces"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.AdminOnly = false

ENT.PrintName		= "88mm Flak 18"
ENT.SpawnHeight = 16
ENT.Model = "models/jessev92/ww2_dods/flak18_base.mdl"
ENT.Weight = 10000--empty weight in kg 
ENT.FuselageHealth = 200 --idk make it non retarded, based off size and or armor
ENT.PlyDmgMult = 1 -- damage multiplier for pilot snipe
ENT.PlyDmgDist = 256 -- max dist damage impact from pilot pos to damage pilot(closer to 0 dmg pos is means more damage)
ENT.MaxEnterDistance = 192 -- idk
ENT.thirdPerson = {
	distance = 320,
	angle = 0,
	position = Vector(0,0,192)
}

ENT.Seats = {
	{
		pos = Vector(120, -38, 44),
		exit = Vector(120,70,0),
		weapons = {"Flak 18"},
		weapons2 = {"Zoom"}
	},
}

ENT.Weapons = {
	["Flak 18"] = {
		class = "hvap_pod_aimed_flak18",
		info = {
			Pods = {
				Vector(32, 0, 0),
			},
			ShootOffset = Vector(256, 0, 0),
			Ammo = 100,
			FireRate = 8
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

ENT.CounterMeasures = {
	["Flares"] = {
		class = "hvap_pod_cm_smoke",
		info = {
			Pods = {
				Vector(-34,34,58),
				Vector(-34,-34,58),
			},
			Angles = {
				Angle(15,-90,0),
				Angle(15,90,0),
			},
		}
	}
}

ENT.Camera = {
	model = "models/jessev92/ww2_dods/flak18_pipe.mdl",
	pos = Vector(0,0,90),
	offset = Vector(-1,0,0),
	viewPos = Vector(300, 0, -38),
	maxAng = Angle(3, 360, 0),--maxdown, max left
	minAng = Angle(-86, -360, 0),--maxup, max right
	seat = 1,
	rotseat = true,
	atchseat = true
}

ENT.WeaponAttachments = {

	radar1 = {
		model = "models/jessev92/ww2_dods/flak18_tower.mdl",
		pos = Vector(5,0,0),
		restrictPitch = true
	},

}
