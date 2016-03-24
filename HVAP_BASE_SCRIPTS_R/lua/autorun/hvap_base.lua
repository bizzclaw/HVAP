
include("hvap/base.lua")

if SERVER then

	AddCSLuaFile("autorun/hvap_base.lua")

	local folderList = {}
	folderList = file.Find("hvap/".."*.lua", "LUA")
	table.sort(folderList)
	for _, f in pairs(folderList) do
		AddCSLuaFile("hvap/" .. f)
	end

else

	-- menu/settings stuff
	hvap.hook("PopulateToolMenu", "hvap_menu_populate", function()
		for tab, t1 in pairs(hvap.menuPanels) do
			for category, t2 in pairs(t1) do
				for name, hook in pairs(t2) do
					spawnmenu.AddToolMenuOption(tab, category, name, name, "", "", function(panel)
						panel:Clear()
						hook.panel = panel
						for _, func in pairs(hook.funcs) do
							func(panel, {})
						end
					end, {})
				end
			end
		end
	end)
	
	local lastThink=0
	hvap.hook("Think", "hvap_menupanel_update", function()
		local crt=CurTime()
		if lastThink+0.1 < crt then
			for nameTab, tab in pairs(hvap.menuPanels) do
				for nameCategory, category in pairs(tab) do
					for namePanel, panel in pairs(category) do
					
						if panel.panel then
							for name, old in pairs(panel.triggers) do
								if GetConVar(name) then
									local new = GetConVar(name):GetString()
									if old != new then
										panel.triggers[name] = new
										panel.panel:Clear()
										for _, func in pairs(panel.funcs) do
											func(panel.panel, panel.triggers)
										end
									end
								end
							end
						end
						
					end
				end
			end
			lastThink = crt
		end
	end)
		
	
	-- calcview hooks
	local view = {}
	local lastCalcView = 0
	hvap.calcView = function(player, pos, ang, fov)
		if lastCalcView == CurTime() then return end
		player.hvap = player.hvap or {}
		lastCalcView = CurTime()
		view.origin = pos
		view.angles = ang
		view.fov = fov
		view.vm_angles = nil
		view.vm_origin = nil
		local send = false
		for name, hook in pairs(hvap.hooksCalcView) do
			local t = hook.f(player, view.origin, view.angles, view.fov)
			if t then
				view.origin = t.origin or view.origin
				view.angles = t.angles or view.angles
				view.fov = t.fov or view.fov
				view.vm_angles = t.vm_angles or view.vm_angles
				view.vm_origin=t.vm_origin or view.vm_origin
				send = true
			end
		end
		player.hvap.lastView = table.Copy(view)
		if send then return view end
	end
	hook.Add("CalcView", "hvap_cl_calcview", hvap.calcView)
	hvap.hooks["hvap_cl_calcview"] = {f = hvap.calcView, g = "CalcView"}

end

concommand.Add("hvap_reloadhooks" .. (CLIENT and "_cl" or ""), function(player, command, args)
	for name, t in pairs(hvap.hooks) do
		if !t.g or !name or !t.f then error("failed to reload hook " .. tostring(t.g) .. ' ' .. tostring(name) .. ' ' .. tostring(t.f)) end
		hook.Add(t.g, name, t.f)
	end
end)
