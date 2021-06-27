ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(config.GetESX, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        local pNear = false

        for k,v in pairs(config.zones) do 
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v)
            local marker = config.marker

            if distance <= 2.0 then
                pNear = true
                if marker.haveMarker then
                    DrawMarker(marker.ID, v+0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, marker.Size, marker.Size, marker.Size, marker.Color[1], marker.Color[2], marker.Color[3], marker.Alpha, 0, 1, 2, 0, nil, nil, 0)
                end
                ESX.ShowHelpNotification(TRADUCTION.PRESS_MENU)
                if IsControlJustReleased(0, 38) then
                    openSuperette()
                end
            end
        end
        if pNear then
            Wait(1)
        else
            Wait(250)
        end
    end
end)