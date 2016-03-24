AddCSLuaFile("hvap_bullet_rocket2.lua")

ENT.Type = "anim"
ENT.Base = "base_gmodentity" 
ENT.PrintName = ""
ENT.Author = hvap.author
ENT.Category = hvap.menu.category
ENT.IsWire = true

ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.WireDebugName = "asdf"

if CLIENT then

function ENT:Draw()            
	self.Entity:DrawModel()
end
 
function ENT:Initialize()
	pos = self:GetPos()
	self.emitter = ParticleEmitter( pos )
end
 
function ENT:Think()
	pos = self:GetPos()
	local particle = self.emitter:Add( "particle/smokesprites_000"..math.random(1,9), pos + (self:GetForward() * -100))
	if (particle) then
		particle:SetVelocity((self:GetForward() ) )
		particle:SetDieTime( math.Rand( 2, 3 ) )
		particle:SetStartAlpha( math.Rand( 64, 80 ) )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( 42 )
		particle:SetEndSize( 64 )
		particle:SetRoll( math.Rand(0, 360) )
		particle:SetRollDelta( math.Rand(-1, 1) )
		particle:SetColor( 140 , 135 , 125 ) 
		particle:SetAirResistance( 200 ) 
	end		
end

elseif SERVER then

function ENT:Initialize()   
	math.randomseed(CurTime())
	self.Entity:SetModel("models/missiles/agm_114.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.sound = CreateSound(self.Entity, "hvap/rocket/rocket_fly_loop.wav")
	self.Entity:DrawShadow(false)
	self.phys = self.Entity:GetPhysicsObject()
	if (self.phys:IsValid()) then
		self.phys:SetMass(1024)
		self.phys:EnableGravity(false)
		self.phys:EnableCollisions(true)
		self.phys:EnableDrag(false)
		self.phys:Wake()
	end
	Glow = ents.Create("env_sprite")				// The ball of the tracer
	Glow:SetKeyValue("model","orangecore2.vmt")
	Glow:SetKeyValue("rendercolor","255 150 100")
	Glow:SetKeyValue("scale","0.7")
	Glow:SetPos(self.Entity:GetPos())
	Glow:SetParent(self.Entity)
	Glow:Spawn()
	Glow:Activate()

	Shine = ents.Create("env_sprite")
	Shine:SetPos(self.Entity:GetPos())
	Shine:SetKeyValue("renderfx", "0")
	Shine:SetKeyValue("rendermode", "5")
	Shine:SetKeyValue("renderamt", "255")
	Shine:SetKeyValue("rendercolor", "255 130 100")
	Shine:SetKeyValue("framerate12", "20")
	Shine:SetKeyValue("model", "light_glow03.spr")
	Shine:SetKeyValue("scale", ".7")
	Shine:SetKeyValue("GlowProxySize", "13")
	Shine:SetParent(self.Entity)
	Shine:Spawn()
	Shine:Activate()

	self.CM = {}
	self.matType = MAT_METAL
	self.hitAngle = Angle(270, 0, 0)
	self.Target = nil
	self.Lost = false	

end    

function ENT:StartRocket()
	if self.Started then return end	
	self.Owner = self.Owner or self.Entity
	self.Fuel=self.Fuel or 1000
	self.Started = true
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local ed=EffectData()
	ed:SetOrigin(pos)
	ed:SetScale(1)
	ed:SetRadius(self.TrailLength)
	ed:SetMagnitude(self.SmokeDens)
	ed:SetEntity(self.Entity)
	util.Effect("hvap_rocket_trail", ed)
	local light = ents.Create("env_sprite")
	light:SetPos(self.Entity:GetPos())
	light:SetKeyValue("renderfx", "0")
	light:SetKeyValue("rendermode", "5")
	light:SetKeyValue("renderamt", "255")
	light:SetKeyValue("rendercolor", "250 200 100")
	light:SetKeyValue("framerate12", "20")
	light:SetKeyValue("model", "light_glow03.spr")
	light:SetKeyValue("scale", "0.4")
	light:SetKeyValue("GlowProxySize", "50")
	light:Spawn()
	light:SetParent(self.Entity)
	self.sound:Play()
	self.OldPos=self:GetPos()
	self.phys:EnableCollisions(false)
end

function ENT:GetFuelMul()
	self.MaxFuel=self.MaxFuel or self.Fuel or 0
	if self.Fuel then
		return math.Clamp(self.Fuel/self.MaxFuel*5,0,1)
	end
	return 1
end

function ENT:PhysicsUpdate(ph)

	if !self.Started or self.HasNoFuel then return end
	local trd = {
		start = self.OldPos,
		endpos = self:GetPos(),
		filter = {self,self.Owner,self.Launcher},
		mask = CONTENTS_SOLID + CONTENTS_MOVEABLE + CONTENTS_OPAQUE + CONTENTS_DEBRIS + CONTENTS_HITBOX + CONTENTS_MONSTER + CONTENTS_WINDOW + CONTENTS_WATER,
	}
	local tr = util.TraceLine(trd)
	if tr.Hit and !self.Exploded then
		if tr.HitSky then self:Remove() return end
		util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		self.matType = tr.MatType
		self.hitAngle = tr.HitNormal:Angle()
		self:Explode()
		return
	end
	self.OldPos = trd.endpos
	local vel = self:WorldToLocal(self:GetPos()+self:GetVelocity())*0.4
	vel.x = 0
	local m = self:GetFuelMul()
	ph:AddVelocity(self:GetForward()*m*self.Speed-self:LocalToWorld(vel*Vector(0.1, 1, 1))+self:GetPos())
	ph:AddAngleVelocity(
		ph:GetAngleVelocity()*-0.4
		+ Vector(math.Rand(-1,1), math.Rand(-1,1), math.Rand(-1,1))*5
		+ Vector(0, -vel.z, vel.y)
	)
	local cm = NULL
	for k, v in pairs( self.CM ) do
		if v:IsValid() and v:GetPos():Distance(self:calcTarget()) <= 2560 then
			if v:GetClass() == "hvap_bullet_cm_smoke" or v:GetClass() == "hvap_bullet_cm_flare" then
				self.Lost = true
				self.LostT = v:GetPos()+VectorRand()*1000
			else
				cm = v
			end

		end
	end
	if self.calcTarget then
		local target = self:calcTarget()
		
		if !self.Lost then
			if !cm:IsValid() then
				self.Target = target
			else
				self.Target = cm:GetPos()
			end
		else
			self.Target = self.LostT
		end
		
		local t = self:WorldToLocal(self.Target + Vector(
			0, 0, math.Clamp((self:GetPos()*Vector(1,1,0)):Distance(self.Target*Vector(1,1,0))/5 - 50, 0, 1000)
		)):GetNormal()
		t.y = math.Clamp(t.y*10,-0.5,0.5)*300
		t.z = math.Clamp(t.z*10,-0.5,0.5)*300
		self:TakeFuel(math.abs(t.y) + math.abs(t.z))
		ph:AddAngleVelocity(Vector(0,-t.z,t.y))
	end
	self:TakeFuel(self.Speed)
end

function ENT:Think()
	if self.StartTime and self.StartTime < CurTime() and !self.Started then
		self:StartRocket()
	end
	self.CM = ents.FindByClass( "hvap_bullet_cm_*" )

	if self.Target:Distance(self:GetPos()) < 409.6 then
		self:Explode()
	end
	
end

function ENT:TakeFuel(amt)
	self.Fuel = self.Fuel-amt/10*FrameTime()
	if self.Fuel < 0 then
		self:Remove()
	end
end

function ENT:OnTakeDamage(dmginfo)
	self:Explode()
end

function ENT:Explode()
	if self.Exploded then return end
	self.Exploded = true
	local ed = EffectData()
	ed:SetEntity(self.Entity)
	ed:SetOrigin(self:GetPos())
	ed:SetScale(10)
	ed:SetNormal(self.Target)
	ed:SetRadius(self.matType or MAT_METAL)
	ed:SetAngles(self.hitAngle)
	util.Effect("hvap_rocket_explode",ed)
	util.BlastDamage(self, self.Owner or self, self:GetPos(), self.Radius*3, self.Damage*1.28)
	local explode = ents.Create("env_physexplosion")
	explode:SetPos(self:GetPos())
	explode:Spawn()
	explode:SetKeyValue("magnitude", self.Damage)
	explode:SetKeyValue("radius", self.Radius*0.75)
	explode:SetKeyValue("spawnflags","19")
	explode:Fire("Explode", 0, 0)
	self.Entity:Remove()
end

function ENT:OnRemove()
	self.sound:Stop()
end

end