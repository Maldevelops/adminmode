if SERVER then
	
	print("Loading AdminMode")
	resource.AddFile("materials/Raleway-Light.ttf")
	resource.AddFile("materials/Raleway.ttf")
	include("config.lua") // Serverside Config Load
	AddCSLuaFile("config.lua") // Clientside Config Load

	include("init.lua") // Serverside File

	include("changelog.lua") // Serverside File

	AddCSLuaFile("cl_init.lua") // Clientside File
	
	print("\nLoaded AdminMode")

else

	include("changelog.lua")
	include("config.lua")
	include("init.lua")
	include("cl_init.lua")

end