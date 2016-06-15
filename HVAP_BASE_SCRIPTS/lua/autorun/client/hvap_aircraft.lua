
include "hvap/aircraft.lua"

CreateClientConVar("hvap_cl_air_sensitivity", 1, true, true)
CreateClientConVar("hvap_cl_air_mouse", 1, true, true)

CreateClientConVar("hvap_cl_air_autolevel", 1, true, true)

CreateClientConVar("hvap_cl_air_incthr", 0, true, true)
CreateClientConVar("hvap_cl_air_throttle_sensitivity", 5, true, true)
CreateClientConVar("hvap_cl_air_throttle_sensitivity_p", 5, true, true)

CreateClientConVar("hvap_cl_air_mouse_swap", 1, true, true)
CreateClientConVar("hvap_cl_air_mouse_invert_pitch", 0, true, true)
CreateClientConVar("hvap_cl_air_mouse_invert_yawroll", 0, true, true)
CreateClientConVar("hvap_cl_air_smoothview", 1, true, true)
CreateClientConVar("hvap_cl_air_shakeview", 1, true, true)
CreateClientConVar("hvap_cl_air_smoothkeyboard", 1, true, true)
CreateClientConVar("hvap_cl_air_volume", 1, true, true)
CreateClientConVar("hvap_cl_air_spawneffect", 1, true, true)
CreateClientConVar("hvap_cl_air_esmokeeffect", 1, true, true)
CreateClientConVar("hvap_cl_air_eheateffect", 1, true, true)
CreateClientConVar("hvap_cl_air_gsmokeeffect", 1, true, true)
CreateClientConVar("hvap_cl_air_bulleteffect", 1, true, true)

if not game.SinglePlayer() then
	CreateClientConVar("hvap_air_startspeed", 4, true)
	CreateClientConVar("hvap_air_damagemul", 1, true)
	CreateClientConVar("hvap_air_fhealthmul", 1, true)
	CreateClientConVar("hvap_air_ehealthmul", 1, true)
	CreateClientConVar("hvap_air_rhealthmul", 1, true)
	CreateClientConVar("hvap_noplydmg", 0, true)
	CreateClientConVar("hvap_kickdeath", 0, true)
	CreateClientConVar("hvap_thirdperson_enabled", 1, true)	
	CreateClientConVar("hvap_fuel_enabled", 1, true)	
	CreateClientConVar("hvap_consumption_mult", .1, true)
	CreateClientConVar("hvap_tracers", 1, true)
	
	local function onchange( name, oldval, val )
		if LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin() then
			net.Start("hvap_admin_setting")
				net.WriteString(name)
				net.WriteFloat(val)
			net.SendToServer()
		end
	end
	cvars.AddChangeCallback("hvap_air_startspeed",onchange)
	cvars.AddChangeCallback("hvap_air_damagemul",onchange)
	cvars.AddChangeCallback("hvap_air_fhealthmul",onchange)
	cvars.AddChangeCallback("hvap_air_ehealthmul",onchange)
	cvars.AddChangeCallback("hvap_air_rhealthmul",onchange)
	cvars.AddChangeCallback("hvap_noplydmg",onchange)
	cvars.AddChangeCallback("hvap_kickdeath",onchange)
	cvars.AddChangeCallback("hvap_thirdperson_enabled",onchange)
	cvars.AddChangeCallback("hvap_arcade_enabled",onchange)
	cvars.AddChangeCallback("hvap_fuel_enabled",onchange)
	cvars.AddChangeCallback("hvap_consumption_mult",onchange)
	cvars.AddChangeCallback("hvap_tracers",onchange)
end

surface.CreateFont("hvap_heli_big", {
	font = "monospace",
	size = 32
})

surface.CreateFont("hvap_heli_small", {
	font = "monospace",
	size = 22
})

hvap.hook("ShouldDrawLocalPlayer", "hvap_air_showplayerthirdperson", function()
	local v = LocalPlayer():GetVehicle()
	if IsValid(v) and IsValid(v:GetNWEntity("hvap_aircraft")) then
		return v:GetThirdPersonMode()
	end
end)

hvap.hook("CalcView", "hvap_air_calcview", function(p, pos, ang, fov)

	p.hvap = p.hvap or {}
	p.hvap.air = p.hvap.air or {}

	local aircraft = p.hvap.air.vehicle --p:GetVehicle():GetNWEntity("hvap_aircraft")
	if !IsValid(aircraft) then
		local v=p:GetVehicle()
		if IsValid(v) and IsValid(v:GetNWEntity("hvap_aircraft")) then
			aircraft = p:GetVehicle():GetNWEntity("hvap_aircraft")
			aircraft.viewPos = {
				origin = p.hvap.air.lastView.origin - pos,
				angles = p.hvap.air.lastView.angles - ang,
				fov = fov
			}
			aircraft:onEnter(p)
		else
			p.hvap.air.vehicle = nil
			p.hvap.air.lastView = {origin=pos, angles=ang, fov=fov}
			return
		end
	end
	
	local i = p:GetNWInt("hvap_passenger_id")
	if p.hvap.air.vehicle and GetViewEntity() == p and aircraft.Seats then
		return aircraft:viewCalc((i==0 and 1 or i), p, pos, ang, 75)
	end

end)

hvap.hook("RenderScreenspaceEffects", "hvap_air_weaponcam",function()
	local p=LocalPlayer()
	if !IsValid(p) then return end
	local v=p:GetVehicle()
	if !IsValid(v) then return end
	local e=v:GetNWEntity("hvap_aircraft")
	if IsValid(e) then
		e:DrawScreenSpaceEffects(p:GetNWInt("hvap_passenger_id"),p)
	end
end)

hvap.hook("HUDPaint", "hvap_air_weaponhud", function()
	local p=LocalPlayer()
	if !IsValid(p) then return end
	local v=p:GetVehicle()
	if !IsValid(v) then return end
	local e=v:GetNWEntity("hvap_aircraft")
	if IsValid(e) then
		e:DrawHUD(p:GetNWInt("hvap_passenger_id"),p)
	end
end)

hvap.hook("CreateMove", "hvap_cl_air_mouseinput", function(md)
	local p=LocalPlayer()
	if !IsValid(p) then return end
	local v=p:GetVehicle()
	if !IsValid(v) then return end
	local e=v:GetNWEntity("hvap_aircraft")
	if IsValid(e) then
		e:MovePlayerView(p:GetNWInt("hvap_passenger_id"),p,md)
	end
end)
-- menu
hvap.addMenuPanel(hvap.menu.tab, hvap.menu.category, hvap.menu.aircraft, function(panel, info)

	panel:AddControl("Label", {Text = "Client Settings"})
	
	local presetParams = {
		Label = "Presets",
		MenuButton = 1,
		Folder = "hvap_aircraft",
		Options = {
			mouse = {
				hvap_cl_air_mouse = "1",
				hvap_cl_air_incthr = "0",
				hvap_cl_air_autolevel = "1",
				hvap_cl_air_mouse_swap ="1",
				hvap_cl_air_mouse_invert_pitch = "0",
				hvap_cl_air_mouse_invert_yawroll = "0",
				hvap_cl_air_key_Exit = KEY_E,
				hvap_cl_air_key_Start = KEY_R,
				hvap_cl_air_key_Throttle_Inc = KEY_W,
				hvap_cl_air_key_Throttle_Dec = KEY_S,
				hvap_cl_air_key_Yaw_Inc = KEY_A,
				hvap_cl_air_key_Yaw_Dec = KEY_D,
				hvap_cl_air_key_Pitch_Inc = KEY_NONE,
				hvap_cl_air_key_Pitch_Dec = KEY_NONE,
				hvap_cl_air_key_Roll_Inc = KEY_NONE,
				hvap_cl_air_key_Roll_Dec = KEY_NONE,
				hvap_cl_air_key_FreeView = KEY_SPACE,
				hvap_cl_air_key_FirstFire = MOUSE_LEFT,
				hvap_cl_air_key_SecondFire = MOUSE_RIGHT,
				hvap_cl_air_key_NextWeapon = KEY_F,
				hvap_cl_air_key_Bail = KEY_J,
				hvap_cl_air_key_Hover = KEY_H,
				hvap_cl_air_key_Gear = KEY_G,
				hvap_cl_air_key_Left = KEY_A,
				hvap_cl_air_key_Right = KEY_D
			},
			keyboard = {
				hvap_cl_air_mouse = "0",
				hvap_cl_air_incthr = "0",
				hvap_cl_air_autolevel = "1",
				hvap_cl_air_mouse_swap = "0",
				hvap_cl_air_mouse_invert_pitch = "0",
				hvap_cl_air_mouse_invert_yawroll = "0",
				hvap_cl_air_key_Exit = KEY_E,
				hvap_cl_air_key_Start = KEY_R,
				hvap_cl_air_key_Throttle_Inc = KEY_SPACE,
				hvap_cl_air_key_Throttle_Dec = KEY_LSHIFT,
				hvap_cl_air_key_Yaw_Inc = MOUSE_LEFT,
				hvap_cl_air_key_Yaw_Dec = MOUSE_RIGHT,
				hvap_cl_air_key_Pitch_Inc = KEY_W,
				hvap_cl_air_key_Pitch_Dec = KEY_S,
				hvap_cl_air_key_Roll_Inc = KEY_D,
				hvap_cl_air_key_Roll_Dec = KEY_A,
				hvap_cl_air_key_FreeView = KEY_X,
				hvap_cl_air_key_FirstFire = MOUSE_LEFT,
				hvap_cl_air_key_SecondFire = MOUSE_RIGHT,
				hvap_cl_air_key_NextWeapon = KEY_F,
				hvap_cl_air_key_Bail = KEY_J,
				hvap_cl_air_key_Hover = MOUSE_4,
				hvap_cl_air_key_Gear = KEY_G,
				hvap_cl_air_key_Left = KEY_A,
				hvap_cl_air_key_Right = KEY_D
			},
		},
		CVars = {
			"hvap_cl_air_easy",
			"hvap_cl_air_sensitivity",
			"hvap_cl_air_usejoystick",
			"hvap_cl_air_mouse",
			"hvap_cl_air_incthr",
			"hvap_cl_air_autolevel",
			"hvap_cl_air_throttle_sensitivity",
			"hvap_cl_air_throttle_sensitivityP",
			"hvap_cl_air_mouse_swap",
			"hvap_cl_air_mouse_invert_pitch",
			"hvap_cl_air_mouse_invert_yawroll",
		}
	}	
	for category, controls in pairs(hvap.aircraft.controls) do
		for i, t in pairs(controls) do
			if !t[3] then
				table.insert(presetParams.CVars, "hvap_cl_air_key_" .. i)
			else
				table.insert(presetParams.CVars, "hvap_cl_air_key_" .. i .. "_Inc")
				table.insert(presetParams.CVars, "hvap_cl_air_key_" .. i .. "_Dec")
			end
		end
	end
	panel:AddControl("ComboBox", presetParams)

	for i, controls in pairs(hvap.aircraft.controls) do
		panel:AddControl("Label", {Text = controls.name})
		for name, t in pairs(controls.list) do
			if !t[3] then
				local k = vgui.Create("hvapkeyboard::key", panel)
				k:setLabel(name)
				k:setKey(t[2])
				k.runCommand="hvap_cl_air_key_"..name
				panel:AddPanel(k)
			else
				local f = vgui.Create("hvapkeyboard::key", panel)
				f:setLabel(name .. " +")
				f:setKey(t[2])
				f.runCommand = "hvap_cl_air_key_"..name.."_Inc"
				panel:AddPanel(f)
				local k = vgui.Create("hvapkeyboard::key", panel)
				k:setLabel(name .. " -")
				k:setKey(t[3])
				k.runCommand = "hvap_cl_air_key_"..name.."_Dec"
				panel:AddPanel(k)
			end
		end
	end

	panel:AddControl("Slider", {
		Label="Volume",
		Type="float",
		Min=0.256,
		Max=1,
		Command="hvap_cl_air_volume",
	})
	
	panel:CheckBox("Dynamic View Angle","hvap_cl_air_smoothview")
	
	panel:CheckBox("Dynamic View Position","hvap_cl_air_shakeview")

	panel:AddControl("Label", {Text = ""})

	panel:CheckBox("Auto Level Helicopter","hvap_cl_air_autolevel")
	
	panel:CheckBox("Incremental Throttle (Helicopter)","hvap_cl_air_incthr")
	if info["hvap_cl_air_incthr"]=="1" then
		panel:AddControl("Slider", {
			Label = "Throttle Sensitivity",
			Type = "float",
			Min = 1,
			Max = 25,
			Command = "hvap_cl_air_throttle_sensitivity",
		})
		panel:AddControl("Label", {Text = ""})
	end	
	

	panel:AddControl("Slider", {
		Label = "Throttle Sensitivity (Planes)",
		Type = "float",
		Min = 1,
		Max = 25,
		Command = "hvap_cl_air_throttle_sensitivity_p",
	})
	
	panel:CheckBox("Use Mouse","hvap_cl_air_mouse")
	if info["hvap_cl_air_mouse"]=="1" then
		panel:CheckBox(" - Invert Pitch","hvap_cl_air_mouse_invert_pitch")
		panel:CheckBox(" - Invert Yaw/Roll","hvap_cl_air_mouse_invert_yawroll")
		panel:CheckBox(" - Swap Yaw/Roll","hvap_cl_air_mouse_swap")
		panel:AddControl("Label", {Text = ""})
		panel:AddControl("Slider", {
			Label = "Mouse Sensitivity",
			Type = "float",
			Min = 0.5,
			Max = 1.9,
			Command = "hvap_cl_air_sensitivity",
		})
	end

	panel:AddControl("Button", {
		Label = "Joystick Configuration",
		Command = "joyconfig"
	})
	
	panel:AddControl("Label", {Text = ""})
	panel:AddControl("Label", {Text = "Client Performance Settings"})
	
	panel:CheckBox("Enable Spawn Effects","hvap_cl_air_spawneffect")	
	panel:CheckBox("Enable Engine Smoke Effects","hvap_cl_air_esmokeeffect")	
	panel:CheckBox("Enable Engine Heat Effects","hvap_cl_air_eheateffect")	
	panel:CheckBox("Enable Muzzle Smoke Effects","hvap_cl_air_gsmokeeffect")	
	panel:CheckBox("Enable Fancy Bullet Impact Effects","hvap_cl_air_bulleteffect")	
	
	panel:AddControl("Label", {Text = ""})
	panel:AddControl("Label", {Text = "Admin Settings"})
	
	panel:CheckBox("Enable Third Person","hvap_thirdperson_enabled")		
	panel:CheckBox("Enable Tracers","hvap_tracers")
	panel:CheckBox("Enable Fuel Consumption","hvap_fuel_enabled")	
	panel:CheckBox("Disable Passenger Damage","hvap_noplydmg")	
	panel:CheckBox("Kick Passengers From Dead Aircraft","hvap_kickdeath")		
	
	panel:AddControl("Slider", {
		Label="Start Speed",
		Type="Untitled",
		Min=1,
		Max=10,
		Command="hvap_air_startspeed",
	})
	panel:AddControl("Label", {Text = ""})		
	
	panel:AddControl("Slider", {
		Label="Fuel Consumption",
		Type="Untitled",
		Min=0.01,
		Max=10,
		Command="hvap_consumption_mult",
	})
	panel:AddControl("Label", {Text = ""})			
	
	panel:AddControl("Slider", {
		Label="Weapon Damage Multiplier",
		Type="Untitled",
		Min=0.1,
		Max=10,
		Command="hvap_air_damagemul",
	})	
	panel:AddControl("Label", {Text = ""})			
	
	panel:AddControl("Slider", {
		Label="Fuselage Health Multiplier",
		Type="Untitled",
		Min=0,
		Max=10,
		Command="hvap_air_fhealthmul",
	})		
	panel:AddControl("Label", {Text = "(0 means unbreakable everything)"})	
	panel:AddControl("Label", {Text = ""})		
	
	panel:AddControl("Slider", {
		Label="Engine Health Multiplier",
		Type="Untitled",
		Min=0,
		Max=10,
		Command="hvap_air_ehealthmul",
	})	
	panel:AddControl("Label", {Text = "(0 means unbreakable engines)"})	
	panel:AddControl("Label", {Text = ""})	
	
	panel:AddControl("Slider", {
		Label="Rotor Health Multiplier",
		Type="Untitled",
		Min=0,
		Max=10,
		Command="hvap_air_rhealthmul",
	})			
	panel:AddControl("Label", {Text = "(0 means unbreakable rotors)"})	
	panel:AddControl("Label", {Text = ""})		
end,
	"hvap_cl_air_mouse",
	"hvap_cl_air_incthr",
	"hvap_cl_air_showdevhelp"
)
