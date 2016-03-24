
include "hvap/aircraft.lua"
include "hvap/keyboard.lua"

hvap.hook("hvapAirAddInputs", "hvap_aircraft_baseinputs", function()

	hvap.aircraft.addControls("Flight Controls", {
		Throttle = {{-1, 1}, KEY_W, KEY_S},
		Pitch = {{-1, 1}, KEY_W, KEY_S},
		Yaw = {{-1, 1}, KEY_A, KEY_D},
		Roll = {{-1, 1}, KEY_A, KEY_D},
		Start = {true, KEY_R},
		Gear = {true, KEY_G},
		Hover = {true, KEY_H},
	})

	hvap.aircraft.addControls("Common", {
		Exit = {true, KEY_E},
		FreeView = {true, KEY_SPACE},
		Brake = {true, KEY_SPACE},
		Camera = {true, KEY_LALT},
		Bail = {true, KEY_J},
		Function = {true, KEY_LCONTROL},
		Function2 = {true, KEY_LCONTROL}
	})

	hvap.aircraft.addControls("Weapons", {
		FirstFire = {true, MOUSE_LEFT},
		SecondFire = {true, MOUSE_RIGHT},
		NextWeapon = {true, KEY_X},
		CounterMeasure = {true, KEY_F}
	})

end)


hvap.hook("JoystickInitialize", "hvap_air_jcon_init", function()
	hvap.aircraft.initialize()
	hvap.aircraft.joyControls = {}
	for i, category in pairs(hvap.aircraft.controls) do
		for name, control in pairs(category.list) do
			hvap.aircraft.joyControls[name] = jcon.register({
				uid = "hvap_air_"..name,
				type = ((control[1] == true) and "digital" or "analog"),
				description = name,
				category = "hvap Aircraft"
			})
		end
	end
	hvap.aircraft.joyInitialized = true
	hvap.aircraft.joyCache = {}
end)



if SERVER then

	util.AddNetworkString("hvap_joyinput_usermessage")

	AddCSLuaFile("autorun/hvap_aircraft_input.lua")

	concommand.Add("hvap_air_input", function(p, c, a)
		if IsValid(p) and p:Alive() then
			local v = p:GetVehicle()
			if IsValid(v) then
				local e = v:GetNWEntity("hvap_aircraft")
				if IsValid(e) then
					e:receiveInput(a[1], tonumber(a[2]), p:GetNWInt("hvap_passenger_id"))
				end
			end
		end
	end)


	hvap.hook("Think", "hvap_aircraft_mouseinput", function()
		for _, p in pairs(player.GetAll()) do
			local v = p:GetVehicle()
			if IsValid(v) then
				local e = v:GetNWEntity("hvap_aircraft")
				if IsValid(e) and p.hvap.mouseInput and p:GetInfo("hvap_cl_air_mouse") == "1" then
					local m = tonumber(p:GetInfo("hvap_cl_air_sensitivity") or "1")/1.5
					local v = e:WorldToLocal(e:GetPos() + p:GetAimVector())
					local pid = p:GetNWInt("hvap_passenger_id")
					e:receiveInput(
						"Pitch",
						math.Clamp(v.z*m*(p:GetInfo("hvap_cl_air_mouse_invert_pitch")=="1" and 1 or -1)*10, -1, 1),
						pid
					)
					e:receiveInput(
						p:GetInfo("hvap_cl_air_mouse_swap")=="0" and "Yaw" or "Roll",
						math.Clamp(v.y*m*(p:GetInfo("hvap_cl_air_mouse_invert_yawroll")=="1" and 1 or -1)*10, -1, 1),
						pid
					)
				end
			end
		end
	end)


	hvap.hook("Think", "hvap_aircraft_joyinput", function() 
		if hvap.aircraft.joyInitialized then
			for _, p in pairs(player.GetAll()) do
				local v = p:GetVehicle()
				if IsValid(v) then
					local e = p:GetVehicle():GetNWEntity("hvap_aircraft")
					if IsValid(e) then
						for i, category in pairs(hvap.aircraft.controls) do
							for name, control in pairs(category.list) do
								local n = joystick.Get(p, "hvap_air_"..name)
								if n ~= nil and n ~= hvap.aircraft.joyCache[name] then
									hvap.aircraft.joyCache[name] = n
									if n == true or n == false then
										net.Start("hvap_joyinput_usermessage")
										net.WriteString(name)
										net.WriteBit(n) -- write takes boolean, read returns int. fuck yeah.
										net.Send(p)
										n = (n == true and 1 or 0)
									else
										n = n/127.5-1
									end
									e:receiveInput(name, n, p:GetNWInt("hvap_passenger_id"))
								end
							end
						end
					end
				end
			end
		end
	end)


else

	hvap.hook("hvapKey", "hvap_cl_aircraft_keyboard", function(key, pressed)
		local v=LocalPlayer():GetVehicle()
		if !IsValid(v) then return end
		local vehicle = v:GetNWEntity("hvap_aircraft")
		if !IsValid(vehicle) or vgui.CursorVisible() then return end
		local k = 0
		for i, category in pairs(hvap.aircraft.controls) do
			for name, k in pairs(category.list) do
				if !k[3] then
					if GetConVar("hvap_cl_air_key_" .. name):GetInt() == key then
						RunConsoleCommand("hvap_air_input", name, (pressed and "1" or "0"))
						vehicle:receiveInput(name, pressed and 1 or 0, LocalPlayer():GetNWInt("hvap_passenger_id"))
					end
				else
					local command, target
					if GetConVar("hvap_cl_air_key_" .. name .. "_Inc"):GetInt() == key then
						command = name
						target = (pressed and k[1][2] or 0)
					elseif GetConVar("hvap_cl_air_key_" .. name .. "_Dec"):GetInt() == key then
						command = name
						target = (pressed and k[1][1] or 0)
					end
					if command and target then
						if GetConVar("hvap_cl_air_smoothkeyboard"):GetBool() then
							vehicle.inputCache = vehicle.inputCache or {}
							vehicle.inputCache[command] = vehicle.inputCache[command] or {current = 0}
							vehicle.inputCache[command].target = target
						else
							RunConsoleCommand("hvap_air_input", command, tostring(target))
							vehicle:receiveInput(command, target, LocalPlayer():GetNWInt("hvap_passenger_id"))
						end
					end
				end
			end
		end
	end)


	hvap.hook("Think", "hvap_cl_aircraft_smoothkeyboard", function()
		if GetConVar("hvap_cl_air_smoothkeyboard"):GetBool() then
			local v=LocalPlayer():GetVehicle()
			if !IsValid(v) then return end
			local vehicle = v:GetNWEntity("hvap_aircraft")
			if !IsValid(vehicle) or !vehicle.inputCache then return end
			for command, info in pairs(vehicle.inputCache) do
				if info.current != info.target then
					info.current = math.Approach(info.current, info.target, FrameTime()*3.5)
					RunConsoleCommand("hvap_air_input", command, info.current)
					vehicle:receiveInput(command, info.current, LocalPlayer():GetNWInt("hvap_passenger_id"))
				end
			end
		end
	end)


	net.Receive("hvap_joyinput_usermessage", function(length)
		local vehicle = LocalPlayer():GetVehicle():GetNWEntity("hvap_aircraft")
		if !IsValid(vehicle) then return end
		local s = net.ReadString()
		local b = net.ReadBit()
		vehicle:receiveInput(s, b, LocalPlayer():GetNWInt("hvap_passenger_id"))
	end)

	
	hvap.hook("Initialize", "hvap_aircraft_finishinputs", function(p)
		if !hvap.aircraft.init then
			hook.Run("hvapAirAddInputs")
			hvap.aircraft.init = true

			for i, category in pairs(hvap.aircraft.controls) do	
				for name, key in pairs(category.list) do
					if !key[3] then
						CreateClientConVar("hvap_cl_air_key_" .. name, key[2], true, true)
					else
						CreateClientConVar("hvap_cl_air_key_" .. name .. "_Inc", key[2], true, true)
						CreateClientConVar("hvap_cl_air_key_" .. name .. "_Dec", key[3], true, true)
					end
				end
			end
		end
	end)


	-- block player use button and menu when in vehicle
	hvap.hook("PlayerBindPress", "hvap_cl_air_exit", function(p,bind)
		if bind == "+use" then
			local v = p:GetVehicle()
			if IsValid(v) then
				local heli = p:GetVehicle():GetNWEntity("hvap_aircraft")
				if IsValid(heli) then
					return true
				end
			end
		end
	end)


end

