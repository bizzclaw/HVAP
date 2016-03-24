
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
		self.phys:Wake()
	end		
	
	local skins = self:SkinCount()	
	if skins != 1 then
		skin = math.random(skins)
		self:SetSkin(skin)
	end		
	
	self.entities = {}
		
	self.OnRemoveEntities={}
	self.OnRemoveFunctions={}
	
	self.StartSpd = hvap.aircraft.cvars.startSpeed:GetFloat()
	
	self.NumEngines = #self.Engines
	
	self.nextUpdate = 0
	self.LastDamageTaken = 0
	self.hvap_seatswitch = true
	self.EnginesRPM = 0
	self.EngineTorque = 0
	self.LastPhys = 0
	
	self.FuselageBaseHealth = self.FuselageHealth
	self.EnginesMaxHealth = 0
	
	
	self.BaseFuel = self.Fuel
	
	self.passengers = {}
	
	self.controls = {
		throttle = 0,
		pitch = 0,
		yaw = 0,
		roll = 0,
		brake = 0,
	}
	
	self.braking = false

	self.disabled = false
	self.dead = false
	
	self.IsHVAP = true
	self.AllowAmmo = true
	self.AllowFuel = true

	self.Driver = false
	
	self.Throttle = 0
	self.Boost = false

	self:addEngines()
	self:addSounds()
	self:addWheels()

	self:addWeapons()
	self:addCountermeasures()
--	self:addTurrets()

	self:addSeats()
	self:addNpcTargets()
	self.phys:EnableDrag(false)
	self:addAttachments()	
	
end

function ENT:addEntity(name)
	local e = ents.Create(name)
	if not IsValid(e) then return nil end
	table.insert(self.entities, e)
	e.Owner = self.Owner
	e:SetNWString("Owner", "World")
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
			local eng = self:addEntity("hvap_engine_g")
			eng:SetPos(self:LocalToWorld(v.pos))
			eng:SetAngles(self:GetAngles())
			eng:SetParent(self)
			eng:SetOwner(self.Owner)
			for index, value in pairs(v.info) do
				eng[index] = value
			end
			eng.vehicle = self				
			eng:Spawn()
			eng:Activate()
			eng:SetNoDraw(true)
			self.engines[k] = eng
			self:AddOnRemove(eng)
		end
	end
	for i = 1, self.NumEngines do
		self.EnginesMaxHealth = self.EnginesMaxHealth+self.engines[i].BaseHealth
	end
end

function ENT:addWheels()
	self.steer = {}
	self.torque = {}
	self.track = {}
	self.wheels = {}
	for k,v in pairs(self.Wheels) do
		if k != "BaseClass" then
			local e=self:addEntity("hvap_wheel")
			e:SetModel(v.mdl)
			e:SetPos(self:LocalToWorld(v.pos))
			e:SetAngles(self:GetAngles()+v.ang)
			e:SetOwner(self.Owner)
			for index, value in pairs(v) do
				e[index] = value
			end
			e.vehicle = self
			e:Spawn()
			e:Activate()
			local ph=e:GetPhysicsObject()
			ph:SetMass(v.mass)
			ph:EnableDrag(false)
			ph:SetAngleDragCoefficient(0)
			e:SetGravity(1)
			ph:SetMaterial( "rubbertire" )
			
			if v.steer then
				self.steer[k] = e
				constraint.AdvBallsocket( e, self, 0, 0, -v.correction, v.pos, 0, 0, 0, -360, -v.maxsteerang, 0, 360, v.maxsteerang, 0, 0.128, 0.128, 0, 1 )
			end
			if v.torque then
				self.torque[k] = e
			end
			if v.tank then
				self.track[k] = e
			end
			
			if v.torque and !v.steer or v.tank and !v.steer then
				constraint.Axis( e, self, 0, 0, Vector(0,0,0), v.pos, 0, 0, v.friction, 1, Vector(0,1,0))
			end
			
			self.wheels[k] = e
			self:AddOnRemove(e)
--							constraint.Axis( e, self, 0, 0, Vector(0,0,0), v.pos, 0, 0, v.friction, 1, Vector(0,1,0))
--			constraint.AdvBallsocket( e, self, 0, 0, Vector(0,0,0), v.pos, 0, 0, 0, -361, -361, 0, 361, 361, 4, 4, 4, 0, 1 )
--			constraint.Axis(e,self,0,0,v.pos, Vector(0,1,0),0,0,v.friction,1)
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
			pod.entTable = self.OnRemoveEntities
			pod:Spawn()
			pod:Activate()
			pod:SetNoDraw(true)
			pod.podIndex = i
			self.weapons[i] = pod
			self:AddOnRemove(pod)
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
			pod2.entTable = self.OnRemoveEntities
			pod2:Spawn()
			pod2:Activate()
			pod2:SetNoDraw(true)
			pod2.podIndex = i
			self.weapons2[i] = pod2
			self:AddOnRemove(pod2)
		end
	end
end

function ENT:addSeats()
	self.seats = {}
	local e = self:addEntity("hvap_seat_connector")
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
			self.seats[k] = self:addEntity("prop_vehicle_prisoner_pod")
			self.seats[k].activeProfile = 1
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
			t:SetOwner(self.Owner)
			t:SetParent(self)
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
		t:SetOwner(self.Owner)
		t:SetParent(self)
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
function ENT:LandingGear()
	if !self.GearUpAnim and !self.GearDownAnim then return end	
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

	self:EmitSound( "hvap/gun/misc/weapon_switch3.wav" )	

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
	
	if self.Camera.rotseat then
		local e = self.seats[self.Camera.seat]
		e:SetAngles(Angle(0,camAng.y-90,0))
--		e:SetPos(self.camera:LocalToWorld(self.camera:GetPos()+self.camera:GetAngles():Forward()*e.pos))
	end	
	
	local tr = util.QuickTrace(self:LocalToWorld(self.Camera.pos)+camAng:Forward()*20, camAng:Forward()*999999999, self)
	for k, t in pairs(self.weaponAttachments) do
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
	ply:SetVelocity(self:GetPhysicsObject():GetVelocity()*1.2)
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
	ply:SetPos(self:LocalToWorld(self.Seats[idx].exit*2))
	ply:SetVelocity(self:GetPhysicsObject():GetVelocity()*-1)
	ply:SetEyeAngles((self:LocalToWorld(self.Seats[idx].pos-Vector(0,0,40))-ply:GetPos()):Angle())
	self:updateSeats()
end

function ENT:Use(act, cal)
	if self.disabled then return end
	if act.hvap and act.hvap.lastEnter and act.hvap.lastEnter+0.5 > CurTime() then return end
	local d = self.MaxEnterDistance
	local v
	for k, veh in pairs(self.seats) do
		if veh and veh:IsValid() then
			local psngr = veh:GetPassenger(0)
			if !psngr or !psngr:IsValid() then
				local dist = veh:GetPos():Distance(util.QuickTrace(act:GetShootPos(),act:GetAimVector()*self.MaxEnterDistance,act).HitPos)
				if dist < d then
					d = dist
					v = veh
				end
			end
		end
	end
	act.hvap = act.hvap or {}
	act.hvap.lastEnter = CurTime()
	if v then
		act:EnterVehicle(v)
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
		self.controls.brake = 0
		self.IncrementalThr = 0
		self.ThrSensitivity = 0
		self.Driver = false
	else
		self.Driver = true
		self.IncrementalThr = self.seats[1]:GetDriver():GetInfoNum("hvap_cl_air_incthr", 0)	
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
--[[if self.rotorRpm > 0.1 then
		local b=false
		local rockets = ents.FindByClass("rpg_missile")
		table.Merge(rockets, ents.FindByClass("hvap_bullet_rocket*"))
		for _, e in pairs(rockets) do
			if !e:GetPos():Distance(self:GetPos()) > 100 and e:GetPos():Distance(self:GetPos()) < 3200 then b = true break end
		end
		if self.sounds.MissileAlert:IsPlaying() then
			if !b then
				self.sounds.MissileAlert:Stop()
			end
		elseif b then
			self.sounds.MissileAlert:Play()
		end
	end]]
end

function ENT:setVar(name, var)
	if self:GetNWFloat(name) != var then
		self:SetNWFloat(name, var)
	end
end

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end	
	local ent=ents.Create(ClassName)
	local ang = ply:EyeAngles()	
	
	ent:SetPos(tr.HitPos+tr.HitNormal*self.SpawnHeight)
--	ent:SetAngles(Angle(tr.HitPos:GetNormal().x,(ply:EyeAngles().y+180),tr.HitPos:GetNormal().z))

	ent:Spawn()
	ent:Activate()
	ent.Owner=ply
	return ent
end

function ENT:calcPhys(ph)
	local dvel = self:GetVelocity()
	local lvel = self:WorldToLocal(self:GetPos() + self:GetVelocity())
	local PhysVel = (-
				self:LocalToWorld(self.Aerodynamics.Rail*lvel*dvel*dvel/1000000000)+self:GetPos()+
				self:LocalToWorld(
						self.Aerodynamics.Movement.Forwards*lvel.x/1000+
						self.Aerodynamics.Movement.Right*lvel.y/1000+
						self.Aerodynamics.Movement.Up*lvel.z/1000
					)-
				self:GetPos()
		)
	local PhysAng = (
			lvel.x*self.Aerodynamics.Rotation.Forwards +
			lvel.y*self.Aerodynamics.Rotation.Right +
			lvel.z*self.Aerodynamics.Rotation.Up
		)/10000-ph:GetAngleVelocity()*self.Aerodynamics.AngleDrag

	return PhysVel, PhysAng
end

function ENT:Think()
	local crt = CurTime()
	local fscl =  (self.FuselageHealth/self.FuselageBaseHealth)	
------------------------------------------------------------------------------------------------coop brings all engines to one rotor, separate brings engine to rotor
	local rpm = 0
	local rpmcap = 0
	local Torque = 0
	local rotrpm = 0
	local rotcap = 0

	if self.skin != self:GetSkin() then
		self.skin = self:GetSkin()
		self:updateSkin(self.skin)
	end	
	
	for i = 1, self.NumEngines do 
		rpm = rpm + self.engines[i].engineRpm
		rpmcap = rpmcap + self.engines[i].MaxRPM
		Torque = Torque + self.engines[i].engineTorque
	end
	self.EnginesRPM = rpm/rpmcap
	self.EngineTorque = Torque

	self.Throttle = self.controls.throttle
------------------------------------------------------------------------------------------------fuelcalc
	if hvap.aircraft.cvars.fuelenable:GetInt() == 1 and self.active and !self.disabled then
		local subval = 0
		for k, v in pairs(self.engines) do 
			subval = (subval + v.FuelSub)
		end		
		if subval < math.huge then 
			self.Fuel = math.Clamp(self.Fuel - (subval*self.FuelConMult+math.abs(self.Throttle)+(1-fscl)*2.56)*hvap.aircraft.cvars.fuelconsumptionmult:GetFloat()/256, 0, self.BaseFuel)
		end
		self.FuelScl = self.Fuel/self.BaseFuel
		if self.FuelScl < .25 then 
			-- do low fuel
		elseif self.FuelScl < .05 then 
			if math.random(0,25) == 15 then
				self.active = false
			end
		elseif self.FuelScl == 0 then 
				self.active = false
		end
	end
------------------------------------------------------------------------------------------------engine health calc	
	local ehealth = 0
	for i = 1, self.NumEngines do 
		ehealth = ehealth + self.engines[i].engineHealth
	end
	self.EnginesHealth = ehealth/self.EnginesMaxHealth
------------------------------------------------------------------------------------------------	

	local vel = self.phys:GetVelocity()	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	
	if self.disabled and !self.dead then	
		local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos())
		effectdata:SetScale(self.FuselageBaseHealth/40)
		util.Effect("hvap_explode", effectdata)
		self.Entity:EmitSound( "hvap/tank/tank_destroyed_0"..math.random(1,3)..".wav", 140, math.random(90,110) )
		util.BlastDamage(self.Entity, self.Entity, self.Entity:GetPos(), self.FuselageBaseHealth, self.FuselageBaseHealth/2)

		if hvap.aircraft.cvars.kickdeath:GetInt() == 1 then
			for i = 1, #self.seats do
				if self.passengers[i]:IsValid()	then
					self:EjectPassenger(self.passengers[i])
				end
			end
		end
		
		if hvap.aircraft.cvars.removetime:GetFloat() > 0 then
			timer.Simple(hvap.aircraft.cvars.removetime:GetFloat()+10, function() if IsValid(self) then self:Remove() end end)
		end	
		self.dead = true
		self.active = false
	end
------------------------------------------------------------------------------------------------
	if self.controls.brake == 1 or !self.Driver then
		self:Brake()
	else
		self:RemoveBrake()
	end
------------------------------------------------------------------------------------------------
	self:updateSeats()	
	self:attachmentThink()
	self:setVar("engineRpm", self.EnginesRPM)
	self:setVar("up", self.Throttle)
	self:setVar("fuel", self.FuelScl)
	self:setVar("ehp", self.EnginesHealth)
	self:NextThink(crt)
	return true
end

function ENT:Brake()
	if self.braking then return end
	for k, v in pairs (self.wheels) do
		local vang = v:GetAngles()
		local resetang = Angle( vang.p, self:GetAngles().y, vang.r )
		v:SetAngles(resetang)
		constraint.Weld( v, self, 0, 0, 0, true, false )
	end
	self.braking = true
end

function ENT:RemoveBrake()
	if !self.braking then return end
	for k, v in pairs (self.wheels) do
		constraint.RemoveConstraints( v, "Weld" )
	end
	self.braking = false
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
		elseif name == "Hover" then
			self.controls.brake = value
		elseif name == "FreeView" then
			self.passengers[seat].hvap.mouseInput = (value < 0.5)
		elseif name == "CounterMeasure" then
			self:fireCounter(value > 0.5)
		end
	end
	
	if name == "Exit" and value>0.5 and self.passengers[seat].hvap.lastEnter<CurTime()-0.5 then
		self:EjectPassenger(self.passengers[seat])
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

function ENT:PhysicsUpdate(ph)
	if self.LastPhys == CurTime() then return end
	local vel = ph:GetVelocity()	
	local angvel = ph:GetAngleVelocity()
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local up = self:GetUp()
	local fwd = self:GetForward()
	local phm = FrameTime()*66

	if self.wheels then
		if self.steer then --and self.controls.yaw != 0
			for k, v in pairs(self.steer) do
				local phys = v:GetPhysicsObject()
				local wang = v:GetAngles()
				local lang = self:WorldToLocalAngles(wang)
				local av = phys:GetAngleVelocity()
				
				if self.controls.yaw != 0 then
					local turn = math.Clamp( lang.y, -64, 64 )
					phys:AddAngleVelocity( Vector(0,0,turn) )
					
				end	
				
				local straighten = math.Clamp(((lang.y+av.y*6-angvel.y)* -2 * v.side), -64, 64)
--				print(straighten)
				if math.abs(lang.y) > 2 then
					phys:AddAngleVelocity(Vector(0,0,straighten))
				end
			end			
		end
		if self.torque and self.controls.throttle != 0 then
			for k, v in pairs(self.torque) do
				v.Force = self.EnginesRPM*self.controls.throttle
			end		
		end	
	end
	
	local PhysVel, PhysAng = self:calcPhys(ph)
	
	ph:AddVelocity(self.EnginesRPM*self.controls.throttle*self:GetForward()+PhysVel*phm)
	ph:AddAngleVelocity(PhysAng)
	
	self.LastPhys = CurTime()
end
--[###] DAMAGE
function ENT:maintenance()
    if self.disabled then return end
	local repaired = false
	local rearmed = false

	if self.weapons2 then
		for _, w in pairs(self.weapons2) do
			if w:GetAmmo() != w.Ammo then
				w:SetAmmo(math.Approach(w:GetAmmo(), w.Ammo, w.FireRate/60))
				rearmed = true
				else if self.weapons then
					for _, w in pairs(self.weapons) do
					if w:GetAmmo() != w.Ammo then
					w:SetAmmo(math.Approach(w:GetAmmo(), w.Ammo, w.FireRate/60))
					rearmed = true
					end
				end
			end
		end
	end
end
    if rearmed then
        self:EmitSound("items/ammo_pickup.wav", 100, 100)
		self.sounds.Burning:Stop()
    end
    if repaired then
        self:EmitSound("wac/repair_loop.wav", 100, 100)
    end
end

function ENT:Rearm()
	if self.weapons2 then
		for k, v in pairs(self.weapons2) do
			if v:GetAmmo() != v.Ammo then
				v:SetAmmo(v.Ammo)
				self:EmitSound("items/ammo_pickup.wav", 100, 100)
			end
		end
	elseif self.weapons then
		for k, v in pairs(self.weapons) do
			if v:GetAmmo() != v.Ammo then
				v:SetAmmo(v.Ammo)
		        self:EmitSound("items/ammo_pickup.wav", 100, 100)
			end
		end
	else return end
end

function ENT:Refuel(amt)
	if self.Fuel != self.BaseFuel then
		self.Fuel = math.Clamp( self.Fuel+amt, 0,self.BaseFuel)
	end
end
	
function ENT:PhysicsCollide(cdat, phys)
	if cdat.DeltaTime > 0.5 then
		local mass = cdat.HitObject:GetMass()
		if cdat.HitEntity:GetClass() == "worldspawn" then
			mass = 4000
		end
		local dmg = (cdat.Speed*cdat.Speed*math.Clamp(mass, 0, 5000))/10000000
		if !dmg or dmg <= 15 then return end
		self:TakeDamage(dmg*15)
		if dmg >= 15 then		
			local lasta=(self.LastDamageTaken<CurTime()+6 and self.LastAttacker or self.Entity)
			for k, p in pairs(self.passengers) do
				if p and p:IsValid() then
					p:TakeDamage(dmg/12, lasta, self.Entity)
				end
			end			
			for i = 1, self.NumEngines do
				self.engines[i]:DamageEngine(dmg/8)
			end	
			self.Entity:EmitSound("hvap/impact/impact_"..math.random(1,8)..".wav")					
		end
	end
end

function ENT:OnTakeDamage(dmg)
	
	dmg:ScaleDamage(0.1)

	local pos=self:WorldToLocal(dmg:GetDamagePosition())
-------------------------engine damage
	for i = 1, self.NumEngines do
		if dmg:IsExplosionDamage() then
			dmge = dmg:GetDamage()*1.28	
		else
			dmge = dmg:GetDamage()*0.4	
		end
		local edmg = math.Clamp(5.12*(dmge*(self.Engines[i].radius)/pos:Distance(self.Engines[i].pos)),0,300)
		self.engines[i]:DamageEngine(edmg)
	end
-------------------------rear rotor damage
	if self.CoopEngines then

	end
-------------------------param
	self.LastAttacker=dmg:GetAttacker()
	self.LastDamageTaken=CurTime()
	self:TakePhysicsDamage(dmg)

	local driver = self:getPassenger()
	local lasta=(self.LastDamageTaken<CurTime()+6 and self.LastAttacker or self.Entity)
-------------------------pilot snipe calc
	if hvap.aircraft.cvars.noplayerdamage:GetInt() != 1 then
		for k, p in pairs(self.passengers) do
			local dmgdist = dmg:GetDamagePosition():Distance(self:LocalToWorld(self.Seats[k].pos))
			if p and p:IsValid() and dmgdist<(self.PlyDmgDist*2) then
				if dmg:GetDamageType() != DMG_CRUSH and !dmg:IsExplosionDamage() then
					if dmg:IsExplosionDamage() then
						tdmg = dmg:GetDamage()*0.32		
					else
						tdmg = dmg:GetDamage()*0.4	
					end
					local pdmg = (tdmg*(self.PlyDmgDist/dmgdist))
					
					p:TakeDamage(pdmg*self.PlyDmgMult, lasta, self.Entity)
				else
					p:TakeDamage((dmg:GetDamage()/2)*self.PlyDmgMult, lasta, self.Entity)
				end
			end
		end
	end
-----------------------------------------------------------------------------------------------------------------------------fuselage health calc
	if !self.disabled then
	
		self.FuselageHealth = math.Clamp(self.FuselageHealth - dmg:GetDamage()*0.8, 0, self.FuselageBaseHealth)

		if self.FuselageHealth < .9*self.FuselageBaseHealth then

		end

		if self.FuselageHealth < .8*self.FuselageBaseHealth then
			self:EmitSound( "hvap/alarm/minor_alarm.wav" )	
		end
				
		if self.FuselageHealth < .7*self.FuselageBaseHealth then

		end
		
		if self.FuselageHealth < .6*self.FuselageBaseHealth then

		end
				
		if self.FuselageHealth < .5*self.FuselageBaseHealth then
		
		end
				
		if self.FuselageHealth < .4*self.FuselageBaseHealth then
		
		end
		
		if self.FuselageHealth < .3*self.FuselageBaseHealth then
			self:EmitSound( "hvap/alarm/low_health.wav" )	
		end

		if self.FuselageHealth < .2*self.FuselageBaseHealth then
							
		end
			
		if self.FuselageHealth < .1*self.FuselageBaseHealth then
			
		end

		if self.FuselageHealth == 0 then	
			for i = 1, self.NumEngines do
				self.engines[i]:DamageEngine(10000)
			end	
			self.disabled = true
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
end
