
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
	table.insert(self.entities, self)
		
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
	self.Throttle = 0
	self.Boost = false
	self.ALT = 0
	
	self.FuselageBaseHealth = self.FuselageHealth
	self.EnginesMaxHealth = 0
	
	self.BaseFuel = self.Fuel
	
	self.passengers = {}
	
	self.controls = {
		throttle = 0,
		pitch = 0,
		yaw = 0,
		roll = 0,
	}

	self.MinSPD = self.MinSpeed*14.49
	self.MaxSPD = self.MaxSpeed*14.49
	self.CruSPD = self.CruiseSpeed*14.49	
	
	self.disabled = false
	self.dead = false
	self.spinout = false
	
	self.IsHVAP = true
	self.AllowAmmo = true
	self.AllowFuel = true
	self.AllowRepair = true

	self.GearDown = true
	
	self:addEngines()
	self:addRotors()
	self:addSounds()
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
	
	self.DisableDev = true
	
	local effectdata = EffectData()
	effectdata:SetEntity( self )
	util.Effect( "hvap_spawn", effectdata, true, true )		
	
end

function ENT:addEngines()
	self.engines = {}
	for k, v in pairs(self.Engines) do
		if k != "BaseClass" then
			local eng = self:addEntity("hvap_engine_p", true)
			eng:SetPos(self:LocalToWorld(v.pos))
			eng:SetAngles(self:GetAngles())
			eng:SetParent(self)
			for index, value in pairs(v.info) do
				eng[index] = value
			end
			eng.aircraft = self				
			eng:Spawn()
			eng:Activate()
			eng:SetNoDraw(self.DisableDev)
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
			local rotor = self:addEntity("hvap_rotor_p", false)
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
				constraint.Axis(self.Entity, rotor, 0, 0, v.pos, Vector(1,0,0), 0,0,0,1)
			end
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
--landing gear
function ENT:LandingGear(b)
	if b then
		if self.GearDown then return end
		self.GearDown = true
	elseif self.GearDown then
		self.GearDown=false
	end
	local geardown,t1=self:LookupSequence(self.GearDownAnim)
	local gearup,t2=self:LookupSequence(self.GearUpAnim)	

	if !self.disabled then
		if b then
			self:ResetSequence(gearup) 
			self:SetPlaybackRate(1.0)
			self:SetBodygroup(self.GearBodygroup,0)	
			for i=1,#self.wheels do 
				self.wheels[i]:SetRenderMode(RENDERMODE_NORMAL)
				self.wheels[i]:SetColor(Color(255,255,255,255))
				self.wheels[i]:SetSolid(SOLID_VPHYSICS)
			end			
		elseif !b then
			self:ResetSequence(geardown)
			self:SetPlaybackRate(1.0)
			self:SetBodygroup(self.GearBodygroup,1)
			for i=1,#self.wheels do 
				self.wheels[i]:SetRenderMode(RENDERMODE_TRANSALPHA)
				self.wheels[i]:SetColor(Color(255,255,255,0))
				self.wheels[i]:SetSolid(SOLID_NONE)
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

function ENT:RocketAlert()
	if self.active and !self.disabled then
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
		) / 10000
		- ph:GetAngleVelocity()*self.Aerodynamics.AngleDrag

	return targetVelocity, targetAngVel
end

function ENT:Think()
	local crt = CurTime()
	local fscl =  (self.FuselageHealth/self.FuselageBaseHealth)	
------------------------------------------------------------------------------------------------coop brings all engines to one rotor, separate brings engine to rotor
	local rpm = 0
	local rpmcap = 0
	local power = 0
	local rotrpm = 0
	local rotcap = 0

	if self.skin != self:GetSkin() then
		self.skin = self:GetSkin()
		self:updateSkin(self.skin)
	end	
	
	for i = 1, self.NumEngines do 
		rpm = rpm + self.engines[i].engineRpm
		rpmcap = rpmcap + self.engines[i].MaxRPM
		power = power + self.engines[i].enginePower
	end
	self.EnginesRPM = rpm/rpmcap
	self.EnginePower = power/self.Weight
	for i = 1, self.NumEngines do
		if !self.rotors[i].Disabled then
			self.rotors[i].EngRpm = self.engines[i].engineRpm/self.Engines[i].info.MaxRPM
		end
	end
	for i = 1, self.NumEngines do 
		if !self.rotors[i].Disabled then
			rotrpm = rotrpm + self.rotors[i].rotorRPM
		end
	end
	self.rotorRpm = rotrpm/self.NumRotors

------------------------------------------------------------------------------------------------throttle calc	
	if self.IncrementalThr == 1 then
		self.Throttle = math.Clamp(self.Throttle+(self.controls.throttle*self.ThrSensitivity)/1024, 0, 1)
	elseif self.IncrementalThr == 0 then
		self.Throttle = math.Clamp(self.Throttle+(self.controls.throttle*self.ThrSensitivity)/1024, 0, 1)
	end
	if self.Throttle > .99 and self.controls.throttle > .5 then
		self.Boost = true
	else
		self.Boost = false
	end
------------------------------------------------------------------------------------------------fuelcalc
	if hvap.aircraft.cvars.fuelenable:GetInt() == 1 then
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

	if self.nextUpdate<crt then
		self:RocketAlert()
		table.Merge(self.entities,constraint.GetAllConstrainedEntities(self))
		self.nextUpdate = crt+0.1
	end
		
	if self.disabled and !self.dead then	
	
		if hvap.aircraft.cvars.kickdeath:GetInt() == 1 then
			for i = 1, #self.seats do
				if self.passengers[i]:IsValid()	then
					self:EjectPassenger(self.passengers[i])
				end
			end
		end	
	
		local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos())
		effectdata:SetScale(self.FuselageBaseHealth/40)
		util.Effect("hvap_explode", effectdata)
		self.Entity:EmitSound( "hvap/tank/tank_destroyed_0"..math.random(1,3)..".wav", 140, math.random(90,110) )
		util.BlastDamage(self.Entity, self.Entity, self.Entity:GetPos(), self.FuselageBaseHealth, self.FuselageBaseHealth/2)
	
		if hvap.aircraft.cvars.removetime:GetFloat() > 0 then
			timer.Create( "DeleteTimer", hvap.aircraft.cvars.removetime:GetFloat()+15, 1,
				function() 
					if IsValid(self) and !self.disabled then 
						self:Remove() 
					end 
				end
			)
		end	
		self.dead = true
		self.active = false
	end
------------------------------------------------------------------------------------------------	
		if self.FuselageHealth > 0 then
		local tr=util.QuickTrace(pos,Vector(0,0,-999999),self.Entity)
		self.ALT = pos.z-tr.HitPos.z		
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
	self:setVar("fhp", self.fscl)	
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

function ENT:PhysicsUpdate(ph)
	if self.LastPhys == CurTime() then return end
	local vel = ph:GetVelocity()
	local vell = vel:Length()
	local angvel = ph:GetAngleVelocity()
	local pos = self:GetPos()
	local lvel = self:WorldToLocal(pos+vel)
	local fwd = self:GetForward()
	local up = self:GetUp()
	local ang = self:GetAngles()
	local phm = FrameTime()*66
	local fscl = (self.FuselageHealth/self.FuselageBaseHealth)	
	local speed = 0
	local gear = 0 
	local aeroVelocity, aeroAng = self:calcAerodynamics(ph)
	
	if vell < self.MinSPD then
		speed = (vell/self.MinSPD)
		gear = 30 
		reduce = Vector( .1, .64, 0.128 )
		rotate = Vector(0.4,0.8,0.8)
	elseif vell >= self.MinSPD && vell < self.CruSPD then
		speed = (vell/self.CruSPD)
		gear = 38
		reduce = Vector( 0.2, .768, .192 )
		rotate = Vector(1,1,1)
	elseif vell >= self.CruSPD && vell < self.MaxSPD then
		speed = (vell/self.MaxSPD)
		gear = 44
		reduce = Vector( .256, .8, .256 )
		rotate = Vector(1,1,1)
	elseif vell >= self.MaxSPD then
		speed = (vell/self.MaxSPD)*.64
		gear = 36
		reduce = Vector( .32, .8, .32 )
		rotate = Vector(0.64, 0.64, 0.4)
	end
	
	local controlAng = Vector (
		(self.controls.roll),
		(self.controls.pitch),
		(self.controls.yaw)
	)*self.Aerodynamics.Rotate*(rotate)
	
	if vell < self.MinSPD*0.9 then
		local av=ph:GetAngleVelocity()
		p = math.Clamp(( -(up:AngleEx(Vector(0,0,-1)).p)-av.y*0.1-lvel.x*0.05),-2/speed,2/speed)
--		ph:AddAngleVelocity(Vector(0,p,0)*speed*phm)
	end	

	if fscl <= .64 then
		damaged = Vector(math.Rand(-1,1)*(1-fscl)*self.rotorRpm, math.Rand(-1,1)*(1-fscl)*self.rotorRpm, math.Rand(-1,1)*(1-fscl)*self.rotorRpm)
	end



	local rotsub = (angvel:Length()/32)*self.rotorRpm
	local controlThrottle = fwd * (( self.rotorRpm + (self.rotorRpm+self.Throttle)/10) * (self.EnginePower)*gear+speed ) -reduce*rotsub
	
	ph:AddAngleVelocity((aeroAng*speed + controlAng)*phm)
	ph:AddVelocity((aeroVelocity + controlThrottle)*phm)
	
--[[	local momentum = ((1-speed)*2+ speed)*self.rotorRpm*self.EnginesRPM
	local rotsub =  (angvel:Length()/12)*self.rotorRpm
	local controlThrottle = ((((self.Throttle^.5 + speed )*(self.rotorRpm+self.EnginesRPM)^3 )*momentum) -rotsub)*self.EnginePower/100
	
	ph:AddAngleVelocity((AngleDynamics + controlAng)*phm)
	ph:AddVelocity((MoveDynamics + fwd*controlThrottle)*phm)]]

	for _,e in pairs(self.wheels) do
		if IsValid(e) and e:GetPhysicsObject():IsValid() then
		local ph=e:GetPhysicsObject()
			local wpos = self:WorldToLocal(e:GetPos())
			
			local xpositive = (wpos.x >= 0 and 1 or -1)
			local ypositive = (wpos.y >= 0 and 1 or -1)

			e:GetPhysicsObject():AddVelocity(
				(self:LocalToWorld(Vector(0, 0,
					(math.abs(wpos.y) ^ (1/3))*ypositive*controlAng.x
					- (math.abs(wpos.x) ^ (1/3))*xpositive*controlAng.y
					+ 7
				)/4)-pos
				+ aeroVelocity*0.8
				+ controlThrottle*0.8
			)*phm)

			if self.Throttle < 0 then
				ph:AddAngleVelocity(ph:GetAngleVelocity()*(self.Throttle)*phm)
			end
		end
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
			if amt == 1 then
				v.engineRpm = 0
				v.enginePower = 0
				v.engineHealth = 0
			end
		end
	end
	if self.FuselageHealth < self.FuselageBaseHealth then
		self.FuselageHealth = math.Clamp(self.FuselageHealth + self.FuselageBaseHealth/amt, 0, self.FuselageBaseHealth )
		self:EmitSound("hvap/repair_loop.wav", 100, 100+amt*10)
		self.controls = {
			throttle = 0,
			pitch = 0,
			yaw = 0,
			roll = 0,
		}
		self.LastDamageTaken = 0
		self.rotorRpm = 0
		self.EnginesRPM = 0
		self.EnginePower = 0
		self.Roll = 0
		self.Pitch = 0
		self.Yaw = 0	
		self.Throttle = 0
		self.Boost = false
		self.active = false
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
			dmge = dmg:GetDamage()*4
		else
			dmge = dmg:GetDamage()
		end
		local edmg = math.Clamp(math.Round( 5.12*(dmge*(self.Engines[i].radius)/pos:Distance(self.Engines[i].pos)), 0),1,200)
		self.engines[i]:DamageEngine(edmg*0.8)
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
	
		self.FuselageHealth = math.Clamp(self.FuselageHealth - dmg:GetDamage()*0.64, 0, self.FuselageBaseHealth)

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
