ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local PlayerData = {}

--Insert your coordinates here
local coordx = 4890.39 
local coordy = -4925.58
local coordz = 3.4

Citizen.CreateThread(function()
	while true do
	Wait(20)
	local sleep = true
	local coords = GetEntityCoords(PlayerPedId())
		if (GetDistanceBetweenCoords(coords, coordx, coordy, coordz, true) < 5) then
			sleep = false
			ESX.ShowHelpNotification('Press ~INPUT_PICKUP~ to play ~g~Roulette')
				if IsControlJustPressed(0, 38) then
					bettaus22()
				end
		else
			sleep = true
		end
	if sleep then 
		Wait(1000)
	end
	end
end)



function bettaus22()
	maxLength = 5 --Maximum characters on betting (5 chars = 99999)
	AddTextEntry('FMMC_KEY_TIP8', "Insert ~y~Bet")
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", maxLength)
	blockinput = true
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
	Wait(0)
	end
	local osallistumismaksu = GetOnscreenKeyboardResult()
	osallistumismaksu = tonumber(osallistumismaksu)
	Wait(150)
	blockinput = false

	if osallistumismaksu ~= nil and osallistumismaksu > 0 then

       maxLength = 11
    AddTextEntry('FMMC_KEY_TIP8', "~r~Red ~b~|~m~ Black ~b~| ~g~Green")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", maxLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
    Wait(0)
    end
    local vari = GetOnscreenKeyboardResult()
    Wait(150)
    if vari == 'Red' or vari == 'Black' or vari == 'Green' then
    TriggerServerEvent('slerbaruletti:bettaa', osallistumismaksu, vari)
	else
	ESX.ShowNotification("~r~Invalid input")
    end
	Wait(12000)
	blockinput = false
  end
end