--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
----       Docs - https://docs.threeamigos.shop       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

local utils = {}

function utils.functionHere()
    print("This is the Utility file for client side. Use this for utility functions, or functions you need to spread across multiple files but still want to be localized.")
end

---@param action string The action you wish to target
---@param data any The data you wish to send along with this action
function utils.sendReactMessage(action, data)
    SendNUIMessage({
      action = action,
      data = data
    })
  end

return utils -- return the utils table. Accessible via Utils.*