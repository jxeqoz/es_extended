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

function ESX.TriggerServerCallback(name, cb, ...)
  local result = lib.callback.await(name, false, ...)

  if type(result) == 'table' and result.__esx_callback then
    result = result.values or {}
  else
    result = { result }
  end

  if cb then
    cb(table.unpack(result, 1, result.n or #result))
  else
    return table.unpack(result, 1, result.n or #result)
  end
end
