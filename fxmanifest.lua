fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"

lua54 'yes'
author 'riversafe'
description 'Campfire script'
version '1.0.0'


shared_scripts {
    'config.lua',
}
client_scripts {
    'client/animations.lua',
    'client/campfire.lua'
}
server_scripts {
    'server/server.lua',
}


dependencies {
    'vorp_progressbar'
}
