if SERVER then
	
	print("Loading AdminMode")

	include("config.lua") // Serverside Config Load
	AddCSLuaFile("config.lua") // Clientside Config Load

	include("init.lua") // Serverside File

	AddCSLuaFile("cl_init.lua") // Clientside File
	
	print("Loaded AdminMode")

else

	include("config.lua")
	include("init.lua")
	include("cl_init.lua")

end