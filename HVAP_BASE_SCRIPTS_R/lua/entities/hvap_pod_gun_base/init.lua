
include "shared.lua"
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

ENT.Base = "base_anim"
ENT.Type = "anim"

ENT.Spawnable = false
ENT.AdminSpawnable = false

function ENT:Initialize()
	self:SetNextShot(0)
	self:SetLastShot(0)
	self:SetAmmo(self.Ammo)
	self:SetSecondary(0)
	self.OnRemoveEntities={}
	self.OnRemoveFunctions={}
end

function ENT:OnRemove()
	for _,f in pairs(self.OnRemoveFunctions) do
		f()
	end
	for _,e in pairs(self.OnRemoveEntities) do
		if IsValid(e) then e:Remove() end
	end
end

function ENT:getAttacker()
	if IsValid(self.seat) and IsValid(self.seat:GetDriver()) then
		return self.seat:GetDriver()
	end
	return self.aircraft
end

function ENT:trigger(b, seat)
	self.shouldShoot = b
	self.seat = seat
end

function ENT:fire()
	self.shooting = true

	if self.Overheated then return end
	
	if self.CanShoot and !self.Overheated then
		self.CurrentHeat = math.Clamp((self.CurrentHeat + self.HeatMult),0,1000)
	end
	
	if self.CurrentHeat == 1000 then
		self.Overheated = true
	return end
	
	if self.Sequential then
		self.currentPod = self.currentPod or 1
		self:fireBullet(self.Pods[self.currentPod], self:GetAngles())
		self.currentPod = (self.currentPod == #self.Pods and 1 or self.currentPod + 1)
	else for _, v in pairs(self.Pods) do
		self:fireBullet(v)
	end

	end
end

function ENT:fireBullet(pos)
	if !self.CanShoot or !self:takeAmmo(1) or !self.seat then return end
	
	local pos2=self.aircraft:LocalToWorld(pos+Vector(self.aircraft:GetVelocity():Length()*0.128,0,0))
	local ang=self.aircraft:GetAngles()+Angle(math.Rand(-self.Spread,self.Spread),math.Rand(-self.Spread,self.Spread),0)
	local bt = self.AmmoData[self.AmmoBelt[ self.bulletIndex ]]
	local filter = {}
	
	constraint.GetAllConstrainedEntities( self.aircraft, filter )
	table.Add( filter, self.aircraft.OnRemoveEntities )
	table.insert(filter, self.aircraft)
	
	b=ents.Create(bt.class)
	for k, v in pairs(bt.info) do
		b[k] = v
	end

	b:SetPos(pos2)
	b:SetAngles(ang)
	b.AircraftFiring=self.aircraft
	b.EntFilter = filter
	b.Owner = self.seat:GetDriver()
	b:Spawn()
	self:AddOnRemove(b)
	self:MuzzleEffect(pos2, self.Caliber)
	
	sound.Play( self.Sounds.fire, pos2, 145, math.Clamp(self.SndPitch-2+(10*(self.CurrentHeat/1000)^3),0,255), 1 )	
	
	self.bulletIndex = self.bulletIndex + 1
	if ( self.bulletIndex > #self.AmmoBelt ) then
		self.bulletIndex = 1
	end
end

function ENT:MuzzleEffect(pos, size)
	local heatscl = self.CurrentHeat/1000
	local effectdata = EffectData()
	effectdata:SetEntity(self)
	effectdata:SetNormal(self:GetForward())
	effectdata:SetOrigin(pos)
	effectdata:SetScale(heatscl)
	effectdata:SetRadius(size)
	util.Effect("hvap_muzzleflash", effectdata)
end

function ENT:stop()
	if self.shooting then
		self.shooting = false
	end				
end

function ENT:select(bool)
	if !bool then
		self:stop()
	end
end

function ENT:takeAmmo(amount)
	if self:GetAmmo() < amount then return false end
	self:SetAmmo(self:GetAmmo() - amount)
	return true
end

function ENT:Think()

	self:SetSecondary(self.CurrentHeat)

	local crt = CurTime()
	
	if !self.Overheated and !self.shooting then
		self.CurrentHeat = math.Clamp( self.CurrentHeat - self.CoolDown, 0, 1000 )
	elseif self.Overheated then
		if !self.shooting then
			self.CurrentHeat = math.Clamp( self.CurrentHeat - ((1000/self.HeatTime)/66), 0, 1000 )
		else
			self.CurrentHeat = math.Clamp( self.CurrentHeat - ((250/self.HeatTime)/66), 0, 1000 )
		end
		if self.CurrentHeat == 0 then
			self.Overheated = false 
			self.CanShoot = true
		end
	end

	if IsValid(self.seat) and self.shouldShoot and self:GetNextShot() <= crt and self:GetAmmo() > 0 then
		if !IsValid(self.seat:GetDriver()) then
			self.shouldShoot = false
		else
			self:fire()
			self:SetLastShot(crt)
			self:SetNextShot(self:GetLastShot() + 60/self.FireRate)
		end
	end
	
	if self:GetNextShot() <= crt and self:GetNextShot() != 0 then		
		self:stop()		
	end
	self:SetNWBool("overheatend", self.CanShoot)
	self:SetNWBool("shooting", self.shooting)
	self:SetNWBool("overheated", self.Overheated)
	self:NextThink(crt)
	return true
end
