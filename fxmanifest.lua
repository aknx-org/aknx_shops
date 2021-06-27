fx_version 'bodacious'

game 'gta5'

shared_scripts {
    'config.lua',
    'traduction.lua',
}

client_scripts {
    -- RageUI
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
    --
    'client/main.lua',
    'client/menu.lua',
}

server_scripts {
    'server.lua',
}
