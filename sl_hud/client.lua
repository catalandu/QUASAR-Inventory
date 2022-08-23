-- Leaked by Luxury Leaks
-- discord.gg/luxury-leaks
local ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		ESX.PlayerData = ESX.GetPlayerData()
	end
	TriggerEvent('esx:setMoneyDisplay', 0.0)
	ESX.UI.HUD.SetDisplay(0.0)
	SendNUIMessage({action = "setVoiceLevel", level = 1});
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(2)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(6)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer) 
	local data = xPlayer
	local accs = data.accounts
	for k, v in pairs(accs) do
		local accs = v
		if accs.name == "black_money" then
			if accos.money > 0 then
			SendNUIMessage({action = "setBlackMoney", blackmoney = accs.money})
			else
			SendNUIMessage({action = "hideBlackMoney"})
			end
		end
	end
	SendNUIMessage({action = "setMoney", money = data.money})
end)


RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
if account.name == "money" then

	SendNUIMessage({action = "setMoney", money = account.money})
	end
	if account.name == "black_money" then
		if account.money > 0 then
		SendNUIMessage({action = "setBlackMoney", blackmoney = account.money})
		else
		SendNUIMessage({action = "hideBlackMoney"})
		end
	end
end)

RegisterNetEvent('esx:activateMoney')
AddEventHandler('esx:activateMoney', function(e)
	SendNUIMessage({action = "setMoney", money = e})
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if IsPauseMenuActive() and not isPaused then
			isPaused = true
			SendNUIMessage({action = "hideHud"})
		elseif not IsPauseMenuActive() and isPaused then
			isPaused = false
			SendNUIMessage({action = "showHud"})
		end
	end
end)

RegisterNetEvent('SaltyChat_VoiceRangeChanged')
AddEventHandler('SaltyChat_VoiceRangeChanged', function(vr)
    if vre == 3 then
        SendNUIMessage({action = "setVoiceLevel", level = 1});
        TriggerEvent("sl_notify", "red", "NEUE REICHWEITE", "Deine Reichweite lautet: 3 Meter")
    elseif vr == 8 then
        SendNUIMessage({action = "setVoiceLevel", level = 2});
        TriggerEvent("sl_notify", "red", "NEUE REICHWEITE", "Deine Reichweite lautet: 8 Meter")
    elseif vr == 15 then
        SendNUIMessage({action = "setVoiceLevel", level = 3});
        TriggerEvent("sl_notify", "red", "NEUE REICHWEITE", "Deine Reichweite lautet: 15 Meter")
    end
end)

Citizen.CreateThread(function()
    ReplaceHudColourWithRgba(116,255,0,0,255)
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		local funk = exports['saltychat']:GetRadioChannel(true)
		if funk == nil or funk == '' then
			SendNUIMessage({
                action = "setFunk", 
                val = funk
            });
		else
			SendNUIMessage({
                action = "setFunk", 
                val = funk
            });
		end
	end
end)


RegisterNetEvent('SaltyChat_TalkStateChanged')
AddEventHandler('SaltyChat_TalkStateChanged', function(isTalking)
    if isTalking then
        SendNUIMessage({action = "setVoiceTalking", val = true});
    else
        SendNUIMessage({action = "setVoiceTalking", val = false});
    end
end)


RegisterNetEvent('SaltyChat_MicStateChanged')
AddEventHandler('SaltyChat_MicStateChanged', function(isMuted)

    if isMuted == true then
            SendNUIMessage({action = "muted", muted = true})
    else
            SendNUIMessage({action = "nomuted"})
    end
        
    if exports.saltychat:GetVoiceRange() == 3 then
        SendNUIMessage({action = "setVoiceLevel", level = 1});
    elseif exports.saltychat:GetVoiceRange() == 8 then
        SendNUIMessage({action = "setVoiceLevel", level = 2});
    elseif exports.saltychat:GetVoiceRange() == 15 then
        SendNUIMessage({action = "setVoiceLevel", level = 3});
    end

end)