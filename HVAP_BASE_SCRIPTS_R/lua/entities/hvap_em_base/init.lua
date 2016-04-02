
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
	
	self.entities = {}

	self.OnRemoveEntities={}
	self.OnRemoveFunctions={}
	self.wheels = {}
	
	self.nextUpdate = 0
	self.LastDamageTaken = 0
	self.hvap_seatswitch = true

	self.LastPhys = 0
	
	self.FuselageBaseHealth = self.FuselageHealth
	
	self.passengers = {}
	
	self.FuselageDead = false
	self.disabled = false

	self.IsHVAP = true
	self.AllowAmmo = true
	self.AllowFuel = false
	self.AllowRepair = true
	
	self:addSounds()
	self:addWheels()

	self:addWeapons()
	self:addCountermeasures()

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
				a.y = a.y
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
			t:SetAngles(self:GetAngles()+v.ang)
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
		t:SetAngles(self:GetAngles()+v.ang)
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
		
		self.camera = t
		self:AddOnRemove(t)
		self:SetNWEntity("hvap_camera", t)
		table.insert(self.weaponAttachments, t)
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

end
--landing gear
function ENT:LandingGear()

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

	------------------------------------------------------------------

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
	end	
	
	local tr = util.QuickTrace(self:LocalToWorld(self.Camera.pos)+camAng:Forward()*20, camAng:Forward()*999999999, self)
	for k, t in pairs(self.weaponAttachments) do
		if !t:IsValid() then return end
		local localAng = self:WorldToLocalAngles((tr.HitPos - t:GetPos()):Angle())
		localAng = Angle(t.restrictPitch and 0 or localAng.p, t.restrictYaw and 0 or localAng.y, t.r or 0)
		t:SetAngles(self:LocalToWorldAngles(localAng+t.ang))
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
	self:GetSwitcher():updateSeats()
end

function ENT:StopAllSounds()
	for k, s in pairs(self.sounds) do
		s:Stop()
	end
end

function ENT:RocketAlert()
	if self.active and !self.disabled then
		local b=false
		local rockets = ents.FindByClass("hvap_bullet_rocket2")
		for _, e in pairs(rockets) do
			if  e:GetPos():Distance(self:GetPos()) < 10240 and e.target == self then b = true break end
		end
		if self.sounds.MissileAlert:IsPlaying() then
			if !b then
				self.sounds.MissileAlert:Stop()
			end
		elseif b then
			self.sounds.MissileAlert:Play()
		end
	end
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
	ent:SetAngles(Angle(tr.HitPos:GetNormal().x,(ply:EyeAngles().y+180),tr.HitPos:GetNormal().z))

	ent:Spawn()
	ent:Activate()
	ent.Owner=ply
	return ent
end

function ENT:Think()
	local crt = CurTime()
	local fscl =  (self.FuselageHealth/self.FuselageBaseHealth)	
	
	if self.skin != self:GetSkin() then
		self.skin = self:GetSkin()
		self:updateSkin(self.skin)
	end	

	if self.FuselageDead and !self.disabled then
	
		if hvap.aircraft.cvars.removetime:GetFloat() > 0 then
			timer.Simple(hvap.aircraft.cvars.removetime:GetFloat()+10, function() if IsValid(self) then self:Remove() end end)
		end
		
		for i = 1, #self.seats do
			if self.passengers[i]:IsValid()	then
				self:EjectPassenger(self.passengers[i])
			end
		end
		
		local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos())
		effectdata:SetScale(self.FuselageBaseHealth/48)
		util.Effect("hvap_explode", effectdata)
		self.Entity:EmitSound( "hvap/tank/tank_destroyed_0"..math.random(1,3)..".wav", 140, math.random(90,110) )
		util.BlastDamage(self.Entity, self.Entity, self.Entity:GetPos(), self.FuselageBaseHealth+128, 128+self.FuselageBaseHealth)	
		self.disabled = true
		self.FuselageDead = true		
		
	end
------------------------------------------------------------------------------------------------
	self:updateSeats()	
	self:attachmentThink()
	self:NextThink(crt)
	return true
end

function ENT:receiveInput(name, value, seat)--CONTROLS
	if name == "Exit" and value>0.5 and self.passengers[seat].hvap.lastEnter<CurTime()-0.5 then
		self:EjectPassenger(self.passengers[seat])
	elseif name == "FirstFire" then
		self:fireWeapon1(value > 0.5, seat)
	elseif name == "SecondFire" then
		self:fireWeapon2(value > 0.5, seat)
	elseif name == "NextWeapon" and value > 0.5 then
		self:nextWeapon(seat, self.passengers[seat])
	elseif name == "CounterMeasure" then
		self:fireCounter(value > 0.5)
	end
end

function ENT:GetSeat(player)
	for i, p in pairs(self.passengers) do
		if p == player then
			return self.seats[i]
		end
	end
end

function ENT:PhysicsUpdate(ph)

end

function ENT:Rearm()
	if self.Weapons2 then
		for k, v in pairs(self.weapons2) do
			if v:GetAmmo() != v.Ammo then
				v:SetAmmo(v.Ammo)
				self:EmitSound("items/ammo_pickup.wav", 100, 100)
			end
		end
	end
	if self.Weapons then
		for k, v in pairs(self.weapons) do
			if v:GetAmmo() != v.Ammo then
				v:SetAmmo(v.Ammo)
		        self:EmitSound("items/ammo_pickup.wav", 100, 100)
			end
		end
	end
end

function ENT:Refuel(amt)

end

function ENT:Repair(amt)
	if self.FuselageHealth < self.FuselageBaseHealth then
		self.FuselageHealth = math.Clamp(self.FuselageHealth + self.FuselageBaseHealth/amt, 0, self.FuselageBaseHealth )
		self:EmitSound("hvap/repair_loop.wav", 100, 100+amt*10)
	end
	self.disabled = false
	if hvap.aircraft.cvars.removetime:GetFloat() > 0 then
		timer.Remove( "DeleteTimer" )
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
			self.Entity:EmitSound("hvap/impact/impact_"..math.random(1,8)..".wav")					
		end
	end
end
--[###] Damage
function ENT:OnTakeDamage(dmg)

	dmg:ScaleDamage(0.1)

	local pos=self:WorldToLocal(dmg:GetDamagePosition())

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
-------------------------fuselage health calc
	if self.FuselageDead then return end
	self.FuselageHealth = math.Clamp(self.FuselageHealth - dmg:GetDamage(), 0, self.FuselageBaseHealth)

	if self.FuselageHealth < .9*self.FuselageBaseHealth then

	end

	if self.FuselageHealth < .8*self.FuselageBaseHealth then
	
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
	
	end

	if self.FuselageHealth < .2*self.FuselageBaseHealth then
						
	end
		
	if self.FuselageHealth < .1*self.FuselageBaseHealth then
		
	end

	if self.FuselageHealth <= 0 and !self.FuselageDead then	
		self.FuselageDead = true
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
