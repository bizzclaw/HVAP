
include "shared.lua"
function ENT:Initialize()
	self:addSounds()
	self.smoothHeat = 0
	self.LastThink = CurTime()
end

function ENT:Think()
	if self.SingleFire then return end
	local frt = CurTime()-self.LastThink
	local e = LocalPlayer():GetViewEntity()
	if !IsValid(e) then e = LocalPlayer() end
	
	local heatscl = self:GetSecondary()/1000
	local pos = e:GetPos()
	local spos = self:GetPos()
	local doppler = (pos:Distance(spos+e:GetVelocity())-pos:Distance(spos+self:GetVelocity()))/128
	local vehicle = LocalPlayer():GetVehicle()
	local inVehicle = false
	if IsValid(vehicle) and vehicle:GetNWEntity("hvap_aircraft") == self then
		if !vehicle:GetThirdPersonMode() then
			inVehicle = true
		end
		doppler = 0
	end

	local volume = tonumber(LocalPlayer():GetInfo("hvap_cl_air_volume"))
	local mod = (doppler+self:GetVelocity():Length()/80)
	if self:GetNWBool("shooting") then
		if !self:GetNWBool("overheated") then
			self.sounds.blankshoot:Stop()
			self.sounds.stop:Stop()
			self.sounds.shoot:PlayEx(1,math.Clamp(self.SndPitch-2+(10*heatscl^3)+mod,0,255))
		else
			self.sounds.shoot:Stop()
			self.sounds.stop:Stop()
			self.sounds.blankstop:Stop()
			self.sounds.blankshoot:Play()
		end	
		
		if self:GetSecondary() >= 800 then
			self.sounds.clickstop:Play()
		else
			self.sounds.clickshoot:Stop()
		end
	elseif self:GetNextShot() <= CurTime() and self:GetNextShot() != 0 then			
		if !self:GetNWBool("overheated") then
			self.sounds.shoot:Stop()
			self.sounds.stop:PlayEx(1, self.SndPitch)
			self.sounds.blankshoot:Stop()
			self.sounds.blankstop:Stop()
		else
			self.sounds.shoot:Stop()
			self.sounds.blankstop:Play()
			self.sounds.blankshoot:Stop()
		end		
	end
	
	if self:GetNWBool("overheated") then
		self.sounds.Jam:Play()
	else 
		self.sounds.Jam:Stop()
	end
	
	if self:GetNWBool("overheated") and self:GetSecondary() < 64 and !self:GetNWBool("shooting") then
		self.sounds.GunReady:Play()
	else 
		self.sounds.GunReady:Stop()
	end

--------------------------------------------------	

--------------------------------------------------	
	self.LastThink=CurTime()

end

function ENT:drawCrosshair()
	surface.SetDrawColor(255,255,255,150)
	local center = {x=ScrW()/2, y=ScrH()/2}
	surface.DrawLine(center.x+10, center.y, center.x+30, center.y)
	surface.DrawLine(center.x-30, center.y, center.x-10, center.y)
	surface.DrawLine(center.x, center.y+10, center.x, center.y+30)
	surface.DrawLine(center.x, center.y-30, center.x, center.y-10)
	surface.DrawOutlinedRect(center.x-10, center.y-10, 20, 20)
	surface.DrawOutlinedRect(center.x-11, center.y-11, 22, 22)
end

function ENT:OnRemove()
	for _, s in pairs(self.sounds) do
		s:Stop()
	end
end