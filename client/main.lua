--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
----       Docs - https://docs.threeamigos.shop       ----
---- Do not edit if you do not know what you"re doing ----
--]]------------------------------------------------------

if not _ENV.LoadedResource then return end -- Don't load if the resource failed loading.

local function toggleNuiFrame(shouldShow)
    SetNuiFocus(shouldShow, shouldShow)
    Utils.sendReactMessage('setVisible', shouldShow)
end

RegisterCommand('show-nui', function()
    toggleNuiFrame(true)
    lib.print.debug('Show NUI frame')
end)

RegisterNUICallback('hideFrame', function(_, cb)
    toggleNuiFrame(false)
    lib.print.debug('Hide NUI frame')
    cb({})
end)

RegisterNUICallback('getClientData', function(data, cb)
    lib.print.debug('Data sent by React', json.encode(data))

    local curCoords = GetEntityCoords(PlayerPedId())

    local retData <const> = { x = curCoords.x, y = curCoords.y, z = curCoords.z }
    cb(retData)
end)
