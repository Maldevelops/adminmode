local version1 = "--== Version 1 - 9/18/19\n+ AdminMode(ULX Depended)\n+ Cloak"

local version2 = "--== Version 2 - 9/19/19\n+ NoTarget\n+ Announcements\n User Interface Updated"

local version21 = "--== Version 2.1 - 9/19/19\n+ Standalone AdminMode"

local version22 = "--== Version 2.2 - 9/21/19\n+ User Interface Overhaul\n+ Changelog"

local version3 = "--== Version 3 - 9/22/19\n+ Change Titles/Buttons Text\n+ Changelog Configuration Option\n+ User Interface Redone\n- Removed all 'Disable' buttons\n+ Added Theme Configuration\n- Shadow removed from Font\n- Removed 'by Soul Networks' from title\n- Removed Authenticator\n+ Optimized Code(Removed Useless Lines)"

if ADMINMODE.Changelog == true then
	MsgC(Color(37, 204, 247), "AdminMode - Staff Better - Changelog\n")
	MsgC(Color(253, 150, 68), version1, "\n", version2, "\n", version21, "\n", version22, "\n", version3)
else
	// Changelog is turned off
end