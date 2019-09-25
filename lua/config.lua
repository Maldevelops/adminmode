--[[

AdminMode Configuration File
	Developed by Mal

]]
ADMINMODE = {}
/*
Button that opens AdminMode Menu.
It most likely will not work, you will need to self bind it to "f2".

*/
ADMINMODE.KeyBind = KEY_F2


/*
Player Model when AdminMode is activated.
*/
ADMINMODE.PlayerModel = "models/player/combine_super_soldier.mdl"

/*
Group names that are allowed to use AdminMode
*/
ADMINMODE.Groups = {"superadmin", "admin", "moderator"}
// What groups can use the announce tool
ADMINMODE.AnnouncementAccess = {"superadmin", "admin"}

/*
What do you want the chat tag to say
*/
ADMINMODE.ChatName = "Server"

/*
If a user attempts to exploit the Net Messages of the admin mode
then ban them.
*/
ADMINMODE.EnableExploitBan = true // All bans are written to the banned_user.cfg inside your cfg folder

ADMINMODE.ExploitBanTime = 0 // 0 = perm ban | 1440 = 24h | Based on minutes

ADMINMODE.BanReason = "Attempted Net Exploit"


/*

▀▀█▀▀ █░░█ █▀▀ █▀▄▀█ █▀▀
░░█░░ █▀▀█ █▀▀ █░▀░█ █▀▀
░░▀░░ ▀░░▀ ▀▀▀ ▀░░░▀ ▀▀▀

Choose a style for your theme!

These are the outer colors of the buttons.
*/
ADMINMODE.EnabledColor = Color(79, 255, 112) // Green - When the option is active

ADMINMODE.DisabledColor = Color(255, 255, 255) // White - When the option is inactive

ADMINMODE.AdminModeText = "Administrate" // AdminMode Button

ADMINMODE.CloakText = "Cloak" // Cloak Button

ADMINMODE.NoTargetText = "NoTarget" // NPC NoTarget Button

ADMINMODE.Title = "AdminMode" // Title of AdminMode Menu

/*
Are you using a Dark UI Interface?
This has been a UI bug that when a Dark UI
is added to your game our interface bugs.

Simply toggle this to true if that is the case
*/
ADMINMODE.UsingDarkTheme = false // THIS DOES NOT USE DARK THEME READ ABOVE
// Also this may not work ^
/*
Do you want the Changelog to appear in server console?
*/
ADMINMODE.Changelog = true
