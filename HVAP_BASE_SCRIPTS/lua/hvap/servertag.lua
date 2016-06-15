
include("hvap/base.lua")

hvap.tag = hvap.tag or {
	
	tags = {},

	add = function(name)
		if not table.HasValue(hvap.tag.tags, name) then
			table.insert(hvap.tag.tags, name)
		end
	end,

	remove = function(name)
		for _, n in pairs(hvap.tag.tags) do
			if n == name then
				table.remove(hvap.tag.tags, n)
			end
		end
		local svTags = string.Explode(',', GetConVarString("sv_tags") or "")
		for _, tag in pairs(svTags) do
			if tag == name then
				table.remove(svTags, name)
			end
		end
		table.sort(svTags)
		RunConsoleCommands("sv_tags", table.concat(svTags, ','))
	end,

}
