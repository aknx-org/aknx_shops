local open = false
local mainMenu = RageUI.CreateMenu("Supérette", "Magasin")
mainMenu.Closed = function()
    open = false
    RageUI.Visible(mainMenu, false)
end

function openSuperette()
    if open then
        open = false
        RageUI.Visible(mainMenu, false)
    else
        open = true
        RageUI.Visible(mainMenu, true)

        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(mainMenu, function()
                    
                end)
                Wait(1)
            end
        end)
    end
end


Citizen.CreateThread(function()
    while true do
        local pNear = false

        for k,v in pairs(config.zones) do 
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v)
            local marker = config.marker

            if distance <= 2.0 then
                pNear = true
                if marker.haveMarker then
                    DrawMarker(marker.ID, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, marker.Size, marker.Size, marker.Size, marker.Color[1], marker.Color[2], marker.Color[3], marker.Alpha, 0, 1, 2, 0, nil, nil, 0)
                end
                ESX.ShowHelpNotification("Appuyer sur [E] pour ouvrir la Superette")
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