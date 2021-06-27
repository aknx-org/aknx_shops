RegisterNetEvent("aknx:buyItem")
AddEventHandler("aknx:buyItem", function(label, item, price, amount)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    local totalPrice = price * amount

    if xPlayer.getMoney() >= totalPrice then
        if xPlayer.canCarryItem(item, amount) then
            xPlayer.removeMoney(totalPrice)
            xPlayer.addInventoryItem(item, amount)
            TriggerClientEvent('esx:showNotification', _source, "")
        else

        end
    else

    end
end)