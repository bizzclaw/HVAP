if SERVER then

	AddCSLuaFile()
	
	util.AddNetworkString("hvap_sound_precache")
	
	hook.Add("PlayerInitialSpawn", "hvap_sound_precache", function(ply)
		net.Start("hvap_sound_precache") net.Send(ply)
	end)
	
	elseif CLIENT then
	
		local function precachehvap()	
		
			for _, file in pairs(file.Find("sound/hvap/bullet/impact/*.wav", "GAME")) do
				util.PrecacheSound("sound/hvap/bullet/impact/"..file)
			end
			
			for _, file in pairs(file.Find("sound/hvap/bullet/ricochet/*.wav", "GAME")) do
				util.PrecacheSound("sound/hvap/bullet/ricochet/"..file)
			end
			
			for _, file in pairs(file.Find("sound/hvap/bullet/rocket/*.wav", "GAME")) do
				util.PrecacheSound("sound/hvap/bullet/rocket/"..file)
			end
		end
		
	net.Receive("hvap-precache", precachehvap)
	
end
