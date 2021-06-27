local open = false
local mainMenu = RageUI.CreateMenu("Supérette", "Magasin")
mainMenu.Closed = function()
    open = false
    RageUI.Visible(mainMenu, false)
end
local payement = RageUI.CreateSubMenu(mainMenu, "Supérette", "Magasin")
local index = 1
local max = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

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

                RageUI.IsVisible(payement, function()
                    RageUI.List("Combien de "..shop_label.." ?", max, index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            index = Index
                        end
                    })
                    RageUI.Button("Acheter "..index.. " "..shops_label.." pour "..shops_price * index.." ?", nil, {}, true, {

                    })
                end)
                Wait(1)
            end
        end)
    end
end