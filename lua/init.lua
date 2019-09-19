util.AddNetworkString("AdminMode")
util.AddNetworkString("UnAdminMode")
util.AddNetworkString("AMApproved")
util.AddNetworkString("UAMApproved")
util.AddNetworkString("AMLaunch")
util.AddNetworkString("Cloak")
util.AddNetworkString("UnCloak")
util.AddNetworkString("CloakApproved")
util.AddNetworkString("UnCloakApproved")


hook.Add("PlayerSay", "AdminLaunch", function(calling, txt, t, ply)
    local args = string.lower(txt)
    if(txt == "!adminmode") then
    	for _, ply in pairs(player.GetAll()) do
            net.Start("AMLaunch")
			net.Send(ply)
        end
        
    end
end)
function cloak(e)
  e:SetNoDraw(true)
end
function uncloak(e)
  e:SetNoDraw(false)
end
net.Receive("AdminMode", function(len, ply)

	print("[Log] " .. ply:Nick() .. " Called AdminMode!")


	if table.HasValue(ADMINMODE.Groups, ply:GetNWString("usergroup")) then
        print("[Log] " .. ply:Nick() .. " was approved!")
        print("[Log] Name - " .. ply:Nick() .. " | IP - " .. ply:IPAddress() .. " | Steam ID - " .. ply:SteamID())

        ply:SetModel( ADMINMODE.PlayerModel )
		
		--[[ply:SetNoDraw(true)

        // Cloaking Admin
        if IsValid(ply:GetActiveWeapon()) then
			cloak(ply:GetActiveWeapon())
		end
		for a,b in ipairs(ents.FindByClass("physgun_beam")) do
			if b:GetParent() == ply then
				b:SetNoDraw(true)
			end
		end]]

        ply:SetPlayerColor( Vector( 0,0,0 ) )
        net.Start("AMApproved")
        net.Send(ply)

        ply:GodEnable()
        if ( desiredNoClipState ) then
        else
            RunConsoleCommand("ulx", "noclip", ply:Nick())
        end

    else
    	print("[Log] " .. ply:Nick() .. " was Denied!")
    end
end)

net.Receive("UnAdminMode", function(len, ply, desiredNoClipState)

	print("[Log] " .. ply:Nick() .. " Called UnAdminMode!")


	if table.HasValue(ADMINMODE.Groups, ply:GetNWString("usergroup")) then
        print("[Log] " .. ply:Nick() .. " exited AdminMode!")
        print("[Log] Name - " .. ply:Nick() .. " | IP - " .. ply:IPAddress() .. " | Steam ID - " .. ply:SteamID())
		net.Start("UAMApproved")
        net.Send(ply)
        if ( desiredNoClipState ) then
        	RunConsoleCommand("noclip", ply:Nick())
		else
		end
		ply:GodDisable()
        location = ply:GetPos()
        ply:KillSilent()
        ply:Spawn()
        ply:SetPos( location )

    else
    	print("[Log] " .. ply:Nick() .. " was Denied!")
    end
end)

net.Receive("Cloak", function(len, ply)
    if table.HasValue(ADMINMODE.Groups, ply:GetNWString("usergroup")) then
        
        ply:SetNoDraw(true)
        // Cloaking Admin
        if IsValid(ply:GetActiveWeapon()) then
            cloak(ply:GetActiveWeapon())
        end
        for a,b in ipairs(ents.FindByClass("physgun_beam")) do
            if b:GetParent() == ply then
                b:SetNoDraw(true)
            end
        end
        net.Start("CloakApproved")
        net.Send(ply)

    else
        print("[Log] " .. ply:Nick() .. " was Denied!")
    end
end)

net.Receive("UnCloak", function(len, ply)
    if table.HasValue(ADMINMODE.Groups, ply:GetNWString("usergroup")) then
        
        ply:SetNoDraw(false)
        // Cloaking Admin
        if IsValid(ply:GetActiveWeapon()) then
            uncloak(ply:GetActiveWeapon())
        end
        for a,b in ipairs(ents.FindByClass("physgun_beam")) do
            if b:GetParent() == ply then
                b:SetNoDraw(false)
            end
        end
        net.Start("UnCloakApproved")
        net.Send(ply)

    else
        print("[Log] " .. ply:Nick() .. " was Denied!")
    end
end)

hook.Add("PlayerButtonDown", "emergencynotif", function(ply, key)
    
    if key == ADMINMODE.KeyBind then
		if table.HasValue(ADMINMODE.Groups, ply:GetNWString("usergroup")) then
			ply:ConCommand( "openadminmenu" )
		else
			print("[AdminMode] Denied Access to ".. ply:Nick())
		end
    end 
    
end)