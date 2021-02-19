ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local maksu = 0
RegisterServerEvent('slerbaruletti:bettaa')
AddEventHandler('slerbaruletti:bettaa', function(osallistumismaksu, vari)
    local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
    local roll = math.random(0,37)
    if xPlayer.getAccount('bank').money >= osallistumismaksu then
        xPlayer.removeAccountMoney('bank', tonumber(osallistumismaksu))
		TriggerClientEvent('esx:showNotification', _source, 'Your bet: ~g~' .. osallistumismaksu .."$")
		Wait(3000)
		TriggerClientEvent('esx:showNotification', _source, '~m~Ball is ~w~rolling...')
		Wait(3000)
		TriggerClientEvent('esx:showNotification', _source, '~o~You spin me right round...')
		Wait(2600)
		TriggerClientEvent('esx:showNotification', _source, '~m~Ball is ~w~slowing down...')
		Wait(2000)
        if vari == 'Red' then
			if roll >= 18 and roll <= 36 then
				TriggerClientEvent('esx:showNotification', _source, '~m~The ball ~w~ stopped on color: ~r~~h~Red~h~~w~.')
				Wait(200)
				maksu = osallistumismaksu*2
				xPlayer.addAccountMoney('bank', maksu) 
				TriggerClientEvent('esx:showNotification', _source, '~g~You won: ' ..maksu..'$')
			else
				TriggerClientEvent('esx:showNotification', _source, 'The ball stopped on color: ~h~~u~ Black~h~~w~.')
				TriggerClientEvent('esx:showNotification', _source, "~r~You lose!")
			end
        elseif vari == 'Black' then
			if roll >= 1 and roll <= 17 then
			TriggerClientEvent('esx:showNotification', _source, 'The ball stopped on color: ~u~~h~Black~h~~w~.')
			Wait(200)
			maksu = osallistumismaksu*2
            xPlayer.addAccountMoney('bank', maksu) 
            TriggerClientEvent('esx:showNotification', _source, '~g~You won: ' ..maksu..'$')
        else
			TriggerClientEvent('esx:showNotification', _source, 'The ball stopped on color: ~h~~r~Red~h~~w~.')
            TriggerClientEvent('esx:showNotification', _source, "~r~You lose.")
        end
        elseif vari == 'Green' then
			if roll == 37 then
				TriggerClientEvent('esx:showNotification', _source, 'The ball stopped on color: ~g~~h~Green~h~~w~.')
				Wait(200)
				maksu = osallistumismaksu*14
				xPlayer.addAccountMoney('bank', maksu) 
				TriggerClientEvent('esx:showNotification', _source, '~g~You won: ' ..maksu..'$')
			else
				TriggerClientEvent('esx:showNotification', _source, 'The ball stopped on color: ~h~~r~Red~h~~w~.~n~ ~r~You lose, again. ~w~Better luck next time')
        end
	end
	else
		TriggerClientEvent('esx:showNotification', _source, 'You do not have enough money in bank.')
    end
end)