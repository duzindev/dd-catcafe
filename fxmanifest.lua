name "dd-catcafe"
author "DUDU"
version "v1.0.0"
description "Sistema completo de Restaurante com crafting"
fx_version "cerulean"
game "gta5"

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/*.lua',
}

server_scripts {
    'server/server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
     --'@prism_uipack/init.lua', --Opcional, apenas se for usar o prism_uipack para o menu.
    'config.lua',
}