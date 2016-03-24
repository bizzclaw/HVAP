AddCSLuaFile("hvap_ent_crate_fuel.lua")

ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.PrintName = "Fuel Barrel"
ENT.Author = hvap.author
ENT.Category = hvap.menu.category
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.health = 100
ENT.valid = false
ENT.disabled = false
ENT.active = false

if SERVER then

function ENT:SpawnFunction( ply, tr)
	if (!tr.Hit) then return end	
	local ent=ents.Create(ClassName)
	local ang = ply:EyeAngles()	
	
	ent:SetPos(tr.HitPos+tr.HitNormal*20)
	ent:SetAngles(Angle(tr.HitPos:GetNormal().x,(ply:EyeAngles().y+180),tr.HitPos:GetNormal().z))

	ent:Spawn()
	ent:Activate()
	ent.Owner=ply
	return ent
end

function ENT:Initialize()
	self.Entity:SetModel("models/props_c17/oildrum001.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Phy = self.Entity:GetPhysicsObject()
	self.Phy:SetMass(200)
	self.Basehealth = self.health
	self.valid = true
end

function ENT:Think()
	if !self.valid or self.disabled then return end
	
	if self.health == 0 then
		self:Explode()
		self.disabled = true
	end
	
	self:NextThink(CurTime())	
	
end

function ENT:Explode()
	local effectdata = EffectData()
	effectdata:SetOrigin(self.Entity:GetPos())
	effectdata:SetScale(14)
	util.Effect("hvap_explode", effectdata)
	self.Entity:EmitSound( "hvap/bullet/impact/explode_medium_"..math.random(1,6)..".wav", 110, math.random(90,110) )
	self.Entity:EmitSound( "hvap/bullet/shell_explosion_"..math.random(1,3)..".wav", 180, math.random(90,110) )
	util.BlastDamage(self.Entity, self.Entity, self.Entity:GetPos(), 250, 300)
	self:Remove()
end

function ENT:OnTakeDamage( dmg )
	if !self.disabled then	
		self.health = math.Clamp(self.health - dmg:GetDamage()*0.8, 0, self.Basehealth)
	end
end

function ENT:Use( act, cal)
	if act.hvap and act.hvap.lastEnter and act.hvap.lastEnter+1 > CurTime() then return end
	self:SetActive(!self.active)
	act.hvap = act.hvap or {}
	act.hvap.lastEnter = CurTime()
end

function ENT:SetActive(b)
	if self.disabled then b = false end
	if b then
		if self.active then return end
		self.active = true
		self:EmitSound( "hvap/gun/misc/weapon_switch1.wav" )	
		self:SetColor(Color(192,255,192,255))
	elseif self.active then
		self.active=false
		self:EmitSound( "hvap/gun/misc/weapon_switch2.wav" )	
		self:SetColor(Color(255,192,192,255))
	end
end

function ENT:PhysicsCollide( cdat, phys )
	if !self.active then return end
	
	if( cdat.DeltaTime > 0.5 && cdat.Speed > 100 ) then
		if IsValid( cdat.HitEntity ) and cdat.HitEntity.IsHVAP and cdat.HitEntity.AllowFuel then
				cdat.HitEntity:Refuel(1000)
				self:Remove()	
		end				
	end				
	
end

end