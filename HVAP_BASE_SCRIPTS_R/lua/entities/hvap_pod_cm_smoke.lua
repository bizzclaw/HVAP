
AddCSLuaFile("hvap_pod_cm_smoke.lua")

ENT.Base = "hvap_pod_base"
ENT.Type = "anim"

ENT.PrintName = "Flares"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategory
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Ammo = 50
ENT.FireRate = 120--1000
ENT.RearmTime = 6
ENT.Cooldown = 8
ENT.Launched = 0
ENT.Shooting = false
ENT.Fired = true
ENT.CanShoot = false
ENT.shouldShoot = false

if SERVER then

function ENT:Initialize()
	self:base("hvap_pod_base").Initialize(self)
end

function ENT:fireSmoke(pos, ang)
	if !self:takeAmmo(1) then return end
	if not self.seat then return end
	
	local pos2 = self.aircraft:LocalToWorld(pos+Vector(self.aircraft:GetVelocity():Length()*0.2,0,0))
	local ang2 = self.aircraft:GetAngles()+Angle(math.Rand(-.1,.1),math.Rand(-.1,.1),0)-ang
	
	self.Launched=self.Launched+1
	
	local b = ents.Create("hvap_bullet_cm_smoke")
	b.Speed=math.Rand(1,2)--velocity m/s
	b.BallisticDrag	= math.Rand(1,2)
	b.Drift=0.2
	b:SetPos(pos2+self.aircraft:GetVelocity()/2)
	b:SetAngles(ang2)
	b.Size=1
	b.Width=1
	b:Spawn()
	self:AddOnRemove(b)
	local effectdata=EffectData()
	effectdata:SetOrigin(self:LocalToWorld(pos))
	effectdata:SetAngles(ang2)
	effectdata:SetScale(8)
	util.Effect("MuzzleEffect", effectdata)
	constraint.NoCollide(self.aircraft, b, 0, 0)
	self.Entity:EmitSound( "hvap/gun/misc/smoke_launch_2.wav" )
end

function ENT:trigger(b, seat)
	self.shouldShoot = b
	self.seat = seat
end

function ENT:Think()

	if self.Fired then
		self:Pause()
	end
	
	if self.shouldShoot and self.CanShoot and self:GetAmmo() > 0 and !self.Shooting then
		self.Shooting=true
	elseif self.Launched >= 5 then
		self.Shooting = false
		self.Launched = 0
		self.Fired = true
	end

	if self.shouldShoot and self:GetNextShot() <= CurTime() and !self.CanShoot or self:GetAmmo() == 0 then
		self.Entity:EmitSound( "hvap/gun/misc/no_ammo.wav" )
	end
	
	if IsValid(self.seat) and self:canFire() and self:GetNextShot() <= CurTime() and self:GetAmmo() > 0 and self.Shooting then
		self:fire()
		self:SetLastShot(CurTime())
		self:SetNextShot(self:GetLastShot() + 60/self.FireRate)	
	end
		
	if self:GetNextShot() <= CurTime() and self:GetNextShot() != 0 then		
		self:stop()		
	end
	self:NextThink(CurTime())
	return true
end

function ENT:fire()	
	self.currentPod = self.currentPod or 1
	self:fireSmoke(self.Pods[self.currentPod], self.Angles[self.currentPod])
	self.currentPod = (self.currentPod == #self.Pods and 1 or self.currentPod + 1)	
end

function ENT:stop()
end

function ENT:Pause()
	self:SetNextShot(0)
	self:SetLastShot(0)
	self.Fired = false 
	self.CanShoot = false
	self.shouldShoot = false
	self.Shooting = false
	timer.Simple( self.Cooldown, function()
		if self:IsValid() then 
			self:SetNextShot(0)
			self:SetLastShot(0)
			self.Fired = false 
			self.CanShoot = true
			self.Entity:EmitSound( "hvap/gun/misc/flare_ready.wav" )
		end
	end )
end

end