
hvap = hvap or {
	
	version = "1",
	
	author = "THE_HAVOK",
	
	menu = {
		tab = "Options",
		category = "HVAP",
	},
	
	player = function(p)
		p.hvap = p.hvap or {}
	end,

	smoothApproach = function(x,y,s,c)
		if not x then error("first argument nil", 2) end
		if not y then error("second argument nil", 2) end
		local FrT=math.Clamp(FrameTime(), 0.001, 0.035)*0.3
		c=(c and c*FrT)or(99999)
		return x-math.Clamp((x-y)*s*FrT,-c,c)
	end,

	smoothApproachAngle = function(x,y,s,c)
		local FrT=math.Clamp(FrameTime(), 0.001, 0.035)*0.3
		c=(c and c*FrT)or(99999)
		return x-math.Clamp(math.AngleDifference(x,y)*s*FrT,-c,c)
	end,

	smoothApproachAngles = function(a1,a2,s,c)
		if not a1 or not a2 then error("one argument is nil", 2) end
		a1.p = hvap.smoothApproachAngle(a1.p, a2.p, s,c)
		a1.y = hvap.smoothApproachAngle(a1.y, a2.y, s,c)
		a1.r = hvap.smoothApproachAngle(a1.r, a2.r, s,c)
		return a1
	end,

	smoothApproachVector = function(begin, target, s, c)
		if not begin then error("first argument is nil", 2) end
		if not target then error("second argument is nil", 2) end
		if not s then error("third argument is nil", 2) end
		local dir = (begin-target):GetNormal()
		local dist = begin:Distance(target)
		local var = hvap.smoothApproach(0,dist,s,c)
		local v = begin-dir*var
		begin.x = v.x
		begin.y = v.y
		begin.z = v.z
		--[[begin.x=hvap.SmoothApproach(begin.x,end.x,s,c)
		begin.y=hvap.SmoothApproach(begin.y,end.y,s,c)
		begin.z=hvap.SmoothApproach(begin.z,end.z,s,c)]]
		return begin
	end,


	hooks = {},
	hooksCalcView = {},
	hook = function(gmhook, name, func, unload)
		if gmhook == "CalcView" then
			hvap.hooksCalcView[name] = {f = func, u = unload, g = gmhook}
		else
			hvap.hooks[name] = {f = func, u = unload, g = gmhook}
			hook.Add(gmhook, name, func)
		end
	end,
	
	menuPanels = {},
	addMenuPanel = function(tab, category, name, func, ...)
		hvap.menuPanels[tab] = hvap.menuPanels[tab] or {}
		hvap.menuPanels[tab][category] = hvap.menuPanels[tab][category] or {}
		hvap.menuPanels[tab][category][name] = hvap.menuPanels[tab][category][name] or {}
		
		local t = hvap.menuPanels[tab][category][name]
		t.funcs = t.funcs or {}
		table.insert(t.funcs, func)
		
		if t.triggers then
			for k, v in pairs(t.triggers) do
				t.triggers[k] = ""
			end
		end
		
		t.triggers = t.triggers or {}
		if ... then
			for _, var in pairs({...}) do
				t.triggers[var] = ""
			end
		end
		
	end,
	
}
