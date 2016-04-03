
AddCSLuaFile("hvap_pod_rkt_hydra.lua")

ENT.Base = "hvap_pod_base"
ENT.Type = "anim"

ENT.PrintName = "Hydra 40"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategory
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Ammo = 14
ENT.FireRate = 400--1000
ENT.Sequential = true
ENT.RearmTime = 6

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Ammo")
	self:NetworkVar("Int", 1, "Secondary")
	self:NetworkVar("Float", 0, "LastShot")
	self:NetworkVar("Float", 1, "NextShot")
end

function ENT:Initialize()
	self:base("hvap_pod_base").Initialize(self)
end

function ENT:fireRocket(pos)
	if !self:takeAmmo(1) then return end
	
	local pos2=self.aircraft:LocalToWorld(pos+Vector(self.aircraft:GetVelocity():Length()*0.6,0,0))
	local ang=self.aircraft:GetAngles()+Angle(math.Rand(-.1,.1),math.Rand(-.1,.1),0)	
	
	local b = ents.Create("hvap_bullet_rocket")
	b:SetPos(pos2)
	b:SetAngles(ang)
	b.col=Color(220,170,170)
	b.Speed=300
	b.Radius=math.Rand(192,256)
	b.EffectSize = 16
	b.Penetrate= 1
	b.BallisticDrag	= 256
	b.Drift= 1.6
	b.TissueDamage	= math.Rand(160,200)
	b.Mdl="models/missiles/ffar_40mm.mdl"
	b:SetPos(pos2)
	b:SetAngles(ang)
	b.Size=20
	b.AircraftFiring=self.aircraft
	b.Owner = self.seat:GetDriver()
	b:Spawn()
	
	self:MuzzleEffect(pos2, 16)
	self.Entity:EmitSound( "hvap/rocket/hydra_start_"..math.random(1,4)..".wav" )
	constraint.NoCollide(self.aircraft, b, 0, 0)
end

function ENT:MuzzleEffect(pos, size)
	local effectdata = EffectData()
	effectdata:SetEntity(self)
	effectdata:SetNormal(self:GetForward())
	effectdata:SetOrigin(pos)
	effectdata:SetScale(1)
	effectdata:SetRadius(30)
	util.Effect("hvap_muzzleflash", effectdata)
end

function ENT:fire()
	if self.Sequential then
		self.currentPod = self.currentPod or 1
		self:fireRocket(self.Pods[self.currentPod], self:GetAngles())
		self.currentPod = (self.currentPod == #self.Pods and 1 or self.currentPod + 1)
	else
		for _, pos in pairs(self.Pods) do
			self:fireRocket(pos, self:GetAngles())
		end
	end
end

function ENT:stop()
end

function ENT:Think()

	self:SetSecondary(1000)
		
	if IsValid(self.seat) and self:canFire() and self.shouldShoot and self:GetNextShot() <= CurTime() and self:GetAmmo() > 0 then
		if !IsValid(self.seat:GetDriver()) then
			self.shouldShoot = false
		else
			self:fire()
			self:SetLastShot(CurTime())
			self:SetNextShot(self:GetLastShot() + 60/self.FireRate)		
		end
	end

	if self:GetNextShot() <= CurTime() then
		self:stop()
	end
	self:NextThink(CurTime())
	return true
end
