fx_version 'cerulean'
game 'gta5'

name 'dd-catcafe'
author 'DUDU'
version 'v1.0.0'
description 'Sistema completo de Cat Café com crafting, gatos interativos e sistema de assentos.'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'cats.lua',
    'chairs.lua',
    'client.lua',
}

server_scripts {
    'server.lua',
}