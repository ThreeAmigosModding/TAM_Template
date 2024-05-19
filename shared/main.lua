--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
----       Docs - https://docs.threeamigos.shop       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

if not lib then return error("ox_lib is either missing or outdated, please ensure you have the latest version installed! \n https://github.com/overextended/ox_lib/releases/latest") end

if not lib.checkDependency("ox_lib", '3.20.0') then return error("ox_lib is outdated! Please ensure you upgrade to the latest version! \n https://github.com/overextended/ox_lib/releases/latest") end

_ENV.LoadedResource = true
local bridgeResources = {
    ["ND_Core"] = "nd",
    ["es_extended"] = "esx",
    ["qb-core"] = "qb",
    ["qbx-core"] = "qbx",
    ["ox-core"] = "ox"
}

---@return string
local function getBridge()
    for resource, framework in pairs(bridgeResources) do
        if GetResourceState(resource):find("start") then
            lib.print.info(("Successfully loaded %s module!"):format(framework))
            if framework == 'qb' or framework == 'esx' then lib.print.warn(framework .. ' has not been fully tested. Use caution and report bugs.') end
            return ("modules.bridge.%s.%s"):format(framework, lib.context)
        end
    end
    lib.print.info("Successfully loaded standalone module!")
    return ("modules.bridge.standalone.%s"):format(lib.context)
end

local function printConsoleMsg(fail, reason)
    lib.print.info("-----------------------------------------------")
    lib.print.info("Loading TAM_Template")

    if fail then
        lib.print.error(reason)
        lib.print.error("Resource loading aborted")
        _ENV.LoadedResource = false
    else
        lib.locale()
        Config = require 'data.configuration'
        Bridge = require(getBridge())
        Utils = require(('modules.utils.%s'):format(lib.context))
        lib.print.info("Successfully loaded TAM_Template!")
        lib.print.info("Service Authenticated Successfully")
        lib.print.info("Thanks for your purchase!")
    end

    lib.print.info("Discord - discord.gg/YzC4Du7WYm")
    lib.print.info("Documenation - docs.threeamigos.shop")
    lib.print.info("Tebex - threeamigos.shop")
    lib.print.info("-----------------------------------------------")
end


if GetCurrentResourceName() ~= "TAM_Template" then
    printConsoleMsg(true, "Resource must be named TAM_Template to function properly! Aborting loadup.")
elseif not LoadResourceFile('TAM_Template', 'locales/en.json') then
    printConsoleMsg(true, "Error loading locales directory. Aborting loadup.")
elseif not LoadResourceFile('TAM_Template', 'modules/bridge/standalone/client.lua') then
    printConsoleMsg(true, "Error loading bridge module. Aborting loadup.")
elseif not LoadResourceFile('TAM_Template', 'audio/TAM_Template.awc') then
    printConsoleMsg(true, "Error loading audio. Aborting loadup.")
end

if _ENV.LoadedResource then
    printConsoleMsg(false)
end