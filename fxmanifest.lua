fx_version('cerulean')
game('gta5')
lua54 'yes'

name 'kLib'
author "Koaio"
version '1.0.0'
repository 'https://github.com/Koaio/kBlackMarket'
description "."

shared_script 'config.lua'

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
    
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}