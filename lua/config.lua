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

/*
What do you want the chat tag to say
*/
ADMINMODE.ChatName = "Server"