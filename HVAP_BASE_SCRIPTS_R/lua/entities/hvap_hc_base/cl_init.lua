
include("shared.lua")

function ENT:receiveInput(name, value, seat)
	local player = LocalPlayer()
	if name == "FreeView"  then
		if value > 0.5 then
			player.hvap.viewFree = true
		else
			player.hvap.viewFree = false
			player.hvap_air_resetview = true
		end
	end
	if self.Camera and seat == self.Camera.seat and name == "Camera" then
		if value > 0.5 then
			player:GetVehicle().useCamera = !player:GetVehicle().useCamera
			if player:GetVehicle().useCamera then 
				self:EmitSound( "hvap/gun/optic/flir_in.wav" )
			else 
				self:EmitSound( "hvap/gun/optic/flir_out.wav" )
			end
		end
	end
end

function ENT:Initialize()
	self:addSounds()
	
	self.smoothUp = 0
	self.engineRpm = 0
	self.rotorRpm = 0
	self.FuelAmt = 0
	self.IsOn = false
	self.LastThink = CurTime()

	self.weapons = {}
	self.weapons2 = {}

	self.valid = true
end

function ENT:Think()	
	if not self.valid then return end
	if self.skin ~= self:GetSkin() then
		self.skin = self:GetSkin()
		self:updateSkin(self.skin)
	end
	if !self:GetNWBool("locked") then
		self.camera = self:GetNWEntity("hvap_camera")
		local mouseFlight = self:GetNWBool("active")
		if self.sounds.Start then
			if mouseFlight != self.IsOn then
				if mouseFlight and self:GetNWFloat("ehp") > 0.192 then
					self.sounds.Start:Play()
				else
					self.sounds.Start:Stop()
				end
				self.IsOn = mouseFlight
			end
		end

		local frt = CurTime()-self.LastThink
		local e = LocalPlayer():GetViewEntity()
		if !IsValid(e) then e = LocalPlayer() end
		
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
		
		self.smoothUp = self.smoothUp - (self.smoothUp-self:GetNWFloat("up"))*frt*10
		self.rotorRpm = self.rotorRpm - (self.rotorRpm-self:GetNWFloat("rotorRpm"))*frt*10
		self.engineRpm = self.engineRpm - (self.engineRpm-self:GetNWFloat("engineRpm"))*frt*10
		self.FuelAmt = self.FuelAmt - (self.FuelAmt-self:GetNWFloat("fuel"))*frt*10
		local volume = tonumber(LocalPlayer():GetInfo("hvap_cl_air_volume"))
		local val = math.Clamp(self.rotorRpm*100 + doppler + self:GetVelocity():Length()/50, 0, 200)
		local mod = (doppler+self.smoothUp*20+self:GetVelocity():Length()/80)
		local enginerpm = math.Clamp(self.engineRpm*100+mod*self.engineRpm, 0, 200)
		local enginevolume = math.Clamp(self.engineRpm*100 + doppler + self:GetVelocity():Length()/50, 0, 200)/100
		local rotorpitch = math.Clamp(self.rotorRpm*100+mod*self.rotorRpm, 0, 200)
		local rotorvolume = math.Clamp(self.rotorRpm*100 + doppler + self:GetVelocity():Length()/50, 0, 200)/100
		local cockpit = math.Clamp(self.smoothUp*5+self.engineRpm*70, 0, 120)

--------------------------enginenear
		if self.engineRpm*100 > .0000005 then
			if pos:Distance(spos) < 6000 then
				if !self.sounds.EngineNear:IsPlaying() then
					self.sounds.EngineNear:PlayEx(0,enginerpm)
				else
					self.sounds.EngineNear:ChangePitch(enginerpm, 1)
					self.sounds.EngineNear:ChangeVolume(volume*math.Clamp(enginevolume, 0, inVehicle and .256 or 1), 0.1)
				end
			else 
				if self.sounds.EngineNear:IsPlaying() then
					self.sounds.EngineNear:Stop()
				end
			end
--------------------------enginefar
			if pos:Distance(spos) > 1920 and pos:Distance(spos) < 10240 then
				if !self.sounds.EngineFar:IsPlaying() then
					self.sounds.EngineFar:PlayEx(0,enginerpm)
				else
					self.sounds.EngineFar:ChangePitch(math.Clamp(enginerpm, 0, 150), 1)
					self.sounds.EngineFar:ChangeVolume(volume*math.Clamp(enginevolume, 0, inVehicle and 0 or 1), 0.1)				
				end
			else 
				if self.sounds.EngineFar:IsPlaying() then
					self.sounds.EngineFar:Stop()
				end
			end
--------------------------whine
			if pos:Distance(spos) < 4000 then
				if !self.sounds.EngineWhine:IsPlaying() then
					self.sounds.EngineWhine:PlayEx(0,enginerpm)
				else
					self.sounds.EngineWhine:ChangePitch(math.Clamp(enginerpm, 0, 150), 1)
					self.sounds.EngineWhine:ChangeVolume(volume*math.Clamp(enginevolume, 0, inVehicle and 0.128 or 0.512), 0.1)	
				end
			else 
				if self.sounds.EngineWhine:IsPlaying() then
					self.sounds.EngineWhine:Stop()
				end
			end						
--------------------------cockpit		
			if inVehicle then
				if !self.sounds.Cockpit:IsPlaying() then
					self.sounds.Cockpit:PlayEx(0,cockpit)
				else 
					self.sounds.Cockpit:ChangePitch(cockpit, 0.4)
					self.sounds.Cockpit:ChangeVolume(volume*math.Clamp(enginevolume, 0, inVehicle and .512 or 0), 0.1)
				end
			else
				if self.sounds.Cockpit:IsPlaying() then
					self.sounds.Cockpit:Stop()
				end			
			end
--------------------------end enginecontroller
		else
			self.sounds.Cockpit:Stop()	
			self.sounds.EngineNear:Stop()
			self.sounds.EngineFar:Stop()				
			self.sounds.EngineWhine:Stop()	
		end
--------------------------------------------------------------------------------------------------------
--------------------------bladesnear
		if self.rotorRpm*100 > .0000005 then
			if pos:Distance(spos) < 8092 then 
				if !self.sounds.RotorNear:IsPlaying() then
					self.sounds.RotorNear:PlayEx(0,rotorpitch)
				else
					self.sounds.RotorNear:ChangePitch(math.Clamp(rotorpitch, 0, 150), 1)
					self.sounds.RotorNear:ChangeVolume(volume*math.Clamp(rotorvolume, 0, inVehicle and .2 or 1), 0.1)
				end
			else 
				if self.sounds.RotorNear:IsPlaying() then
					self.sounds.RotorNear:Stop()
				end
			end
--------------------------bladesfar
			if pos:Distance(spos) > 4096 and pos:Distance(spos) < 13200 then 
				if !self.sounds.RotorFar:IsPlaying() then
					self.sounds.RotorFar:PlayEx(0,rotorpitch)
				else
					self.sounds.RotorFar:ChangePitch(math.Clamp(rotorpitch, 0, 150), 1)
					self.sounds.RotorFar:ChangeVolume(volume*math.Clamp(rotorvolume, 0, inVehicle and 0 or 1), 0.1)				
				end
			else 
				if self.sounds.RotorFar:IsPlaying() then
					self.sounds.RotorFar:Stop()
				end
			end
		else
			self.sounds.RotorNear:Stop()
			self.sounds.RotorFar:Stop()
		end
--------------------------	
		if self.sounds.Start then
			self.sounds.Start:ChangeVolume(volume*math.Clamp(100 - self.engineRpm*110, 0, inVehicle and 1 or 0.8)/100, 0.1)
			self.sounds.Start:ChangePitch(100 - self.engineRpm*20, 0.1)
		end
		self.LastThink=CurTime()
	else
		self.sounds.Cockpit:Stop()	
		self.sounds.RotorNear:Stop()
		self.sounds.RotorFar:Stop()
		self.sounds.EngineNear:Stop()
		self.sounds.EngineFar:Stop()
		self.sounds.EngineWhine:Stop()
		if self.sounds.Start then
			self.sounds.Start:Stop()
		end
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
--			surface.DrawRect(sw/2+w*2,sh/7+h*50+40,(w*2+10)*math.Clamp((nextshot-CurTime())/(nextshot-lastshot),0,1),10)
			surface.DrawRect(sw/2+w*2,sh/7+h*50+40, (w*2+10)*indicator/1000, 10)
			h=h+1
		end
	end
end

function ENT:DrawScreenSpaceEffects(k,p)
	if !self.Seats or !self.Seats[k] or p:GetViewEntity()!=p then return end
	if p:GetVehicle().useCamera and self.Camera and !p:GetVehicle():GetThirdPersonMode() then
		self:renderCameraEffects(self.Camera.seat)
	end
end

function ENT:renderCameraEffects(seat)
	local crt = CurTime()
	local sw = ScrW()
	local sh = ScrH()

	DrawColorModify({
		["$pp_colour_addr"] = 0,
		["$pp_colour_addg"] = 0,
		["$pp_colour_addb"] = 0,
		["$pp_colour_brightness"] = 0,
		["$pp_colour_contrast" ] = 1,
		["$pp_colour_colour" ] = 0,
		["$pp_colour_mulr" ] = 0,
		["$pp_colour_mulg" ] = 0,
		["$pp_colour_mulb" ] = 0,
	})
--	DrawMotionBlur( 0.4, 0.8, 0.008 )
	DrawToyTown( 1, sh/4 )
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
		ang = p:GetAimVector():Angle()
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
	if k == 1 and p:GetInfo("hvap_cl_air_mouse") == "1" and !p.hvap.viewFree
	then
		self.viewTarget = {
			origin = Vector(0,0,0),
			angles = Angle(0,0,0),
			fov = view.fov
		}
	else
		self.viewTarget = {
			origin = Vector(0,0,0),
			angles = p:GetAimVector():Angle() - self:GetAngles(),
			fov = view.fov
		}
		self.viewTarget.angles.r = self.viewTarget.angles.r + self:GetAngles().r
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
	if p.hvap_air_resetview and self.Camera and k != self.Camera.seat then md:SetViewAngles(Angle(0,0,0)) p.hvap_air_resetview=false end
	local freeView = md:GetViewAngles()
	if !self.Seats or !self.Seats[k] then return end
	if (k==1 and p:GetInfo("hvap_cl_air_mouse")=="1" and !p.hvap.viewFree) then
		freeView.p = freeView.p-freeView.p*FrameTime()*6
		freeView.y = freeView.y-(freeView.y-90)*FrameTime()*6
	else
		freeView.p = math.Clamp(freeView.p,-90,90)
	end
	freeView.y = (freeView.y)
	md:SetViewAngles(freeView)
end

local HudMat = Material("WeltEnSTurm/helihud/arrow")
local HudCol = Color(70,199,50,150)
local Black = Color(0,0,0,200)

function ENT:DrawPilotHud()
	local pos = self:GetPos()
	local fwd = self:GetForward()
	local ri = self:GetRight()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ri, 90)
	ang:RotateAroundAxis(fwd, 90)
	local crt = CurTime()	
	local uptm = self.rotorRpm
	local upm = self.smoothUp
	local throttle = self.Throttle
	cam.Start3D2D(self:LocalToWorld(Vector(20,3.75,37.75)*self.Scale+self.Seats[1].pos), ang, 0.015*self.Scale)
	surface.SetDrawColor(HudCol)
--self.FuelAmt  self:GetNWFloat("ehp")
	local rects = {
		{235, 249, 10, 2},
		{255, 249, 10, 2},
		{249, 235, 2, 10},
		{249, 255, 2, 10},
		{-3, 0, 3, 500},
		{500, 0, 3, 500},
		{7, 0, 3, 500},
		{490, 0, 3, 500},
		{-6,-3,19,3},
		{-6,500,19,3},
		{487,-3,19,3},
		{487,500,19,3},
		{9,248,5,3},
		{485,248,5,3},
		{1, 500-uptm*500, 5, uptm*500},		
		{494, 500-self.FuelAmt*500, 5, self.FuelAmt*500},
	}
	
	for _, e in pairs(rects) do
		surface.DrawRect(e[1], e[2], e[3], e[4])
	end

--	surface.DrawRect(1, throttle*100, 5, 0)--throttle
	
	surface.DrawLine(30, 5*ang.r-200+2.77*ang.p, 220, 5*ang.r-200+2.77*(ang.p*0.12))
	surface.DrawLine(30, 5*ang.r-200+2.77*ang.p+1, 220, 5*ang.r-200+2.77*(ang.p*0.12)+1)
	surface.DrawLine(280, 5*ang.r-200-2.77*(ang.p*0.12), 470, 5*ang.r-200-2.77*ang.p)
	surface.DrawLine(280, 5*ang.r-200-2.77*(ang.p*0.12)+1, 470, 5*ang.r-200-2.77*ang.p+1)
	surface.SetMaterial(HudMat)
	surface.DrawTexturedRect(-20,250-upm*250-10,20,20)
	surface.DrawTexturedRectRotated(512,math.Clamp(250-self:GetVelocity().z/5.249*2,0,500),20,20,180)
	surface.SetTextColor(HudCol)
	surface.SetFont("hvap_heli_small")
	surface.SetTextPos(-10, 505) 
	surface.DrawText("SPD")
	surface.SetTextPos(-10, 520)
	surface.DrawText(math.floor(self:GetVelocity():Length()*0.068796244)) --knots (real would be 0.037147, but fuck it) 0.068796244 km

	if self:GetNWFloat("ehp") < 0.55 then 
		surface.SetTextColor(HudCol)
		surface.SetFont("hvap_heli_small")
		surface.SetTextPos(483, 551)
		surface.DrawText("ENG")		
	end
	
	if self:GetHover() then
		surface.SetTextColor(HudCol)
		surface.SetFont("hvap_heli_small")
		surface.SetTextPos(483, 535)
		surface.DrawText("HVR")
	end
	
	local tr=util.QuickTrace(pos,Vector(0,0,-999999),self.Entity)
	surface.SetTextPos(485,505)
	surface.DrawText("ALT")
	surface.SetTextPos(485,520)
	surface.DrawText(math.floor((pos.z-tr.HitPos.z)/52.49343832021))
	surface.SetTextPos(485,-26)
	surface.DrawText("FUL")
	surface.SetTextPos(-10,-26)
	surface.DrawText("RPM")

	cam.End3D2D()
end

function ENT:DrawWeaponSelection()
	local fwd = self:GetForward()
	local ri = self:GetRight()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ri, 90)
	ang:RotateAroundAxis(fwd, 90)
	for k, t in pairs(self.Seats) do
		if k != "BaseClass" and self:getWeapon(k) then
			cam.Start3D2D(self:LocalToWorld(Vector(20,5,25)*self.Scale + t.pos), ang, 0.02*self.Scale)
			surface.DrawRect(-10, -25, 500, 30)
			surface.DrawRect(-10, 5, 10, 20)
			surface.DrawRect(-10, 25, 500, 30)
			surface.DrawRect(-10, 55, 10, 20)
			
			local weapon = self:getWeapon(k)
			local lastshot = weapon:GetLastShot()
			local nextshot = weapon:GetNextShot()
			local indicator = weapon:GetSecondary()
			local ammo = weapon:GetAmmo()

			draw.SimpleText(k.." "..t.weapons[self:GetNWInt("seat_"..k.."_actwep")], "hvap_heli_big", 0, -25, Black, 0)
			draw.SimpleText(ammo, "hvap_heli_big", 480, -25, Black, 2)
			surface.DrawRect( -10, -25,500*math.Clamp((nextshot-CurTime())/(nextshot-lastshot),0,1),30)
			surface.DrawRect( -10, 5, indicator/1000*480, 20)
			
			if k != "BaseClass" and self:getWeapon2(k) then
				local weapon2 = self:getWeapon2(k)			
				local lastshot2 = weapon2:GetLastShot()
				local nextshot2 = weapon2:GetNextShot()
				local indicator2 = weapon2:GetSecondary()
				local ammo2 = weapon2:GetAmmo()		

				draw.SimpleText(k.." "..t.weapons2[self:GetNWInt("seat_"..k.."_actwep2")], "hvap_heli_big", 0, 25, Black, 0)
				draw.SimpleText(ammo2, "hvap_heli_big", 480, 25, Black, 2)
				surface.DrawRect( -10, 25,500*math.Clamp((nextshot2-CurTime())/(nextshot2-lastshot2),0,1),30)			
				surface.DrawRect( -10, 55, indicator2/1000*480, 20)			
			end
			
			cam.End3D2D()
		end
	end
end

function ENT:Draw()
	self:DrawModel()
	if !self.Seats or self:GetNWBool("locked") then return end
	self:DrawPilotHud()
	self:DrawWeaponSelection()
end

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
