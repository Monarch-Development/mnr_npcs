fx_version "cerulean"
game "gta5"
lua54 "yes"

name "mnr_npcs"
description "Optimized resource for NPCs management in your server"
author "IlMelons"
version "1.0.0"
repository "https://github.com/Monarch-Development/mnr_npcs"

shared_scripts {
    "@ox_lib/init.lua",
    "config/*.lua",
}

client_scripts {
    "client/*.lua",
}

server_scripts {
    "server/*.lua",
}