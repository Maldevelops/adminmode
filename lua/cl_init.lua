surface.CreateFont( "Notification", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 25,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "EntryFont", {
	font = "Tahoma", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = true,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "BoxFont", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = true,
	size = 20,
	weight = 300,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


surface.CreateFont( "NotificationTitle", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = true,
	size = 25,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


function OpenAdminMenu(ply)

	if table.HasValue(ADMINMODE.Groups, ply:GetNWString("usergroup")) then
		local frame = vgui.Create("DFrame")
		

		sound.Play("buttons/button9.wav", ply:GetPos())
		frame:SetSize(130,180)
		frame:SetTitle(ADMINMODE.Title)
		frame:SetBackgroundBlur(true)
		frame:ShowCloseButton(false)
		frame:SetVisible(true)
		frame:Center()
		frame:MakePopup()
		frame.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
			draw.RoundedBox( 0, 0, 0, w, h, Color( 45, 52, 54, 250 ) ) -- Draw a red box instead of the frame
		end



		local adminBtn = vgui.Create("DButton",frame)
		adminBtn:SetSize(100, 23)
		adminBtn:SetText(ADMINMODE.AdminModeText)
		adminBtn:SetFont("EntryFont")
		adminBtn:SetPos(15, 25)
		adminBtn:SetTextColor( Color( 255, 255, 255 ) )
		adminBtn.Paint = function( self, w, h )

			

			surface.SetDrawColor( Color(30, 39, 46, 200) )

    		surface.DrawRect( 0, 0, w, h )

    		surface.SetDrawColor( Color(19, 19, 19, 255) )

    		surface.DrawOutlinedRect( 0, 0, w, h )

    		if ply:GetModel() == ADMINMODE.PlayerModel then
    			surface.SetDrawColor( ADMINMODE.EnabledColor )
    			surface.DrawOutlinedRect( 0, 0, w, h )
    			adminBtn:SetTextColor( ADMINMODE.EnabledColor )
			else
    			surface.SetDrawColor( ADMINMODE.DisabledColor )
    			surface.DrawOutlinedRect( 0, 0, w, h )
			end
		end


		adminBtn.DoClick = function()


			if ply:GetModel() == ADMINMODE.PlayerModel then
				sound.Play("buttons/button14.wav", ply:GetPos())
				frame:Close()
				net.Start("UnAdminMode")
				net.SendToServer()
			else
				sound.Play("buttons/button14.wav", ply:GetPos())
				frame:Close()
				net.Start("AdminMode")
				net.SendToServer()
			end

			
/*
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("AdminMode")
			net.SendToServer()
			*/
		end
		/*
		local unadminBtn = vgui.Create("DButton",frame)
		unadminBtn:SetSize(75, 23)
		unadminBtn:SetText("Disable")
		unadminBtn:SetPos(15, 50)
		unadminBtn:SetFont("EntryFont")
		unadminBtn:SetTextColor( Color( 255, 255, 255 ) )
		unadminBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 245, 59, 59, 175 ) ) 
		end
		unadminBtn.DoClick = function()
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("UnAdminMode")
			net.SendToServer()
		end
		*/
		local cancelBtn = vgui.Create("DButton",frame)
		cancelBtn:SetSize(75, 23)
		cancelBtn:SetText("Cancel")
		cancelBtn:SetPos(30, 150)
		cancelBtn:SetFont("EntryFont")
		cancelBtn:SetTextColor( Color( 255, 255, 255 ) )
		cancelBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 30, 30, 200 ) ) 
		end
		cancelBtn.DoClick = function()
			sound.Play("buttons/button15.wav", ply:GetPos())
			frame:Close()
		end

		local cloakBtn = vgui.Create("DButton",frame)
		cloakBtn:SetSize(100, 23)
		cloakBtn:SetText(ADMINMODE.CloakText)
		cloakBtn:SetPos(15, 50)
		cloakBtn:SetFont("EntryFont")
		cloakBtn:SetTextColor( Color( 255, 255, 255 ) )
		cloakBtn.Paint = function( self, w, h )

			surface.SetDrawColor( Color(30, 39, 46, 200) )

    		surface.DrawRect( 0, 0, w, h )

    		surface.SetDrawColor( ADMINMODE.DisabledColor )

    		surface.DrawOutlinedRect( 0, 0, w, h )

			if ply:GetNoDraw() == true then
				surface.SetDrawColor( ADMINMODE.EnabledColor )
    			surface.DrawOutlinedRect( 0, 0, w, h )
    			cloakBtn:SetTextColor( ADMINMODE.EnabledColor )
			else
    			surface.SetDrawColor( ADMINMODE.DisabledColor )
    			surface.DrawOutlinedRect( 0, 0, w, h )
			end

		end
		cloakBtn.DoClick = function()

			if ply:GetNoDraw() == true then
				sound.Play("buttons/button14.wav", ply:GetPos())
				frame:Close()
				net.Start("UnCloak")
				net.SendToServer()
			else
				sound.Play("buttons/button14.wav", ply:GetPos())
				frame:Close()
				net.Start("Cloak")
				net.SendToServer()
			end
			/*
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("Cloak")
			net.SendToServer()
			*/
		end
		/*
		local uncloakBtn = vgui.Create("DButton",frame)
		uncloakBtn:SetSize(75, 23)
		uncloakBtn:SetText("Disable")
		uncloakBtn:SetPos(110, 50)
		uncloakBtn:SetFont("EntryFont")
		uncloakBtn:SetTextColor( Color( 255, 255, 255 ) )
		uncloakBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 245, 59, 59, 175 ) ) -- Draw a blue button
		end
		uncloakBtn.DoClick = function()
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("UnCloak")
			net.SendToServer()
		end
		*/
		local noTargetBtn = vgui.Create("DButton",frame)
		noTargetBtn:SetSize(100, 23)
		noTargetBtn:SetText(ADMINMODE.NoTargetText)
		noTargetBtn:SetPos(15, 75)
		noTargetBtn:SetFont("EntryFont")
		noTargetBtn:SetTextColor( Color( 255, 255, 255 ) )
		noTargetBtn.Paint = function( self, w, h )
			surface.SetDrawColor( Color(30, 39, 46, 200) )

    		surface.DrawRect( 0, 0, w, h )

    		surface.SetDrawColor( ADMINMODE.DisabledColor )

    		surface.DrawOutlinedRect( 0, 0, w, h )
			if ply:IsFlagSet( FL_NOTARGET ) == true then
				surface.SetDrawColor( ADMINMODE.EnabledColor )
    			surface.DrawOutlinedRect( 0, 0, w, h )
    			cloakBtn:SetTextColor( ADMINMODE.EnabledColor )
			else
    			surface.SetDrawColor( ADMINMODE.DisabledColor )
    			surface.DrawOutlinedRect( 0, 0, w, h )
				//print( ply:IsFlagSet( FL_NOTARGET ) )
			end
		end
		noTargetBtn.DoClick = function()
			//print( ply:IsFlagSet( FL_NOTARGET ) )
			if ply:IsFlagSet( FL_NOTARGET ) == true then
				sound.Play("buttons/button14.wav", ply:GetPos())
				frame:Close()
				net.Start("UnNoTarget")
				net.WriteEntity(ply)
				net.SendToServer()
				//print( ply:IsFlagSet( FL_NOTARGET ) )
			else
				sound.Play("buttons/button14.wav", ply:GetPos())
				frame:Close()
				net.Start("NoTarget")
				net.SendToServer()
				//print( ply:IsFlagSet( FL_NOTARGET ) )
			end
		end
		/*
		local unNoTargetBtn = vgui.Create("DButton",frame)
		unNoTargetBtn:SetSize(75, 23)
		unNoTargetBtn:SetText("Disable")
		unNoTargetBtn:SetPos(110, 100)
		unNoTargetBtn:SetFont("EntryFont")
		unNoTargetBtn:SetTextColor( Color( 255, 255, 255 ) )
		unNoTargetBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 245, 59, 59, 175 ) ) -- Draw a blue button
		end
		unNoTargetBtn.DoClick = function()
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("UnNoTarget")
			net.SendToServer()
		end
		*/

		local textBox = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
		textBox:SetPos( 15, 125 )
		textBox:SetSize( 101, 23 )
		textBox:SetFont( "BoxFont" )
		textBox:SetText( "Text" )

		if ADMINMODE.UsingDarkTheme == true then
			textBox:SetTextColor( Color( 255, 255, 255 ) )
		else
			textBox:SetTextColor( Color( 19, 19, 19 ) )
		end

		textBox.OnEnter = function( self )
			if table.HasValue(ADMINMODE.AnnouncementAccess, ply:GetNWString("usergroup")) then
				sound.Play("buttons/button14.wav", ply:GetPos())
			chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), textBox:GetValue())
			local NotifyPanel = vgui.Create( "DNotify" )
			NotifyPanel:SetPos( 15, 20 )
			NotifyPanel:SetSize( 500, 50 ) // w/h
			NotifyPanel:SetAlignment( 5 )
			NotifyPanel:SetLife(10)

			-- Gray background panel
			local bg = vgui.Create( "DPanel", NotifyPanel )
			bg:Dock( FILL )
			bg:SetBackgroundColor( Color( 21, 21, 21, 200 ) )

			-- A yellow label message ( parented to background panel )
			local lbl = vgui.Create( "DLabel", bg )
			lbl:SetPos( 100, 0 )
			lbl:SetSize( 295, 72 )
			lbl:SetText( textBox:GetValue() )
			lbl:SetTextColor( Color( 245, 59, 59 ) )
			lbl:SetFont( "Notification" )
			lbl:SetWrap( false )
			lbl:SetContentAlignment( 5 )

			local lbl = vgui.Create( "DLabel", bg )
			lbl:SetPos( 100, 0 )
			lbl:SetSize( 295, 72 )
			lbl:SetText( ADMINMODE.ChatName )
			lbl:SetTextColor( Color( 255, 255, 255 ) )
			lbl:SetFont( "NotificationTitle" )
			lbl:SetWrap( false )
			lbl:SetContentAlignment( 8 )

			-- Add the background panel to the notification
			NotifyPanel:AddItem( bg )
		else
			sound.Play("buttons/button11.wav", ply:GetPos())
			print("Denied Access")
		end

		end

		local physFreezeBtn = vgui.Create("DButton",frame)
		physFreezeBtn:SetSize(100, 23)
		physFreezeBtn:SetText("Announce")
		physFreezeBtn:SetPos(15, 100)
		physFreezeBtn:SetFont("EntryFont")
		physFreezeBtn:SetTextColor( Color( 255, 255, 255 ) )
		physFreezeBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 28, 28, 175 ) ) 
		end
		physFreezeBtn.DoClick = function()

			
			if table.HasValue(ADMINMODE.AnnouncementAccess, ply:GetNWString("usergroup")) then
				sound.Play("buttons/button14.wav", ply:GetPos())
			chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), textBox:GetValue())
			local NotifyPanel = vgui.Create( "DNotify" )
			NotifyPanel:SetPos( 15, 20 )
			NotifyPanel:SetSize( 500, 50 ) // w/h
			NotifyPanel:SetAlignment( 5 )
			NotifyPanel:SetLife(10)

			-- Gray background panel
			local bg = vgui.Create( "DPanel", NotifyPanel )
			bg:Dock( FILL )
			bg:SetBackgroundColor( Color( 21, 21, 21, 200 ) )

			-- A yellow label message ( parented to background panel )
			local lbl = vgui.Create( "DLabel", bg )
			lbl:SetPos( 100, 0 )
			lbl:SetSize( 295, 72 )
			lbl:SetText( textBox:GetValue() )
			lbl:SetTextColor( Color( 245, 59, 59 ) )
			lbl:SetFont( "Notification" )
			lbl:SetWrap( false )
			lbl:SetContentAlignment( 5 )

			local lbl = vgui.Create( "DLabel", bg )
			lbl:SetPos( 100, 0 )
			lbl:SetSize( 295, 72 )
			lbl:SetText( ADMINMODE.ChatName )
			lbl:SetTextColor( Color( 255, 255, 255 ) )
			lbl:SetFont( "NotificationTitle" )
			lbl:SetWrap( false )
			lbl:SetContentAlignment( 8 )

			-- Add the background panel to the notification
			NotifyPanel:AddItem( bg )


		else
			sound.Play("buttons/button11.wav", ply:GetPos())
			print("Denied Access")
		end
		end

		local xBtn = vgui.Create("DButton",frame)
		xBtn:SetText("X")
		xBtn:SetPos(115, 0)
		xBtn:SetSize(16, 18)
		xBtn:SetFont("EntryFont")
		xBtn:SetTextColor( Color( 255, 255, 255 ) )
		xBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 54, 54, 150 ) ) -- Draw a blue button
		end
		xBtn.DoClick = function()
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
		end
	else
		chat.AddText(Color(255, 255, 255), "[", Color(255, 36, 36), ADMINMODE.ChatName, Color(255, 255, 255), "] ", "Denied Access")
	end
end




net.Receive("AMLaunch", function( len )
	net.Start("AdminMode")
	net.SendToServer()
end)

net.Receive("AMApproved", function( len )
	chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), "Entered Admin Mode")
	print("[AdminMode] Approved!")
end)

net.Receive("UAMApproved", function( len )
	chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), "Exited Admin Mode")
	print("[AdminMode] Approved!")
end)

net.Receive("CloakApproved", function( len )
	chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), "Cloaked")
	print("[AdminMode] Approved!")
end)

net.Receive("UnCloakApproved", function( len )
	chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), "Uncloaked")
	print("[AdminMode] Approved!")
end)

net.Receive("NoTargetApproved", function( len )
	chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), "NPC NoTargeted (To turn off disable ", ADMINMODE.AdminModeText, ")")
	print("[AdminMode] Approved!")
end)

net.Receive("UnNoTargetApproved", function( len )
	chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), "NPC NoTarget Disabled")
	print("[AdminMode] Approved!")
end)

net.Receive("PhysFreezeApproved", function( len )
	chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), "Physgun Freeze Enabled")
	print("[AdminMode] Approved!")
end)

net.Receive("UnPhysFreezeApproved", function( len )
	chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), "Physgun Freeze Disabled")
	print("[AdminMode] Approved!")
end)

concommand.Add( "openadminmenu", OpenAdminMenu)