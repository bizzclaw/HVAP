
include "hvap/base.lua"

for _, file in pairs(file.Find("autorun/hvap_*.lua", "LUA")) do
	AddCSLuaFile("autorun/"..file)
end
for _, file in pairs(file.Find("hvap/*.lua", "LUA")) do
	AddCSLuaFile("hvap/"..file)
end

resource.AddWorkshop("564418844") -- add self to workshop dl