
include "hvap/aircraft.lua"

AddCSLuaFile("autorun/client/hvap_aircraft.lua");

hvap.aircraft.cvars = {
	startSpeed = CreateConVar("hvap_air_startspeed", 4, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Aircraft Start Speed"),
	damagemultiplier = CreateConVar("hvap_air_damagemul", 1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "HVAP Weapon Damage Multiplier"),
	fhealthmul = CreateConVar("hvap_air_fhealthmul", 1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "HVAP Fuselage Health Multiplier"),
	ehealthmul = CreateConVar("hvap_air_ehealthmul", 1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "HVAP Engine Health Multiplier"),
	rhealthmul = CreateConVar("hvap_air_rhealthmul", 1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "HVAP Rotor Health Multiplier"),
	noplayerdamage = CreateConVar("hvap_noplydmg", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Disable Passanger Bullet Damage"),
	kickdeath = CreateConVar("hvap_kickdeath", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Kick Players From Dead Aircraft"),
	thirdpersonenable = CreateConVar("hvap_thirdperson_enabled", 1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Enable Thirdperson"),
	fuelenable = CreateConVar("hvap_fuel_enabled", 1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Enable Fuel Consumption"),
	fuelconsumptionmult = CreateConVar("hvap_consumption_mult", 0.1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Fuel Consumption Rate Multiplier"),
	tracers = CreateConVar("hvap_tracers", 1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Disable/Enable Tracers"),
}

if not game.SinglePlayer() then
	util.AddNetworkString("hvap_admin_setting")
	net.Receive("hvap_admin_setting", function(len,pl)
		if pl:IsAdmin() or pl:IsSuperAdmin() then
			local name=net.ReadString()
			local found=false
			for k,v in pairs(hvap.aircraft.cvars) do
				if v:GetName()==name then
					found=true
					break
				end
			end
			if found then
				local val=net.ReadFloat()
				RunConsoleCommand(name,val)
			end
		end
	end)
end

hvap.hook("SetPlayerAnimation", "hvap_cl_heliseat_animation", function(pl, anim)
	 if pl:InVehicle() then
	 local v = pl:GetVehicle()
		if string.find(v:GetModel(), "models/nova/airboat_seat") and v:GetNWEntity("hvap_aircraft"):IsValid() then 
			local seq = pl:LookupSequence("sit")	
			pl:SetPlaybackRate(1.0)
			pl:ResetSequence(seq)
			pl:SetCycle(0)
			return true
		end
	end
end)

hvap.hook("PlayerLeaveVehicle", "hvap_aircraft_leavevehicle", function(player, vehicle)
	if IsValid(vehicle.hvap_aircraft) then
		vehicle.hvap_aircraft:playerExit(player, vehicle)
	end
end)
