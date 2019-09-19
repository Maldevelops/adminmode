function OpenAdminMenu(ply)

	if table.HasValue(ADMINMODE.Groups, ply:GetNWString("usergroup")) then
		local frame = vgui.Create("DFrame")

		frame:SetSize(200,125)
		frame:SetTitle("AdminMode")
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
			frame:Close()
			net.Start("UnAdminMode")
			net.SendToServer()
		end

		local cancelBtn = vgui.Create("DButton",frame)
		cancelBtn:SetText("Cancel")
		cancelBtn:SetPos(70, 90)
		cancelBtn:SetTextColor( Color( 255, 255, 255 ) )
		cancelBtn.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 30, 30, 200 ) ) 
		end
		cancelBtn.DoClick = function()
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
			frame:Close()
			net.Start("UnCloak")
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

concommand.Add( "openadminmenu", OpenAdminMenu)