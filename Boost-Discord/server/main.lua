ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Boost-Discord:UpdatePresence')
AddEventHandler('Boost-Discord:UpdatePresence', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local data = {
		['PlayerName'] = GetPlayerName(source),
		['IdentityName'] = xPlayer.getName(),
		['Job'] = {jobName = xPlayer.getJob().name, jobGrade = xPlayer.getJob().grade_label, jobLabel = xPlayer.getJob().label},
		['ActivePlayers'] = GetNumPlayerIndices()
	}

    TriggerClientEvent('Boost-Discord:SetPresence',_source,data)
end)
