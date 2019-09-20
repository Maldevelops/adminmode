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
		frame:SetSize(200,175)
		frame:SetTitle("AdminMode by Soul Networks")
		frame:ShowCloseButton(false)
		frame:SetVisible(true)
		frame:Center()
		frame:MakePopup()
		frame.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
			draw.RoundedBox( 0, 0, 0, w, h, Color( 23, 23, 23, 200 ) ) -- Draw a red box instead of the frame
		end



		local adminBtn = vgui.Create("DButton",frame)
		adminBtn:SetText("Enable")
		adminBtn:SetPos(20, 25)
		adminBtn:SetTextColor( Color( 255, 255, 255 ) )
		adminBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 64, 227, 85, 175 ) ) -- Draw a blue button
		end
		adminBtn.DoClick = function()
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("AdminMode")
			net.SendToServer()
		end

		local unadminBtn = vgui.Create("DButton",frame)
		unadminBtn:SetText("Disable")
		unadminBtn:SetPos(20, 50)
		unadminBtn:SetTextColor( Color( 255, 255, 255 ) )
		unadminBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 36, 36, 175 ) ) 
		end
		unadminBtn.DoClick = function()
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("UnAdminMode")
			net.SendToServer()
		end

		local cancelBtn = vgui.Create("DButton",frame)
		cancelBtn:SetText("Cancel")
		cancelBtn:SetPos(70, 130)
		cancelBtn:SetTextColor( Color( 255, 255, 255 ) )
		cancelBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 30, 30, 200 ) ) 
		end
		cancelBtn.DoClick = function()
			sound.Play("buttons/button15.wav", ply:GetPos())
			frame:Close()
		end

		local cloakBtn = vgui.Create("DButton",frame)
		cloakBtn:SetText("Cloak")
		cloakBtn:SetPos(110, 25)
		cloakBtn:SetTextColor( Color( 255, 255, 255 ) )
		cloakBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 3, 102, 252, 175 ) ) -- Draw a blue button
		end
		cloakBtn.DoClick = function()
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("Cloak")
			net.SendToServer()
		end

		local uncloakBtn = vgui.Create("DButton",frame)
		uncloakBtn:SetText("Uncloak")
		uncloakBtn:SetPos(110, 50)
		uncloakBtn:SetTextColor( Color( 255, 255, 255 ) )
		uncloakBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 252, 140, 3, 175 ) ) -- Draw a blue button
		end
		uncloakBtn.DoClick = function()
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("UnCloak")
			net.SendToServer()
		end
		local noTargetBtn = vgui.Create("DButton",frame)
		noTargetBtn:SetText("NoTarget")
		noTargetBtn:SetPos(110, 75)
		noTargetBtn:SetTextColor( Color( 255, 255, 255 ) )
		noTargetBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 71, 61, 255, 175 ) ) -- Draw a blue button
		end
		noTargetBtn.DoClick = function()
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("NoTarget")
			net.SendToServer()
		end
		local unNoTargetBtn = vgui.Create("DButton",frame)
		unNoTargetBtn:SetText("UnNoTarget")
		unNoTargetBtn:SetPos(110, 100)
		unNoTargetBtn:SetTextColor( Color( 255, 255, 255 ) )
		unNoTargetBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 25, 75, 107, 175 ) ) -- Draw a blue button
		end
		unNoTargetBtn.DoClick = function()
			sound.Play("buttons/button14.wav", ply:GetPos())
			frame:Close()
			net.Start("UnNoTarget")
			net.SendToServer()
		end

		local textBox = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
		textBox:SetPos( 10, 100 )
		textBox:SetSize( 90, 22 )
		textBox:SetText( "Text" )
		textBox.OnEnter = function( self )
			chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), self:GetValue())	-- print the form's text as server text

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
			lbl:SetText( self:GetValue() )
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

		end

		local physFreezeBtn = vgui.Create("DButton",frame)
		physFreezeBtn:SetText("Announce")
		physFreezeBtn:SetPos(20, 75)
		physFreezeBtn:SetTextColor( Color( 255, 255, 255 ) )
		physFreezeBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 120, 239, 175 ) ) 
		end
		physFreezeBtn.DoClick = function()
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
		end
		
		

		frametitle = frame:GetTitle()

		if frametitle == "AdminMode by Soul Networks" then
			return 
		else
			function textstuff()
				chat.AddText(Color(255, 66, 66), "AdminMode Authenticator", Color(255, 255, 255), " - Tampered Addon")
			end
			timer.Create("timer", 1, 0, textstuff )
			net.Start("Title")
			net.SendToServer()
			
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
	chat.AddText(Color(40, 40, 40), "", Color(255, 60, 60), ADMINMODE.ChatName, Color(40, 40, 40), " ▶ ", Color(255, 255, 255), "NPC NoTarget Enabled")
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