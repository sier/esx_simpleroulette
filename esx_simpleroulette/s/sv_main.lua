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
		TriggerClientEvent('esx:showNotification', _source, _U('bet') .. osallistumismaksu .."$")
		Wait(3000)
		TriggerClientEvent('esx:showNotification', _source, _U('rolling'))
		Wait(3000)
		TriggerClientEvent('esx:showNotification', _source, _U('spin'))
		Wait(2600)
		TriggerClientEvent('esx:showNotification', _source, _U('slowing'))
		Wait(2000)
        if vari == _U('ifred') then
			if roll >= 18 and roll <= 36 then
				TriggerClientEvent('esx:showNotification', _source, _U('red'))
				Wait(200)
				maksu = osallistumismaksu*2
				xPlayer.addAccountMoney('bank', maksu) 
				TriggerClientEvent('esx:showNotification', _source, _U('won') ..maksu..'$')
			else
				TriggerClientEvent('esx:showNotification', _source, _U('stoppedblack'))
				TriggerClientEvent('esx:showNotification', _source, _U('lose'))
			end
        elseif vari == _U('ifblack') then
			if roll >= 1 and roll <= 17 then
			TriggerClientEvent('esx:showNotification', _source, _U('black'))
			Wait(200)
			maksu = osallistumismaksu*2
            xPlayer.addAccountMoney('bank', maksu) 
            TriggerClientEvent('esx:showNotification', _source, _U('won') ..maksu..'$')
        else
			TriggerClientEvent('esx:showNotification', _source, _U('stoppedred'))
            TriggerClientEvent('esx:showNotification', _source, _U('lose'))
        end
        elseif vari == _U('ifgreen') then
			if roll == 37 then
				TriggerClientEvent('esx:showNotification', _source, _U('green'))
				Wait(200)
				maksu = osallistumismaksu*14
				xPlayer.addAccountMoney('bank', maksu) 
				TriggerClientEvent('esx:showNotification', _source, _U('won') ..maksu..'$')
			else
				TriggerClientEvent('esx:showNotification', _source, _U('losefinal'))
        end
	end
	else
		TriggerClientEvent('esx:showNotification', _source, _U('enoughmoney'))
    end
end)