ESX = nil
TriggerEvent(config.GetESX, function(obj) ESX = obj end)

RegisterNetEvent("aknx:buyItem")
AddEventHandler("aknx:buyItem", function(label, item, price, amount)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    local totalPrice = price * amount
    if not config.isLimit then
        if xPlayer.getMoney() >= totalPrice then
            if xPlayer.canCarryItem(item, amount) then
                xPlayer.removeMoney(totalPrice)
                xPlayer.addInventoryItem(item, amount)
                TriggerClientEvent('esx:showNotification', _source, TRADUCTION.ITEM_BOUGHT.." "..amount.." "..item)
            else
                TriggerClientEvent('esx:showNotification', _source, TRADUCTION.PLAYER_CANNOT_HOLD)
            end
        else
            local missingMoney = totalPrice - xPlayer.getMoney()
            TriggerClientEvent('esx:showNotification', _source, TRADUCTION.NOT_ENOUGH.." "..missingMoney.."$")
        end
    else
        if xPlayer.getMoney() >= totalPrice then
            xPlayer.removeMoney(totalPrice)
            xPlayer.addInventoryItem(item, amount)
            TriggerClientEvent('esx:showNotification', _source, TRADUCTION.ITEM_BOUGHT.." "..amount.." "..label)
        else
            local missingMoney = totalPrice - xPlayer.getMoney()
            TriggerClientEvent('esx:showNotification', _source, TRADUCTION.NOT_ENOUGH.." "..missingMoney.."$")
        end
    end
end)