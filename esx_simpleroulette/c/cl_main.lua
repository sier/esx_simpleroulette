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
			ESX.ShowHelpNotification(_U('pickup'))
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
	AddTextEntry('FMMC_KEY_TIP8', _U('insertbet'))
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
    AddTextEntry('FMMC_KEY_TIP8', _U('colors'))
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", maxLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
    Wait(0)
    end
    local vari = GetOnscreenKeyboardResult()
    Wait(150)
    if vari == _U('ifred') or vari == _U('ifblack') or vari == _U('ifgreen') then
    TriggerServerEvent('slerbaruletti:bettaa', osallistumismaksu, vari)
	else
	ESX.ShowNotification(_U('invalid'))
    end
	Wait(12000)
	blockinput = false
  end
end