
include "hvap/base.lua"
include "hvap/keyboard.lua"

hvap.menu.aircraft = "Aircraft"

wac = wac or nil

hvap.aircraft = hvap.aircraft or {
	
	version = "1",
	
	spawnCategory = "HVAP Aircraft",

	addControls = function(category, t)
		local c
		for i, t in pairs(hvap.aircraft.controls) do
			if t.name == category then
				c = t
			end
		end
		if not c then
			c = { name = category, list = {} }
			table.insert(hvap.aircraft.controls, c)
		end

		for name, control in pairs(t) do
			control[2] = control[2] or KEY_NONE
			c.list[name] = control
		end
	end,

	controls = {},

	initialize = function()
		if not hvap.aircraft.initialized then
			hvap.aircraft.initialized = true
			hook.Run("hvapAirAddInputs")
		end
	end,

}
