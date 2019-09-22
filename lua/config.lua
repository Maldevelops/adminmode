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
ADMINMODE.EnableExploitBan = true // ALl bans are written to the banned_user.cfg inside your cfg folder

ADMINMODE.ExploitBanTime = 0 // 0 = perm ban | 1440 = 24h | Based on minutes

ADMINMODE.BanReason = "Attempted Net Exploit"