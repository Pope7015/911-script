----------- Config ------------


chatSuggestion = true 
blipTime = 180 
blipRadius = 175.0 



if chatSuggestion then
TriggerEvent("chat:addSuggestion", "/911", "Call 911 for your emergency!", {
    { name = "Report", help = "Enter your report here!"}
})
end

RegisterCommand('911', function(source, args)
    
local name = GetPlayerName(PlayerId())
local ped = GetPlayerPed(PlayerId())
local x, y, z = table.unpack(GetEntityCoords(ped, true))
local street = GetStreetNameAtCoord(x, y, z)
local location = GetStreetNameFromHashKey(street)
local msg = table.concat(args, ' ')

    if args[1] == nil then
        TriggerEvent('chatMessage', '^5Ohio State  911', {255, 255, 255}, 'What is the nature and location of your emergency?')
    end
    if args[1] ~= nil then
        TriggerServerEvent('call911', location, msg, x, y, z, name)
    end
end)

RegisterNetEvent('setBlip')
AddEventHandler('setBlip', function(name, x, y, z)

blip = nil
blips = {}

local blip = AddBlipForRadius(x, y, z, blipRadius)

	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 3)
	SetBlipAlpha (blip, 128)

local blip1 = AddBlipForCoord(x, y, z)

	SetBlipSprite (blip1, sprite)
	SetBlipDisplay(blip1, true)
	SetBlipScale  (blip1, 0.9)
	SetBlipColour (blip1, 3)
    SetBlipAsShortRange(blip1, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("911 - " .. name)
    EndTextCommandSetBlipName(blip1)
    table.insert(blips, blip1)
    Wait(blipTime * 1000)
    for i, blip1 in pairs(blips) do 
        RemoveBlip(blip)
        RemoveBlip(blip1)

    end
end)




