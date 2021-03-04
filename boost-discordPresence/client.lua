ESX = nil
local jobGrade = ''
local job = ''
local playerName = nil
local playerLoaded = false
local firstSpawn = true
-- ESX Stuff----
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	playerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('discord:client:setPresence')
AddEventHandler('discord:client:setPresence', function(_playerName)
	playerName = _playerName
   	SetRichPresence('ID:' .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. ' | ' .. playerName .. ' | ' ..' '.. Config.PlayerText ..' ' .. #GetActivePlayers() .. '/' .. tostring(Config.PlayerCount))
end)

AddEventHandler('playerSpawned', function()
 if firstSpawn then
    for _, v in pairs(Config.Buttons) do
          SetDiscordRichPresenceAction(v.index, v.name, v.url)
    end
    firstSpawn = false
 end	
end)

Citizen.CreateThread(function()
	while true do			
		
		-- Checking if player is loaded	
		if playerLoaded then
			if ESX.PlayerData.job then
			 		--Setting players image to reflect their job
					SetDiscordRichPresenceAssetSmall(ESX.PlayerData.job.name)
					job = ESX.PlayerData.job.label
					jobGrade = ESX.PlayerData.job.grade_label
					--Setting the job text
					SetDiscordRichPresenceAssetSmallText(job .. " - " .. jobGrade)	
				else			
				Citizen.Wait(500)
			end
		end					
			
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(Config.ClientID)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('largeimage')
		
		
		
		if Config.UseESXIdentity and playerLoaded then			
			TriggerServerEvent(('discord:server:setName'))
		else
			SetRichPresence('ID:' .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. ' | ' .. GetPlayerName(PlayerId()) .. ' | ' ..' '.. Config.PlayerText ..' ' .. #GetActivePlayers() .. '/' .. tostring(Config.PlayerCount))
        end

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('SalsaRP')
	
        --It updates every five seconds just in case.
		Citizen.Wait(Config.ResourceTimer*1000)
	end
end)
