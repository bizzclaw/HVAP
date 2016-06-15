
include("shared.lua")

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize()
	self:addSounds()

	self.IsOn = false
	self.LastThink = CurTime()

	self.weapons = {}
	self.weapons2 = {}

	self.valid = true
end

function ENT:receiveInput(name, value, seat)
	local player = LocalPlayer()
	if name == "FreeView"  then
		if value > 0.5 then
			player.hvap.viewFree = true
		else
			player.hvap.viewFree = false
			player.hvap_air_resetview = true
		end
	elseif name == "NextWeapon" and value > 0.5 then
		sound.Play( "HVAP.Switch.Click", self:GetPos() )			
	end
	
	if self.Camera and seat == self.Camera.seat and name == "Camera" then
		if value > 0.5 then
			player:GetVehicle().useCamera = !player:GetVehicle().useCamera
			if player:GetVehicle().useCamera then 
				sound.Play( "HVAP.Switch.FLIR.In_1", self:GetPos() )	
			else 
				sound.Play( "HVAP.Switch.FLIR.Out_1", self:GetPos() )	
			end
		end
	end
end

function ENT:Think()	
	if not self.valid then return end
	if self.skin ~= self:GetSkin() then
		self.skin = self:GetSkin()
		self:updateSkin(self.skin)
	end
	if !self:GetNWBool("locked") then
		self.camera = self:GetNWEntity("hvap_camera")
	end
end

function ENT:getPassenger(seat)
	if !IsValid(self:GetSwitcher()) then return end
	local s = self:GetSwitcher().seats[seat]
	if IsValid(s) then
		return s:GetPassenger()
	end
end

function ENT:OnRemove()
	for _,s in pairs(self.sounds) do
		s:Stop()
	end
end

function ENT:DrawHUD(k,p)
	if !self.Seats or !self.Seats[k] or p:GetViewEntity()!=p then return end
	if p:GetVehicle().useCamera and self.Camera and !p:GetVehicle():GetThirdPersonMode() then
		self:drawCameraHUD(self.Camera.seat)
	end
end

function ENT:drawCameraHUD(seat)

	local sw = ScrW()
	local sh = ScrH()
	
	local w = sh/6
	local s = sh/3
	
	surface.SetDrawColor(255,255,255,150)
	
	surface.DrawLine(sw/2-s, sh/2-s, sw/2-s+w, sh/2-s)
	surface.DrawLine(sw/2-s, sh/2-s, sw/2-s, sh/2-s+w)
	
	surface.DrawLine(sw/2+s, sh/2-s, sw/2+s-w, sh/2-s)
	surface.DrawLine(sw/2+s, sh/2-s, sw/2+s, sh/2-s+w)
	
	surface.DrawLine(sw/2-s, sh/2+s, sw/2-s+w, sh/2+s)
	surface.DrawLine(sw/2-s, sh/2+s, sw/2-s, sh/2+s-w)
	
	surface.DrawLine(sw/2+s, sh/2+s, sw/2+s-w, sh/2+s)
	surface.DrawLine(sw/2+s, sh/2+s, sw/2+s, sh/2+s-w)
	
	if not self.Seats[seat].weapons then
		return
	end
	
	local weapon = self:getWeapon(seat)
	if IsValid(weapon) and weapon.drawCrosshair then
		weapon:drawCrosshair()
	end

	local count=0
	for i, name in pairs(self.Seats[seat].weapons) do
		if i != "BaseClass" then
			count = count+1
			if i == self:GetNWInt("seat_"..seat.."_actwep") then
				surface.SetDrawColor(10,10,10,150)
				surface.DrawRect(sw/2+w*2,sh/7+count*50,w*2+10,50)
			end
		end
	end
	surface.SetDrawColor(10,10,10,100)
	surface.DrawRect(sw/2+w*2,sh/7+50,w*2+10,count*50)
	surface.SetDrawColor(255,255,255,200)
	surface.DrawOutlinedRect(sw/2+w*2,sh/7+50,w*2+10,count*50)
	surface.SetFont("hvap_heli_small")
	surface.SetTextColor(230,230,230,255)
	local h = 1
	for i, name in pairs(self.Seats[seat].weapons) do
		if i != "BaseClass" then
			local wep = self.weapons[name]
			local ammo = wep:GetAmmo()
			surface.SetTextPos(sw/2+w*2+5,sh/7+5+h*50)
			surface.DrawText(name)
			surface.SetTextPos(sw/2+w*4+5-string.len(ammo)*14,sh/7+5+h*50)
			surface.DrawText(ammo)
			surface.SetDrawColor(255,255,255,200)
			local lastshot = wep:GetLastShot()
			local nextshot = wep:GetNextShot()
			local indicator = wep:GetSecondary()
			surface.DrawRect(sw/2+w*2,sh/7+h*50+40, (w*2+10)*indicator/1000, 10)
			h=h+1
		end
	end
end

function ENT:DrawScreenSpaceEffects(k,p)

end

function ENT:onViewSwitch(p, thirdPerson)
	self.viewPos = nil
end

function ENT:onEnter(p)
	p.hvap.lagAngles =  self:GetAngles()
	p.hvap.lagPos = self:GetPos()
	p.hvap.lagSpeed = Vector(0, 0, 0)
	p.hvap.lagAccel = Vector(0, 0, 0)
	p.hvap.lagAccelDelta = Vector(0, 0, 0)
	p.hvap.air.vehicle = self
end

function ENT:getWeapon(seatId)
	local seat = self.Seats[seatId]
	if !seat then return end
	local active = self:GetNWInt("seat_"..seatId.."_actwep")
	if !seat.weapons or !seat.weapons[active] or !self.weapons then return end
	return self.weapons[seat.weapons[active]]
end

function ENT:getWeapon2(seatId)
	local seat = self.Seats[seatId]
	if !seat then return end
	local active = self:GetNWInt("seat_"..seatId.."_actwep2")
	if !seat.weapons2 or !seat.weapons2[active] or !self.weapons2 then return end
	return self.weapons2[seat.weapons2[active]]
end

function ENT:viewCalc(k, p, pos, ang, fov)
	if !self.Seats[k] then return end
	local view = {origin = pos, angles = ang, fov = fov}

	if (IsValid(p:GetVehicle()) and p:GetVehicle():GetNWEntity("hvap_aircraft") != self) or (not IsValid(p:GetVehicle())) then
		return self:viewCalcExit(p, view)
	end

	hvap.smoothApproachAngles(p.hvap.lagAngles, self:GetAngles(), 20)
	local shakeEnabled = p:GetInfo("hvap_cl_air_shakeview") == "1"
	if shakeEnabled then
		hvap.smoothApproachVector(p.hvap.lagPos, self:GetPos(), 20)
		hvap.smoothApproachVector(p.hvap.lagSpeed, p.hvap.lagPos-self:GetPos(), 20)
		hvap.smoothApproachVector(p.hvap.lagAccel, p.hvap.lagSpeed, 20)
		hvap.smoothApproachVector(p.hvap.lagAccelDelta, p.hvap.lagAccel, 20)
	end

	local v=p:GetVehicle()
	if IsValid(v) then
		if v:GetThirdPersonMode() then
			view = self:viewCalcThirdPerson(k, p, view)
		else
			if v.useCamera and self.Camera then
				view = self:viewCalcCamera(k, p, view)
			else
				view = self:viewCalcFirstPerson(k, p, view)
			end
		end
	end
	if self.viewTarget then
		self.viewPos = self.viewPos or table.Copy(self.viewTarget)
		hvap.smoothApproachVector(self.viewPos.origin, self.viewTarget.origin, 30)
		hvap.smoothApproachAngles(self.viewPos.angles, self.viewTarget.angles, 30)
		view.origin = view.origin + self.viewPos.origin
		if p:GetInfo("hvap_cl_air_smoothview") == "1" then
			view.angles = self:GetAngles()*2 + self.viewPos.angles - p.hvap.lagAngles
			if shakeEnabled then
				view.origin = view.origin + (p.hvap.lagAccel - p.hvap.lagAccelDelta)/7
			end
		else
			view.angles = self:GetAngles() + self.viewPos.angles
		end
		self.viewTarget = nil
	end
	return view
end

function ENT:viewCalcThirdPerson(k, p, view)
	local ang;
	if k == 1 and p:GetInfo("hvap_cl_air_mouse") == "1" and !p.hvap.viewFree
	then
		ang = self:GetAngles()
	else
		ang = k == self.Camera.seat and self.camera:GetAngles() or p:GetAimVector():Angle()
		ang.r = view.angles.r
	end
	ang:RotateAroundAxis(ang:Right(), -self.thirdPerson.angle)
	local origin = self:LocalToWorld(self.thirdPerson.position)
	local tr = util.QuickTrace(
			origin,
			ang:Forward()*-self.thirdPerson.distance,
			{self.Entity}
	) 
	self.viewTarget = {
		origin = (tr.HitPos - tr.Normal*10) - view.origin,
		angles = ang - self:GetAngles()
	}

	return view
end

function ENT:viewCalcFirstPerson(k, p, view)
	p.hvap = p.hvap or {}
	view.origin = self:LocalToWorld(Vector(0,0,34.15)+self.Seats[k].pos)
	if !p.hvap.viewFree then
		self.viewTarget = {
			origin = Vector(0,0,0),
			angles = k == self.Camera.seat and self:WorldToLocalAngles(self.camera:GetAngles()) or Angle(0,0,0),
			fov = view.fov
		}
	else
		self.viewTarget = {
			origin = Vector(0,0,0),
			angles = k == self.Camera.seat and self:WorldToLocalAngles(self.camera:GetAngles()) or p:GetAimVector():Angle() - self:GetAngles(),
			fov = view.fov
		}
	end
	return view
end

function ENT:viewCalcExit(p, view)
	p.hvap.air.vehicle = nil
end

function ENT:viewCalcCamera(k, p, view)

	view.origin = self.camera:LocalToWorld(self.Camera.viewPos)
	view.angles = self.camera:GetAngles()

	for k, t in pairs(self.Seats) do
		if k != "BaseClass" and self:getWeapon2(k) then	
			local zoom = self:getWeapon2(k):GetSecondary()
			if zoom > 0 then
				view.fov = 60-(zoom/25)
			else 
				view.fov = 60
			end
		end
	end

	if self.viewTarget then
		self.viewTarget.angles = p:GetAimVector():Angle() - self:GetAngles()
	end
	self.viewPos = nil
	p.hvap.lagAngles = Angle(0, 0, 0)
	p.hvap.lagAccel = Vector(0, 0, 0)
	p.hvap.lagAccelDelta = Vector(0, 0, 0)
	return view
end

function ENT:MovePlayerView(k,p,md)
	if p.hvap_air_resetview and k != self.Camera.seat then md:SetViewAngles(Angle(0,0,0)) p.hvap_air_resetview=false end
	local freeView = md:GetViewAngles()
	if !self.Seats or !self.Seats[k] then return end
	freeView.p = math.Clamp(freeView.p,-90,90)
	freeView.y = (freeView.y)
	md:SetViewAngles(freeView)
end

local HudMat = Material("WeltEnSTurm/helihud/arrow")
local HudCol = Color(70,199,50,150)
local Black = Color(0,0,0,200)

net.Receive("hvap.aircraft.updateWeapons", function(length)
	local aircraft = net.ReadEntity()
	local count = net.ReadInt(8)
	for i = 1, count do
		local name = net.ReadString()
		local weapon = net.ReadEntity()
		aircraft.weapons[name] = weapon
		for index, value in pairs(aircraft.Weapons[name].info) do
			weapon[index] = value
		end
		if weapon.clientUpdate then
			weapon:clientUpdate()
		end
	end
end)

net.Receive("hvap.aircraft.updateWeapons2", function(length)
	local aircraft = net.ReadEntity()
	local count = net.ReadInt(8)
	for i = 1, count do
		local name = net.ReadString()
		local weapon2 = net.ReadEntity()
		aircraft.weapons2[name] = weapon2
		for index, value in pairs(aircraft.Weapons2[name].info) do
			weapon2[index] = value
		end
		if weapon2.clientUpdate then
			weapon2:clientUpdate()
		end
	end
end)
