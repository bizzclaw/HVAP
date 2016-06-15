
include "hvap/base.lua"

for _, file in pairs(file.Find("autorun/hvap_*.lua", "LUA")) do
	AddCSLuaFile("autorun/"..file)
end
for _, file in pairs(file.Find("hvap/*.lua", "LUA")) do
	AddCSLuaFile("hvap/"..file)
end

resource.AddWorkshop("650894028") -- audio
resource.AddWorkshop("650892060") -- audio 2
resource.AddWorkshop("650892060") -- mats models
resource.AddWorkshop("650892072") -- scripts