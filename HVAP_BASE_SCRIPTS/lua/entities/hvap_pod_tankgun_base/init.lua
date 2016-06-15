
include ("shared.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

ENT.Base 				= "base_entity"
ENT.Type 				= "point"

ENT.Spawnable = false
ENT.AdminSpawnable = false

function ENT:Initialize()
	self:SetNextShot(0)
	self:SetLastShot(0)
	self:SetAmmo(self.Ammo)
	self:SetSecondary(0)
	self.OnRemoveEntities={}
	self.OnRemoveFunctions={}
	self:addSounds()
	
	self.entFilter = {}
	table.Add( self.entFilter, self.aircraft.OnRemoveEntities )
	table.insert(self.entFilter, self.aircraft)
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

	local pos2 = self.aircraft.camera:LocalToWorld(pos)+ self.aircraft:getCameraAngles():Forward()*self.ShootOffset.x 
	local ang = self.aircraft:getCameraAngles()+Angle(math.Rand(-self.Spread,self.Spread),math.Rand(-self.Spread,self.Spread),0)
	local bt = self.AmmoData[self.AmmoBelt[ self.bulletIndex ]]
	
	b=ents.Create(bt.class)
	for k, v in pairs(bt.info) do
		b[k] = v
	end

	b:SetPos(pos2)
	b:SetAngles(ang)
	b.AircraftFiring=self.aircraft
	b.EntFilter = self.entFilter
	b.Owner = self.seat:GetDriver()
	b:Spawn()
	self:AddOnRemove(b)
	self:MuzzleEffect(pos2, self.Caliber, ang)
	
	self.bulletIndex = self.bulletIndex + 1
	if ( self.bulletIndex > #self.AmmoBelt ) then
		self.bulletIndex = 1
	end

	self.Overheated = true
	self.CurrentHeat = 1000
	self.fired = true	
end

function ENT:MuzzleEffect(pos, size, ang)
	local effectdata = EffectData()
	effectdata:SetEntity(self)
	effectdata:SetNormal(ang:Forward())
	effectdata:SetOrigin(pos)
	effectdata:SetScale(1)
	effectdata:SetRadius(size)
	util.Effect("hvap_muzzleflash_t", effectdata)
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
	
	if self.Overheated then
		self.CurrentHeat = math.Clamp( self.CurrentHeat - ((1000/self.ReloadTime)/66), 0, 1000 )
		if !self.Reloading then
			self.Reloading = true
			sound.Play(self.Sounds.Reload, self:GetPos(), 1, 1, 75)	
		end
		if self.CurrentHeat == 0 then
			self.Overheated = false 
			self.CanShoot = true
			self.Reloading = false
			self.fired = false
			sound.Play(self.Sounds.GunReady, self:GetPos(), 1, 1, 75)	
		end
	end

	if IsValid(self.seat) and self.shouldShoot and self:GetNextShot() <= crt and self:GetAmmo() > 0 and !self.Reloading then
		if !IsValid(self.seat:GetDriver()) then
			self.shouldShoot = false
		else
			self:fire()
			self:SetLastShot(crt)
			self:SetNextShot(1)
		end
	end
	if self:GetNextShot() <= crt and self:GetNextShot() != 0 then		
		self:stop()		
	end
	self:SetNWBool("reloading", self.Reloading)
	self:SetNWBool("fired", self.fired)
	self:NextThink(crt)
	return true
end
