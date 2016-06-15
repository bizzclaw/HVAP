AddCSLuaFile("hvap_ent_crate_medium_parts.lua")

ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.PrintName = "Medium Parts Crate"
ENT.Author = hvap.author
ENT.Category = "HVAP Maintainance"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.health = 100
ENT.valid = false
ENT.disabled = false
ENT.active = true

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
	self.Entity:SetModel("models/props_junk/wood_crate001a.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Phy = self.Entity:GetPhysicsObject()
	self.Phy:SetMass(200)
	self.Phy:Wake()
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
	effectdata:SetScale(10)
	util.Effect("hvap_explode", effectdata)
	sound.Play( "HVAP.Bullet.Explode.Medium", self:GetPos() )
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
		sound.Play( "HVAP.Switch.BeepClick", self:GetPos() )	
		self:SetColor(Color(192,255,192,255))
	elseif self.active then
		self.active=false
		sound.Play( "HVAP.Switch.BoopClick", self:GetPos() )	
		self:SetColor(Color(255,192,192,255))
	end
end

function ENT:PhysicsCollide( cdat, phys )
	if cdat.Speed > 640 then
		self:Explode()
	end		
	if !self.active then return end
	
	if( cdat.DeltaTime > 0.5 && cdat.Speed > 32 ) then
		if IsValid( cdat.HitEntity ) and cdat.HitEntity.IsHVAP and cdat.HitEntity.AllowRepair then
			cdat.HitEntity:Repair(2)
			sound.Play( "HVAP.Misc.Repair.Small", self:GetPos() )	
			self:Remove()	
		end	
	end				
	
end

end