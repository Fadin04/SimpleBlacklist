fx_version 'cerulean'
game 'gta5'

author 'Fadin_laws'
description 'Blacklist vehicles & peds via ace permissions'
version 'v1.0.0'
repository 'https://github.com/Fadin04/SimpleBlacklist'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/client.lua',
}

server_scripts {
    'server/server.lua',
    'server/version_server.lua',
}

data_files {
    'data/ammoTypes.lua',
    'data/vehicles.lua',
    'data/weapons.lua',
}