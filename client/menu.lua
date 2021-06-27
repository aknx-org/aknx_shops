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