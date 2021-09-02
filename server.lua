-- Config --

webhookUrl = 'https://discord.com/api/webhooks/883091087693066270/Yuk9blSYGRsBSSFCgizaN0H4LF_A9ob1uKtrMzEoB9LqcokzIb7j10FVATaZiM51p8fO' --Should log thu Discord webhook ;p 
callBlips = true -- If you change this to "false", it will turn off the circle that is created when you use the /911 
disableCallsInChat = false -- If you change this to "false", it will turn off chat calls!



-- Do not change anything

RegisterServerEvent('call911')
AddEventHandler('call911', function(location, msg, x, y, z, name, p)
	
	local pName = GetPlayerName(source)
	local p = GetPlayerPed(source)

		if disableCallsInChat == false then
				TriggerClientEvent('chatMessage', -1, '^5----------------------------------------------', {0, 255, 238})
				TriggerClientEvent('chatMessage', -1, '^*^5New 911 Report:', {0, 255, 238})
				TriggerClientEvent('chatMessage', -1, '   ^*^5[Caller Name]^r^7', {0, 255, 238}, pName .. " (" .. source .. ")")
				TriggerClientEvent('chatMessage', -1, '   ^*^5[Location]^r^7', {0, 255, 238}, location)
				TriggerClientEvent('chatMessage', -1, '   ^*^5[Report]^r^7', {0, 255, 238}, msg)
				TriggerClientEvent('chatMessage', -1, '^5----------------------------------------------', {0, 255, 238})
			end
			sendDiscord('911 Call Logger \n', '**Caller Name: **' .. pName .. ' (' .. source .. ') \n**  Location: **' .. location .. '\n**  Report: **' .. msg)
		
		if callBlips == true then
				TriggerClientEvent('setBlip', -1, name, x, y, z)
		end
end)

--------------------- Functions -----------------------


function sendDiscord(name, message)
	local content = {
        {
        	["color"] =  "5263615",
            ["title"] = "**New 911 Report**",
            ["description"] = message,
        }
    }
  	PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end


--------------------------------------------------------

	
