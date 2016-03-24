
AddCSLuaFile("hvap_pod_hellfire.lua")

ENT.Base = "hvap_pod_base"
ENT.Type = "anim"

ENT.PrintName = "Hellfire"
ENT.Author = "The_HAVOK"
ENT.Category = hvap.aircraft.spawnCategory
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Ammo = 16
ENT.FireRate = 100
ENT.Sequential = true
ENT.MaxRange = 32000
ENT.CurrentHeat = 0
ENT.CanShoot = true

ENT.CoolDown = 0//ammount taken from heat every sec
ENT.HeatMult = 500//ammount added per bullet fired  1000 threshold
ENT.HeatTime = 4.95//time it takes for unoverheat

function ENT:Initialize()
	self:base("hvap_pod_base").Initialize(self)
	self.baseThink = self:base("hvap_pod_base").Think
end


function ENT:SetupDataTables()
	self:base("hvap_pod_base").SetupDataTables(self)
	self:NetworkVar("Entity", 0, "Target")
	self:NetworkVar("Vector", 0, "TargetOffset")
	self:NetworkVar("Int", 1, "Secondary")
end


function ENT:canFire()
	return IsValid(self:GetTarget())
end


function ENT:fireRocket(pos, ang)
	if self.CanShoot == false then
	return end
	if !self:takeAmmo(1) then return end
	if not self.seat then return end	
	
	local rocket = ents.Create("hvap_bullet_rocket2")
	rocket:SetPos(self:LocalToWorld(pos+Vector(self.aircraft:GetVelocity():Length()*0.128,0,0)))
	rocket:SetAngles(ang)
	rocket.Owner = self:getAttacker()
	rocket.Damage = 100
	rocket.Radius=math.Rand(192,256)
	rocket.Speed = 56
	rocket.Drag = Vector(0,1,1)
	rocket.TrailLength = 250
	rocket.Scale = 1
	rocket.SmokeDens = 1
	rocket.Launcher = self.aircraft
	rocket.target = self:GetTarget()
	rocket.targetOffset = self:GetTargetOffset()
	rocket.calcTarget = function(r)
		if !IsValid(r.target) then
			return r:GetPos() + r:GetForward()*100
		else
			return r.target:LocalToWorld(r.targetOffset)
		end
	end
	rocket:Spawn()
	rocket:Activate()
	rocket:StartRocket()
	local ph = rocket:GetPhysicsObject()
	if ph:IsValid() then
		ph:SetVelocity(self:GetVelocity())
		ph:AddAngleVelocity(Vector(30,0,0))
	end
	self.Entity:EmitSound( "hvap/rocket/atgm_start_"..math.random(1,4)..".wav" )
	constraint.NoCollide(self.aircraft, rocket, 0, 0)
end

function ENT:Overheat()
	self.Overheated = true
	self.CanShoot = false
	self.Entity:EmitSound( "hvap/gun/misc/hydra_reload.wav" )
	timer.Simple( self.HeatTime, function()
		if self:IsValid() then
			self:SetNextShot(0)
			self:SetLastShot(0)
			self.Overheated = false 
			self.CanShoot = true
		end
	end )
	return true
end

function ENT:Think()	
	if SERVER then
		self:SetSecondary(self.CurrentHeat)
		local ang = self.aircraft:getCameraAngles()
		if ang then
			local pos = self.aircraft:LocalToWorld(self.aircraft.Camera.pos)
			local dir = ang:Forward()
			local tr = util.QuickTrace(pos+dir*160, dir*self.MaxRange, {self.aircraft.entities})
			if tr.Hit and !tr.HitWorld then
				self:SetTarget(tr.Entity)
				self:SetTargetOffset(tr.Entity:WorldToLocal(tr.HitPos))
			else
				self:SetTarget(nil)
			end
		end
	end	
	if !self.Overheated then
		if !self.shooting == true then
		self.CurrentHeat = math.Clamp( self.CurrentHeat - self.CoolDown, 0, 1000 )
		end
	else
		self.CurrentHeat = math.Clamp( self.CurrentHeat - ((1000/self.HeatTime)/66), 0, 1000 )
	end		
			
		return self:baseThink()
		
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
	
	if !self.Overheated then
	self.CurrentHeat = math.Clamp((self.CurrentHeat + self.HeatMult),0,1000)
	else end	
	
	if self.CurrentHeat == 1000 then
		self:Overheat()
		self:SetNextShot(self:GetLastShot() + 60/self.FireRate)
	return else 	
	
	end
end

function ENT:drawCrosshair()
	surface.SetDrawColor(255,255,255,150)
	local center = {x=ScrW()/2, y=ScrH()/2}
	if IsValid(self:GetTarget()) then
		local pos = self:GetTarget():LocalToWorld(self:GetTargetOffset()):ToScreen()
		pos = {
			x = math.Clamp(pos.x-center.x+math.Rand(-1,1), -20, 20)+center.x,
			y = math.Clamp(pos.y-center.y+math.Rand(-1,1), -20, 20)+center.y
		}
		surface.DrawLine(center.x-20, pos.y, center.x+20, pos.y)
		surface.DrawLine(pos.x, center.y-20, pos.x, center.y+20)
	else
		surface.DrawLine(center.x+20, center.y, center.x+40, center.y)
		surface.DrawLine(center.x-40, center.y, center.x-20, center.y)
		surface.DrawLine(center.x, center.y+20, center.x, center.y+40)
		surface.DrawLine(center.x, center.y-40, center.x, center.y-20)
	end
	surface.DrawOutlinedRect(center.x-20, center.y-20, 40, 40)
	surface.DrawOutlinedRect(center.x-21, center.y-21, 42, 42)
	
	draw.Text({
		text = (
			self:GetNextShot() <= CurTime() and self:GetAmmo() > 0 and !self.Overheated
			and (IsValid(self:GetTarget()) and "LOCK" or "NO LOCK")
			or "MSL NOT READY"
		),
		font = "HudHintTextLarge",
		pos = {center.x, center.y+45},
		color = Color(255, 255, 255, 150),
		xalign = TEXT_ALIGN_CENTER
	})
		
end
