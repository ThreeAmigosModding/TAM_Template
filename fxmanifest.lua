--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
----       Docs - https://docs.threeamigos.shop       ----
---- Do not edit if you do not know what you"re doing ----
--]]------------------------------------------------------

game "gta5"
lua54 "yes"
fx_version "cerulean"
use_experimental_fxv2_oal "yes"

name "TAM_Template"
author "ThreeAmigosModding"
description "Resource Template to clone for ease of use.!"
version "1.0.0"

client_debug_mode "false"
server_debug_mode "false"
experimental_features_enabled "0"

files {
    "data/**",
    "modules/**/client.lua",
    "web/index.html",
    "web/script.js",
    "web/styles.css",
    "web/**/*",
    "locales/*.json",
    "audio/**",
    "stream/*.ytyp"
}

dependencies {
    "/server:7290",
    "/onesync",
    "ox_lib",
}

ui_page "web/index.html"

data_file "AUDIO_WAVEPACK" "audio"
data_file "AUDIO_SOUNDDATA" "audio/your_dat54.dat"
data_file "DLC_ITYP_REQUEST" "stream/PROPS.ytyp"

shared_scripts {
    "@ox_lib/init.lua",
    "shared/main.lua"
}

client_scripts {
    "client/main.lua"
}

server_scripts {
    "server/main.lua"
}