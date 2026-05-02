--[[
    _________________________________________
   |    __      _                            |
   |  o'')}____//      D O G E A T E R X     |
   |   `_/      )      Development           |
   |   (_(_/-(_/                             |
   |_________________________________________|

  Discord : https://discord.gg/Pnsta3xnZX

  ⚠  OUR CODE | THANKS FOR YOUR TRUSTED
--]]

---@param name string
---@param cb fun(source: integer, cb: fun(...), ...)
function ESX.RegisterServerCallback(name, cb)
  lib.callback.register(name, function(source, ...)
    local args = { ... }
    local result = {}
    local p = promise.new()
    local resolved = false

    local returned = table.pack(cb(source, function(...)
      result = table.pack(...)
      if not resolved then
        resolved = true
        p:resolve()
      end
    end, table.unpack(args)))

    if not resolved and returned.n > 0 then
      result = returned
      resolved = true
      p:resolve()
    end

    Citizen.Await(p)

    return {
      __esx_callback = true,
      values = result,
    }
  end)
end
