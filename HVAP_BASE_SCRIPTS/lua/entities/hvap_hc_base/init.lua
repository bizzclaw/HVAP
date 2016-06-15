if wac then
	MsgC( Color( 255, 0, 0 ), "WAC and HVAP are both installed and are incompatable, remove WAC to regain HVAP functionality." )
return end

include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("hvap/aircraft.lua")

util.AddNetworkString("hvap.aircraft.updateWeapons")
util.AddNetworkString("hvap.aircraft.updateWeapons2")

function ENT:Initialize()
	hvap.aircraft.initialize()
	self.Entity:SetModel(self.Model)
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.phys = self:GetPhysicsObject()
	if self.phys:IsValid() then
		self.phys:SetMass(self.Weight)
		self.phys:EnableDrag(false)
		self.phys:Wake()
	end		
	
	local skins = self:SkinCount()	
	if skins != 1 then
		skin = math.random(skins)
		self:SetSkin(skin)
	end		
	
	self.Children = {}
		
	self.OnRemoveEntities={}
	self.OnRemoveFunctions={}
	self.wheels = {}
	
	self.StartSpd = hvap.aircraft.cvars.startSpeed:GetFloat()
	
	self.NumEngines = #self.Engines
	self.NumRotors = #self.Rotors
	
	self.nextUpdate = 0
	self.LastDamageTaken = 0
	self.hvap_seatswitch = true
	self.rotorRpm = 0
	self.EnginesRPM = 0
	self.EnginePower = 0
	self.LastPhys = 0
	self.Roll = 0
	self.Pitch = 0
	self.Yaw = 0	
	self.Throttle = 0
	self.Boost = false
	self.ThrSensitivity = 1
	
	self.FuselageHPMult = hvap.aircraft.cvars.fhealthmul:GetFloat()
	self.EngineHPMult = hvap.aircraft.cvars.ehealthmul:GetFloat()
	self.RotorHPMult = hvap.aircraft.cvars.rhealthmul:GetFloat()

	if self.FuselageHPMult > 0 then
		self.FuselageHealth = self.FuselageHealth*self.FuselageHPMult
		self.Unbreakable = false
	else
		self.Unbreakable = true
	end
	
	self.FuselageBaseHealth = self.FuselageHealth
	self.CriticalHealth = self.FuselageBaseHealth*4
	self.CriticalBaseHealth = self.CriticalHealth
	self.EnginesMaxHealth = 0
	self.FSCL = 1
	
	self.BaseFuel = self.Fuel
	
	self.passengers = {}
	
	self.controls = {
		throttle = 0,
		pitch = 0,
		yaw = 0,
		roll = 0,
	}

	self.disabled = false
	self.dead = false
	self.CriticalDeath = false
	self.spinout = false
	
	self.GearDown = false
	self:LandingGear(false)

	self:addSounds()
	
	self:addEngines()
	self:addRotors()
	self:addWheels()

	self:addWeapons()
	self:addCountermeasures()

	self:addSeats()
	self:addNpcTargets()
	self:addAttachments()	
	self:addExtras()

	if self.HasDoors and self.DoorFlip then
		self:SetBodygroup(self.DoorBodygroup, 1)	
	end
	self.DoorIsOpen = true
	
	local effectdata = EffectData()
	effectdata:SetEntity( self )
	util.Effect( "hvap_spawn", effectdata, true, true )		
	table.insert(self.Children, self)
end

function ENT:addEntity(name, nofx)
	local e = ents.Create(name)
	if !IsValid(e) then return nil end
	
	if !nofx then
		local effectdata = EffectData()
		effectdata:SetEntity( e )
		util.Effect( "hvap_spawn", effectdata, true, true )	
	end
	
	table.insert(self.Children, e)
	e.Owner = self.Owner
--	e:SetNWString("Owner", "World")
	return e
end

function ENT:UpdateTransmitState() return TRANSMIT_ALWAYS end

function ENT:addNpcTargets()
	for _,s in pairs(self.HatingNPCs) do
		self:Fire("SetRelationShip", s.." D_HT 99")
	end
end

function ENT:addEngines()
	self.engines = {}
	for k, v in pairs(self.Engines) do
		if k != "BaseClass" then
			local eng = self:addEntity("hvap_engine", true)
			eng:SetPos(self:LocalToWorld(v.pos))
			eng:SetAngles(self:GetAngles())
			eng:SetParent(self)
			for index, value in pairs(v.info) do
				eng[index] = value
			end
			eng.aircraft = self				
			eng:Spawn()
			eng:Activate()
			self.engines[k] = eng
			self:AddOnRemove(eng)
		end
	end
	for i = 1, self.NumEngines do
		self.EnginesMaxHealth = self.EnginesMaxHealth+self.engines[i].BaseHealth
	end
end

function ENT:addRotors()
	self.rotors={}
	for k, v in pairs(self.Rotors) do
		if k != "BaseClass" then
			if !v.istail then
				local rotor = self:addEntity("hvap_rotor", false)
					rotor:SetPos(self:LocalToWorld(v.pos))
					rotor:SetAngles(self:LocalToWorldAngles(v.ang))
					rotor:SetModel(v.model)
					for index, value in pairs(v.info) do
						rotor[index] = value
					end			
					rotor.aircraft = self
					rotor:Spawn()
					rotor:Activate()
					self.rotors[k] = rotor
					self:AddOnRemove(rotor)
				if rotor:IsValid() then
					constraint.Axis(self.Entity, rotor, 0, 0, v.pos, Vector(0,0,1), 0,0,0,1)
				end
			else 
				local trotor = self:addEntity("hvap_rotor_r", false)
					trotor:SetPos(self:LocalToWorld(v.pos))
					trotor:SetAngles(self:LocalToWorldAngles(v.ang))
					trotor:SetModel(v.model)
					for index, value in pairs(v.info) do
						trotor[index] = value
					end			
					trotor.aircraft = self	
					trotor:Spawn()
					trotor:Activate()
					self.RearRotor = trotor
					self.rotors[k] = trotor
					self:AddOnRemove(trotor)
				if trotor:IsValid() then
					constraint.Axis(self.Entity, trotor, 0, 0, v.pos, Vector(0, 1, 0), 0,0,0,1)
				end
			end
		end
	end
end

function ENT:addWeapons()
	self.weapons = {}
	self.weapons2 = {}
	for i, w in pairs(self.Weapons) do
		if i != "BaseClass" then
			local pod = ents.Create(w.class)
			pod:SetPos(self:GetPos())
			pod:SetAngles(self:GetAngles())
			pod:SetParent(self)
			for index, value in pairs(w.info) do
				pod[index] = value
			end
			pod.aircraft = self
			pod:Spawn()
			pod:Activate()
			pod:SetNoDraw(true)
			pod.podIndex = i
			self.weapons[i] = pod
			self:AddOnRemove(pod)
			table.insert(self.Children, pod)
		end
	end

	for i, w in pairs(self.Weapons2) do
		if i != "BaseClass" then
			local pod2 = ents.Create(w.class)
			pod2:SetPos(self:GetPos())
			pod2:SetAngles(self:GetAngles())
			pod2:SetParent(self)
			for index, value in pairs(w.info) do
				pod2[index] = value
			end
			pod2.aircraft = self
			pod2:Spawn()
			pod2:Activate()
			pod2:SetNoDraw(true)
			pod2.podIndex = i
			self.weapons2[i] = pod2
			self:AddOnRemove(pod2)
			table.insert(self.Children, pod2)
		end
	end
end

function ENT:addSeats()
	self.seats = {}
	local e = self:addEntity("hvap_seat_connector", true)
	e:SetPos(self:LocalToWorld(self.SeatSwitcherPos))
	e:SetNoDraw(true)
	e:Spawn()
	e:Activate()
	e.hvap_ignore = true
	e:SetNotSolid(true)
	e:SetParent(self)
	self:SetSwitcher(e)
	for k, v in pairs(self.Seats) do
		if k != "BaseClass" then
			local ang = self:GetAngles()
			self.seats[k] = self:addEntity("prop_vehicle_prisoner_pod", true)
			self.seats[k].activeProfile = 1
			self.seats[k]:SetModel("models/nova/airboat_seat.mdl")
			self.seats[k]:SetPos(self:LocalToWorld(v.pos))
			self.seats[k]:Spawn()
			self.seats[k]:Activate()
			self.seats[k]:SetNWInt("selectedWeapon", 0)
			if v.ang then
				local a = self:GetAngles()
				a.y = a.y-90
				a:RotateAroundAxis(Vector(0,0,1), v.ang.y)
				self.seats[k]:SetAngles(a)
			else
				ang:RotateAroundAxis(self:GetUp(), -90)
				self.seats[k]:SetAngles(ang)
			end
			self.seats[k]:SetNoDraw(true)
			self.seats[k]:SetNotSolid(true)
			self.seats[k]:SetParent(self)
			self.seats[k].hvap_ignore = true
			self.seats[k]:SetNWEntity("hvap_aircraft", self)
			self.seats[k]:SetKeyValue("limitview","0")
			self:SetNWInt("seat_"..k.."_actwep", 1)
			self:SetNWInt("seat_"..k.."_actwep2", 1)
			e:addVehicle(self.seats[k])
		end
	end
end

function ENT:addAttachments()
	self.weaponAttachments = {}
	if self.WeaponAttachments then
		for k, v in pairs(self.WeaponAttachments) do
			local t = self:addEntity("hvap_turret")			
			t:SetPos(self:LocalToWorld(v.pos))
			t:SetAngles(self:GetAngles())
			t:SetModel(v.model)
			t:SetParent(self)
			t:SetOwner(self)
			for index, value in pairs(v) do
				t[index] = value
			end	
			t.aircraft = self	
			t:Spawn()
			t:Activate()
			t.restrictPitch = v.restrictPitch
			t.restrictYaw = v.restrictYaw
			t.offset = v.offset
			self:AddOnRemove(t)
			self.weaponAttachments[k] = t
		end
	end
	if self.Camera then
		local t = self:addEntity("hvap_turret")		
		t:SetPos(self:LocalToWorld(self.Camera.pos))
		t:SetAngles(self:GetAngles())
		t:SetModel(self.Camera.model)
		t:SetParent(self)
		t:SetOwner(self)
		for index, value in pairs(self.Camera) do
			t[index] = value
		end			
		t.aircraft = self	
		t:Spawn()
		t:Activate()
		t.restrictPitch = self.Camera.restrictPitch
		t.restrictYaw = self.Camera.restrictYaw
		t.offset = self.Camera.offset
		self:AddOnRemove(t)
		self.camera = t
		self:SetNWEntity("hvap_camera", t)
		table.insert(self.weaponAttachments, t)
	end	
end

function ENT:addExtras()
	if self.Extras then
		for k, v in pairs(self.Extras) do
			local e = self:addEntity("prop_physics")			
			e:SetPos(self:LocalToWorld(v.pos))
			e:SetAngles(self:GetAngles()+v.ang)
			e:SetModel(v.model)
			e:SetNotSolid(true)
			e:SetParent(self)
			e:Spawn()
			local ph = e:GetPhysicsObject()
			ph:SetMass(1)
			ph:EnableDrag(false)
			ph:EnableGravity(false)
			e:Activate()
			self:AddOnRemove(e)
		end
	end
end

function ENT:addWheels()
	for _,t in pairs(self.Wheels) do
		if t.mdl then
			local e=self:addEntity("prop_physics")
			e:SetModel(t.mdl)
			e:SetPos(self:LocalToWorld(t.pos))
			e:SetAngles(self:GetAngles())
			e:Spawn()
			e:Activate()
			local ph=e:GetPhysicsObject()
				ph:SetMass(t.mass)
				ph:EnableDrag(false)
			e:SetGravity(0.01)
			ph:SetMaterial( "rubbertire" )
			constraint.Axis(e,self,0,0,Vector(0,0,0),self:WorldToLocal(e:LocalToWorld(Vector(0,1,0))),0,0,t.friction,1)
			table.insert(self.wheels,e)
			self:AddOnRemove(e)
		end
	end
end
--flares
function ENT:addCountermeasures()

	self.flares = {}
	for i, w in pairs(self.CounterMeasures) do
		if i != "BaseClass" then
			local pod = ents.Create(w.class)
			pod:SetPos(self:GetPos())
			pod:SetAngles(self:GetAngles())
			pod:SetParent(self)
			for index, value in pairs(w.info) do
				pod[index] = value
			end
			pod.aircraft = self
			pod.entTable = self.OnRemoveEntities
			pod:Spawn()
			pod:Activate()
			pod:SetNoDraw(true)
			self.flares = pod
			self:AddOnRemove(pod)
		end
	end
end

function ENT:fireCounter(bool, i)
	if !self.CounterMeasures then return end
	local pod = self.flares
	if !pod then return end
	pod.shouldFire = bool
	pod:trigger(bool, self.seats[1])
end
--landing gear
function ENT:LandingGear(b)
	if !self.HasGear then return end
	if b then
		self.GearDown = true
	elseif self.GearDown then
		self.GearDown = false
	end
	
	local geardown,t1=self:LookupSequence(self.GearDownAnim)
	local gearup,t2=self:LookupSequence(self.GearUpAnim)	

	if !self.disabled then
		if b then
			self:ResetSequence(gearup) 
			self:SetPlaybackRate(1.0)
			self:SetBodygroup(self.GearBodygroup,1)	
			for i=1,#self.wheels do 
				self.wheels[i]:SetRenderMode(RENDERMODE_TRANSALPHA)
				self.wheels[i]:SetColor(Color(255,255,255,0))
				self.wheels[i]:SetSolid(SOLID_NONE)
			end		
		elseif !b then
			self:ResetSequence(geardown)
			self:SetPlaybackRate(1.0)
			self:SetBodygroup(self.GearBodygroup,0)
			for i=1,#self.wheels do 
				self.wheels[i]:SetRenderMode(RENDERMODE_NORMAL)
				self.wheels[i]:SetColor(Color(255,255,255,255))
				self.wheels[i]:SetSolid(SOLID_VPHYSICS)
			end	
		end
	end
end

function ENT:Doors(b)-- true closed, false open
	if b then
		if self.DoorOpen then return end
		self.DoorOpen = true
	elseif self.DoorOpen then
		self.DoorOpen=false
	end
	if !self.DoorFlip then
		self:SetBodygroup(self.DoorBodygroup, b and 1 or !b and 0)
	else 
		self:SetBodygroup(self.DoorBodygroup, b and 0 or !b and 1)	
	end
	self.DoorIsOpen = !self.DoorIsOpen
end

function ENT:fireWeapon1(bool, i)
	if !self.Seats[i].weapons then return end
	local pod = self.weapons[self.Seats[i].weapons[self.seats[i].activeProfile]]
	if !pod then return end
	pod.shouldFire = bool
	pod:trigger(bool, self.seats[i])
--	self.Entity:SetPoseParameter("minigun_fire", 12)
end

function ENT:fireWeapon2(bool, i)
	if !self.Seats[i].weapons2 then return end
	local pod = self.weapons2[self.Seats[i].weapons2[self.seats[i].activeProfile]]
	if !pod then return end
	pod.shouldFire = bool
	pod:trigger(bool, self.seats[i])
end

function ENT:nextWeapon(i, p)
	if !self.Seats[i].weapons then return end
	local seat = self.seats[i]
	local Seat = self.Seats[i]

	local pod = self.weapons[Seat.weapons[seat.activeProfile]]
	if pod then
		pod:select(false)
		pod.seat = nil
	end

	local pod2 = self.weapons2[Seat.weapons2[seat.activeProfile]]
	if pod2 then
		pod2:select(false)
		pod2.seat = nil
	end

	if seat.activeProfile == #Seat.weapons then
		seat.activeProfile = 0
	else
		seat.activeProfile = seat.activeProfile + 1
	end
	if Seat.weapons[seat.activeProfile] then
		local weapon = self.weapons[Seat.weapons[seat.activeProfile]]
		weapon:select(true)
		weapon.seat = seat
	end
	
	self:SetNWInt("seat_"..i.."_actwep", seat.activeProfile)

	if Seat.weapons2[seat.activeProfile] then
		local weapon = self.weapons2[Seat.weapons2[seat.activeProfile]]
		weapon:select(true)
		weapon.seat = seat
	end
	self:SetNWInt("seat_"..i.."_actwep2", seat.activeProfile)
end

function ENT:attachmentThink()
	if !self.weaponAttachments or !self.Camera then return end
	local camAng = self:getCameraAngles()
	if !camAng then return end
	local tr = util.QuickTrace(self:LocalToWorld(self.Camera.pos)+camAng:Forward()*20, camAng:Forward()*999999999, self)
	for k, t in pairs(self.weaponAttachments) do
		if !t:IsValid() then return end
		local localAng = self:WorldToLocalAngles((tr.HitPos - t:GetPos()):Angle())
		localAng = Angle(t.restrictPitch and 0 or localAng.p, t.restrictYaw and 0 or localAng.y, t.r or 0)
		t:SetAngles(self:LocalToWorldAngles(localAng))
		if t.offset then
			t:SetPos(self:LocalToWorld(t.pos) + t:LocalToWorld(t.offset) - t:GetPos())
		end
	end
end

function ENT:EjectPassenger(ply,idx,t)
	if !idx then
		for k,p in pairs(self.passengers) do
			if p==ply then idx=k end
		end
		if !idx then
			return
		end
	end
	ply.LastVehicleEntered = CurTime()+0.5
	ply:ExitVehicle()
	ply:SetPos(self:LocalToWorld(self.Seats[idx].exit))
	ply:SetVelocity(self:GetPhysicsObject():GetVelocity()*1.6)
	ply:SetEyeAngles((self:LocalToWorld(self.Seats[idx].pos-Vector(0,0,40))-ply:GetPos()):Angle())
	self:updateSeats()
end

function ENT:Bail(ply,idx,t)
	if !idx then
		for k,p in pairs(self.passengers) do
			if p==ply then idx=k end
		end
		if !idx then
			return
		end
	end
	ply.LastVehicleEntered = CurTime()+0.5
	ply:ExitVehicle()
	ply:SetPos(self:LocalToWorld(self.Seats[idx].exit+Vector(0,self.Seats[idx].exit.y*4,256)))
	ply:SetVelocity(self:GetPhysicsObject():GetVelocity()*-0.64 +Vector(0,0,1024+self:GetPhysicsObject():GetVelocity().z))
	ply:SetEyeAngles((self:LocalToWorld(self.Seats[idx].pos-Vector(0,0,40))-ply:GetPos()):Angle())
	self:updateSeats()
end

function ENT:Use(act, cal)
	if self.disabled then return end
	if act.hvap and act.hvap.lastEnter and act.hvap.lastEnter+0.5 > CurTime() then return end
	local d = self.MaxEnterDistance
	local v
	local num
	for k, veh in pairs(self.seats) do
		if veh and veh:IsValid() then
			local psngr = veh:GetPassenger(0)
			if !psngr or !psngr:IsValid() then
				local dist = veh:GetPos():Distance(util.QuickTrace(act:GetShootPos(),act:GetAimVector()*self.MaxEnterDistance,act).HitPos)
				if dist < d then
					d = dist
					v = veh
					num = k
				end
			end
		end
	end
	act.hvap = act.hvap or {}
	act.hvap.lastEnter = CurTime()
	if v and num < 3 then
		act:EnterVehicle(v)
	elseif v and num >= 3 then
		if self.DoorIsOpen then
			act:EnterVehicle(v)
		else
			sound.Play( "HVAP.Gun.Misc.NoSecondary", act:GetPos() )
		end
	end
	self:updateSeats()
end

function ENT:updateSeats()
	for k, veh in pairs(self.seats) do
		if !veh:IsValid() then return end
		local p = veh:GetPassenger(0)
		if self.passengers[k] != p then
			if IsValid(self.passengers[k]) then
				self.passengers[k]:SetNWEntity("hvap_aircraft", NULL)
			end
			self:SetNWEntity("passenger_"..k, p)
			self.passengers[k] = p
			if IsValid(p) then
				p:SetNWInt("hvap_passenger_id",k)
				p.hvap = p.hvap or {}
				p.hvap.mouseInput = true
				net.Start("hvap.aircraft.updateWeapons")
				net.WriteEntity(self)
				net.WriteInt(table.Count(self.weapons), 8)
				for name, weapon in pairs(self.weapons) do
					net.WriteString(name)
					net.WriteEntity(weapon)
				end
				net.Send(p)

				p:SetNWInt("hvap_passenger_id",k)
				p.hvap = p.hvap or {}
				p.hvap.mouseInput = true
				net.Start("hvap.aircraft.updateWeapons2")
				net.WriteEntity(self)
				net.WriteInt(table.Count(self.weapons2), 8)
				for name, weapon2 in pairs(self.weapons2) do
					net.WriteString(name)
					net.WriteEntity(weapon2)
				end
				net.Send(p)
			end

		end
	end
	if !IsValid(self.seats[1]:GetDriver()) then
		self.controls.pitch = 0
		self.controls.yaw = 0
		self.controls.roll = 0
		self.IncrementalThr = 0
		self.ThrSensitivity = 0
		self.AutoLevel = 1
	else
		self.IncrementalThr = self.seats[1]:GetDriver():GetInfoNum("hvap_cl_air_incthr", 0)
		self.AutoLevel = self.seats[1]:GetDriver():GetInfoNum("hvap_cl_air_autolevel", 1)		
		self.ThrSensitivity = self.seats[1]:GetDriver():GetInfoNum("hvap_cl_air_throttle_sensitivity", 5)
	end
	self:GetSwitcher():updateSeats()
end

function ENT:StopAllSounds()
	for k, s in pairs(self.sounds) do
		s:Stop()
	end
end

function ENT:RocketAlert()
	if self.active and !self.disabled and !self.Unbreakable then
		local b=false
		local rockets = ents.FindByClass("hvap_bullet_rocket2")
		for _, e in pairs(rockets) do
			if  e:GetPos():Distance(self:GetPos()) < 7680 and e.target == self then b = true break end
		end
		if self.sounds.MissileAlert:IsPlaying() then
			if !b then
				self.sounds.MissileAlert:Stop()
				self.Targeted = false
			end
		elseif b then
			self.sounds.MissileAlert:Play()
			self.Targeted = true
		end
	end
end

function ENT:setVar(name, var)
	if self:GetNWFloat(name) != var then
		self:SetNWFloat(name, var)
	end
end

function ENT:SpawnFunction( ply, tr, ClassName )

	if ( !tr.Hit ) then return end

	local SpawnPos = tr.HitPos + tr.HitNormal * self.SpawnHeight
	local SpawnAng = ply:EyeAngles()
	SpawnAng.p = 0
	SpawnAng.y = SpawnAng.y + 180

	local ent = ents.Create( ClassName )
	ent:SetCreator( ply )
	ent:SetPos( SpawnPos )
	ent:SetAngles( SpawnAng )
	ent:Spawn()
	ent:Activate()
	ent.Owner=ply

	return ent

end

function ENT:calcAerodynamics(ph)
	local dvel = self:GetVelocity():Length()
	local lvel = self:WorldToLocal(self:GetPos() + self:GetVelocity())
	local targetVelocity = (
		- self:LocalToWorld(self.Aerodynamics.Rail * lvel * dvel * dvel / 1000000000) + self:GetPos()
		+ self:LocalToWorld(
			self.Aerodynamics.Movement.Forwards * lvel.x * dvel / 10000000 +
			self.Aerodynamics.Movement.Right * Vector(math.abs(lvel.y),lvel.y,lvel.y) * dvel / 10000000 +
			self.Aerodynamics.Movement.Up * lvel.z * dvel / 10000000
		) - self:GetPos()
	)

	local targetAngVel =
		(
			lvel.x*self.Aerodynamics.Rotation.Forwards +
			lvel.y*self.Aerodynamics.Rotation.Right +
			lvel.z*self.Aerodynamics.Rotation.Up
		) / 10000 - ph:GetAngleVelocity()*self.Aerodynamics.AngleDrag

	return targetVelocity, targetAngVel
end

function ENT:Think()
	local crt = CurTime()
	local frt = FrameTime()
------------------------------------------------------------------------------------------------coop brings all engines to one rotor, separate brings engine to rotor
	local rpm = 0
	local power = 0
	local rotrpm = 0
	local rotcap = 0
	local ehealth = 0
	local vel = self.phys:GetVelocity()	
	local pos = self:GetPos()
	local ang = self:GetAngles()

	if self.skin != self:GetSkin() then
		self.skin = self:GetSkin()
		self:updateSkin(self.skin)
	end	
	
	if self.CoopEngines then -----coop calc engines to rotors
		for i = 1, self.NumEngines do 
			rpm = rpm + self.engines[i].RPMSCL
			power = power + self.engines[i].enginePower
		end
		self.EnginesRPM = rpm/self.NumEngines
		self.EnginePower = power
		if !self.rotors[1].Disabled then
			self.rotors[1].EngRpm = self.EnginesRPM
			self.rotorRpm = self.rotors[1].rotorRPM
		else
			self.rotorRpm = 0
		end
	else ------separate calc engine to rotor assuming 1 engine per rotor
		for i = 1, self.NumEngines do 
			rpm = rpm + self.engines[i].RPMSCL
			power = power + self.engines[i].enginePower
		end
		self.EnginesRPM = rpm/self.NumEngines
		self.EnginePower = power
		for i = 1, self.NumEngines do
			if !self.rotors[i].Disabled then
				self.rotors[i].EngRpm = self.engines[i].RPMSCL
			end
		end
		for i = 1, self.NumEngines do 
			if !self.rotors[i].Disabled then
				rotrpm = rotrpm + self.rotors[i].rotorRPM
			end
		end
		self.rotorRpm = rotrpm/self.NumRotors
	end 
------------------------------------------------------------------------------------------------throttle calc	
	self.Hover = self:calcHover(self.phys,pos,vel,ang)
	self.Autolvl = self:autoLevelCalc(self.phys,pos,vel,ang)

	self.Roll = self.Hover.r+self.Autolvl.r	
	self.Pitch = self.Hover.p+self.Autolvl.p
	self.Yaw = 0
	local thr = math.Clamp(self.Hover.t+self.Autolvl.t, -1, 1)
	
	if self.IncrementalThr == 1 then
		self.Throttle = math.Clamp(self.Throttle+(self.controls.throttle*self.ThrSensitivity/256)+thr, -1, 1)
	elseif self.IncrementalThr == 0 then
		self.Throttle = math.Clamp(self.controls.throttle+thr, -1, 1)
	end
------------------------------------------------------------------------------------------------fuelcalc
	if hvap.aircraft.cvars.fuelenable:GetInt() == 1 then
		local mul = (hvap.aircraft.cvars.fuelconsumptionmult:GetFloat()*self.FuelConMult*frt)/25
		local subval = 0
		for k, v in pairs(self.engines) do 
			subval = (subval + v.FuelSub)
		end		
		if subval < math.huge then 
			self.Fuel = math.Clamp(self.Fuel - (subval + (self.active and math.abs(self.Throttle) or 0) + (1-self.FSCL))*mul, 0, self.BaseFuel)
		end
		self.FuelScl = self.Fuel/self.BaseFuel
		
		if self.FuelScl <= 0.05 then
			if math.random(0,100) < 2 then
				self.active = false
			end
		elseif self.FuselScl == 0 then
			self.active = false
		end
	end
------------------------------------------------------------------------------------------------engine health calc	
	for i = 1, self.NumEngines do 
		ehealth = ehealth + self.engines[i].engineHealth
	end
	self.EnginesHealth = ehealth/self.EnginesMaxHealth
------------------------------------------------------------------------------------------------	
	if self.nextUpdate<crt then
		self:RocketAlert()
		self.nextUpdate = crt+0.2
	end
------------------------------------------------------------------------------------------------
	if !self.dead and self.FSCL == 0 then	
		if hvap.aircraft.cvars.kickdeath:GetInt() == 1 then
			for i = 1, #self.seats do
				if self.passengers[i]:IsValid()	then
					self:Bail(self.passengers[i])
				end
			end
		end	
		local effectdata = EffectData()
			effectdata:SetOrigin(self.Entity:GetPos())
			effectdata:SetScale((self.FuselageBaseHealth/self.FuselageHPMult)/42)
		util.Effect("hvap_explode", effectdata)
		util.BlastDamage(self.Entity, self.Entity, self:GetPos(), (self.FuselageBaseHealth/self.FuselageHPMult)*2, (self.FuselageBaseHealth/self.FuselageHPMult)/4)
		self.dead = true
		self.active = false
	end	
	if self.CriticalDeath then
		local effectdata = EffectData()
			effectdata:SetOrigin(self.Entity:GetPos())
			effectdata:SetScale(self.FuselageBaseHealth/28)
		util.Effect("hvap_explode", effectdata)
		util.BlastDamage(self.Entity, self.Entity, self:GetPos(), (self.FuselageBaseHealth/self.FuselageHPMult)*4, (self.FuselageBaseHealth/self.FuselageHPMult))
	----------------------------make gibs
		self:Remove()
	end
------------------------------------------------------------------------------------------------
	self:updateSeats()	
	self:attachmentThink()
	self:setVar("Targeted", self.Targeted)
	self:setVar("rotorRpm", self.rotorRpm)
	self:setVar("engineRpm", self.EnginesRPM)
	self:setVar("up", self.Throttle)
	self:setVar("fuel", self.FuelScl)
	self:setVar("ehp", self.EnginesHealth)
	self:setVar("fhp", self.FSCL)	
	self:NextThink(crt)
	return true
end

function ENT:receiveInput(name, value, seat)--CONTROLS
	if seat == 1 then
		if name == "Start" and value>0.5 then
			self:setEngine(!self.active)
		elseif name == "Throttle" then
			self.controls.throttle = value or 0
		elseif name == "Pitch" then
			self.controls.pitch = value
		elseif name == "Yaw" then
			self.controls.yaw = value
		elseif name == "Roll" then
			self.controls.roll = value
		elseif name == "Hover" and value>0.5 then
			self:SetHover(!self:GetHover())
		elseif name == "FreeView" then
			self.passengers[seat].hvap.mouseInput = (value < 0.5)
		elseif name == "CounterMeasure" then
			self:fireCounter(value > 0.5)
		elseif name == "Function" and value>0.5 and self.HasDoors then 
			self:Doors(!self.DoorOpen)
		elseif name == "Function2" and value>0.5 then 
			--stuff 
		elseif name == "Gear" and value>0.5 and self.HasGear then
			self:LandingGear(!self.GearDown) 
		end
	end
	
	if name == "Exit" and value>0.5 and self.passengers[seat].hvap.lastEnter<CurTime()-0.5 then
		self:EjectPassenger(self.passengers[seat])
	elseif name == "Bail" and value>0.5 and self.passengers[seat].hvap.lastEnter<CurTime()-0.5 then
		self:Bail(self.passengers[seat])
	elseif name == "FirstFire" then
		self:fireWeapon1(value > 0.5, seat)
	elseif name == "SecondFire" then
		self:fireWeapon2(value > 0.5, seat)
	elseif name == "NextWeapon" and value > 0.5 then
		self:nextWeapon(seat, self.passengers[seat])
	end
end

function ENT:GetSeat(player)
	for i, p in pairs(self.passengers) do
		if p == player then
			return self.seats[i]
		end
	end
end

function ENT:setEngine(b)
	if self.disabled or self.FuelScl == 0 then b = false end
	if b then
		if self.active then return end
		self.active = true
	elseif self.active then
		self.active=false
	end
	self:SetNWBool("active", self.active)
end

function ENT:calcHover(ph,pos,vel,ang)
	if self:GetHover() and !self.spinout and !self.disabled then
		local v=self:WorldToLocal(pos+vel)
		local av=ph:GetAngleVelocity()

		if math.abs(self.controls.pitch) >= 0.1 then 
			pitch = 0
		else
			pitch = math.Clamp(-ang.p*0.64-av.y*0.64-v.x*0.064,-06465,0.64)
		end
		if math.abs(self.controls.roll) >= 0.1 then 
			roll = 0
		else
			roll = math.Clamp(-ang.r*0.64-av.x*0.64+v.y*0.064,-0.64,0.64)
		end
		if math.abs(self.controls.throttle) >= 0.1 then 
			throttle = 0
		else 
			throttle =  math.Clamp(-v.z*0.128+av:Length()*0.064, -0.1, 1)
		end			
		
		return{p=pitch,r=roll,t=throttle}
	else
		return {p=0,r=0,t=0}
	end
end

function ENT:autoLevelCalc(ph,pos,vel,ang)
	if self.AutoLevel == 1 and !self:GetHover() and !self.spinout and !self.disabled then 
		local v=self:WorldToLocal(pos+vel)
		local av=ph:GetAngleVelocity()
	
		if math.abs(self.controls.pitch) >= 0.1 then 
			pitch = 0
		else
			pitch = math.Clamp(-ang.p*0.128-av.y-v.x*0.005, -0.128, 0.128)
		end
		if math.abs(self.controls.roll) >= 0.1 then 
			roll = 0
		else
			roll = math.Clamp(-ang.r*0.128-av.x+v.y*0.015, -0.128, 0.128)	
		end
		if math.abs(self.controls.throttle) >= 0.1 then 
			throttle = 0
		else 
			throttle =  math.Clamp(-v.z*0.128+av:Length()*0.032, -1, 1)
		end	
		
		return{p=pitch,r=roll,t=throttle}
	else 
		return {p=0,r=0,t=0}
	end
end

function ENT:PhysicsUpdate(ph)
	local vel = ph:GetVelocity()	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local lvel = self:WorldToLocal(pos+vel)
	local up = self:GetUp()
	local phm = FrameTime()*66
	local spinout = Vector(0,0,0)
	local spinoutv = Vector(0,0,0)
	
	local rotateX = math.Clamp((self.controls.roll	+self.Roll	)*self.rotorRpm, -2.56,2.56)
	local rotateY = math.Clamp((self.controls.pitch	+self.Pitch	)*self.rotorRpm, -2.56,2.56)
	local rotateZ = math.Clamp((self.controls.yaw	+self.Yaw	)*self.rotorRpm, -2.56,2.56)

	local throttle = self:GetUp()*((self.Throttle*(self.rotorRpm+0.01))*((self.EnginePower+0.01)/256)+self.rotorRpm*(10+self.controls.throttle*2))
	local brakez = self:LocalToWorld(Vector(0, 0, lvel.z*vel:Length()*self.rotorRpm/100000*self.Aerodynamics.RailRotor)) - pos
	
	if self.CoopEngines then
		if self.rotors[1].Disabled and !self.disabled and self.active or self.RearRotor.Disabled and !self.disabled and self.active then
			spinout = Vector(math.Rand(-4,4)*self.rotorRpm,math.Rand(-4,4)*self.rotorRpm,math.random(4,12)*self.rotorRpm)
			spinoutv = Vector(math.random(-6,6),math.random(-6,6),-1*(math.random(2,4)*up:Length()))
			self.spinout = true
		end
	else 
		for i = 1, self.NumRotors do
			if self.rotors[i].Disabled and self.active and !self.disabled and self.active or self.engines[i].engineRpm == 0 and self.active and !self.disabled and self.active then
				spinout = Vector(math.Rand(-4,4)*self.rotorRpm,math.Rand(-4,4)*self.rotorRpm,math.random(4,12)*self.rotorRpm)
				spinoutv = Vector(math.random(-6,6),math.random(-6,6),-1*(math.random(2,4)*up:Length()))
				self.spinout = true
			end
		end
	end
	
	local controlAng = (Vector(rotateX, rotateY, rotateZ)*1.6+spinout)*self.Aerodynamics.Rotate
	local aeroVelocity, aeroAng = self:calcAerodynamics(ph)		
	ph:AddVelocity(((throttle-brakez)+aeroVelocity+spinoutv)*phm)
	ph:AddAngleVelocity((aeroAng + controlAng)*phm)
end

function ENT:Rearm()
	if self.Weapons2 then
		for k, v in pairs(self.weapons2) do
			if v:GetAmmo() != v.Ammo then
				v:SetAmmo(v.Ammo)
			end
		end
	end
	if self.Weapons then
		for k, v in pairs(self.weapons) do
			if v:GetAmmo() != v.Ammo then
				v:SetAmmo(v.Ammo)
			end
		end
	end
end

function ENT:Refuel(amt)
	if self.Fuel != self.BaseFuel then
		self.Fuel = math.Clamp( self.Fuel+amt, 0,self.BaseFuel)
	end
end

function ENT:Repair(amt)
	for k, v in pairs(self.rotors) do
		if amt == 1 then
			v:ResetRot()
		else 
			v:Repair(amt)
		end
	end
	for k, v in pairs(self.engines) do
		if v:IsValid() then
			v:Repair(amt)
		end
	end
	if self.FuselageHealth < self.FuselageBaseHealth then
		self.FuselageHealth = math.Clamp(self.FuselageHealth + self.FuselageBaseHealth/amt, self.FuselageBaseHealth/amt, self.FuselageBaseHealth )
	end
	if self.disabled then
		self.disabled = false
	end
	if self.dead then
		self.dead = false
	end
end
	
function ENT:PhysicsCollide(cdat, phys)
	if cdat.DeltaTime > 0.5 then
		local mass = cdat.HitObject:GetMass()
		if cdat.HitEntity:GetClass() == "worldspawn" then
			mass = 3200
		end
		local dmg = (math.pow(cdat.Speed, 2)*math.Clamp(mass, 0, 5000))/10000000
		
		if !dmg or dmg <= 32 then return end	
		
		local lasta=(self.LastDamageTaken<CurTime()+6 and self.LastAttacker or self.Entity)
		for k, p in pairs(self.passengers) do
			if p and p:IsValid() then
				p:TakeDamage(dmg/16, lasta, self.Entity)
			end
		end			
		for i = 1, self.NumEngines do
			self.engines[i]:DamageEngine(dmg)
		end	
		self:DamageFuselage(dmg, lasta)
		sound.Play( "HVAP.Vehicle.Collide", self:GetPos() )			
	end
end

function ENT:OnTakeDamage(dmg)
	if self.Unbreakable then return end
	local crt = CurTime()	
	self.LastAttacker=dmg:GetAttacker()
	self.LastDamageTaken=crt
	
	if dmg:IsExplosionDamage() then
		dmg:ScaleDamage(0.8)
	else
		dmg:ScaleDamage(0.095)	
	end
	
	local pos=self:WorldToLocal(dmg:GetDamagePosition())
	local dmgVal = dmg:GetDamage()
	local driver = self:getPassenger()
	local lasta=(self.LastDamageTaken<crt+6 and self.LastAttacker or self.Entity)	
-------------------------engine damage
	for i = 1, self.NumEngines do
		local dist = math.Clamp(pos:Distance(self.Engines[i].pos)-self.Engines[i].radius, 1, 10240)
		local edmg = math.Clamp(dmgVal/dist,1,200)
		self.engines[i]:DamageEngine(edmg/2.5)
	end
-------------------------rear rotor damage
	for k, v in pairs(self.rotors) do
		if v:IsValid() then
			local dist = pos:Distance(self.Rotors[k].pos)
			if dist < 42 then
				local rdmg = math.Clamp((dmgVal/dist),1,24)
				v:DamageRotor(rdmg/3.2)
			end
		end
	end
-------------------------pilot snipe calc
	if hvap.aircraft.cvars.noplayerdamage:GetInt() != 1 then
		for k, p in pairs(self.passengers) do
			local dist = pos:Distance(self.Seats[k].pos)
			if p and p:IsValid() and dist<=(self.PlyDmgDist*1.92) then
				local pdmg = (dmgVal/dist)*self.PlyDmgMult
				p:TakeDamage(pdmg, lasta, self.Entity)
			end
		end
	end
	self:DamageFuselage(dmgVal, lasta)
end

function ENT:DamageFuselage(dmg, lasta)
	if self.Unbreakable then return end
	local crt = CurTime()

	self.FSCL =  math.Clamp(self.FuselageHealth/self.FuselageBaseHealth,0,1)	
	self.FuselageHealth = math.Clamp(self.FuselageHealth - dmg, 0, self.FuselageBaseHealth)	
	
	if !self.disabled then
		if dmg > 8 then			
			if self.FSCL > 0.60 and self.LastDamageTaken>crt+1.28 then
				sound.Play( self.sounds.Damaged, self:GetPos() )
			elseif self.FSCL > 0.40 and self.LastDamageTaken>crt+1.4 then
				sound.Play( self.sounds.Alarm75, self:GetPos() )	
			elseif self.FSCL > 0.20 and self.LastDamageTaken>crt+1.5 then
				sound.Play( self.sounds.Alarm50, self:GetPos() )		
			elseif self.FSCL > 0.20 and self.LastDamageTaken>crt+1.6 then
				sound.Play( self.sounds.Alarm25, self:GetPos() )
			end
		end 
		if self.FuselageHealth == 0 then	
			for i = 1, self.NumEngines do
				self.engines[i]:DamageEngine(10000)
			end	
			self.disabled = true
		end	
	elseif self.dead and !self.CriticalDeath then
		self.CriticalHealth = math.Clamp( self.CriticalHealth - dmg, 0, self.CriticalBaseHealth )
		if self.CriticalHealth == 0 then
			self.CriticalDeath = true
		end
	end
end

function ENT:AddOnRemove(f)
	if type(f)=="function" then
		table.insert(self.OnRemoveFunctions,f)
	elseif type(f)=="Entity" or type(f)=="Vehicle" then
		table.insert(self.OnRemoveEntities,f)
	end
end

function ENT:OnRemove()
	self:StopAllSounds()
	for _,p in pairs(self.passengers) do
		if IsValid(p) then
			p:SetNWInt("hvap_passenger_id",0)
		end
	end
	for _,f in pairs(self.OnRemoveFunctions) do
		f()
	end
	for _,e in pairs(self.OnRemoveEntities) do
		if IsValid(e) then e:Remove() end
	end
	for _,e in pairs(self.Children) do
		if IsValid(e) then e:Remove() end
	end
end