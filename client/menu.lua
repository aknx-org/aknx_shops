local open = false
local mainMenu = RageUI.CreateMenu("Supérette", "Magasin")
mainMenu.Closed = function()
    open = false
    RageUI.Visible(mainMenu, false)
end
local payement = RageUI.CreateSubMenu(mainMenu, "Supérette", "Magasin")

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
                    for k,v in pairs(config.items) do
                        RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.." $"}, true, {
                            onSelected = function()
                                shop_label = v.label
                                shop_item = v.name
                                shop_price = v.price
                            end
                        }, payement)
                    end
                end)
                Wait(1)
            end
        end)
    end
end