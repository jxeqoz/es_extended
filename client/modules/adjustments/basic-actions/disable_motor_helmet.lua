CreateThread(function()
  ESX.WaitForPlayerLoaded()
  local ped = cache.ped
  SetPedConfigFlag(ped, 184, true)
  SetPedHelmet(ped, false)
end)

lib.onCache('vehicle', function(vehicle)
  if vehicle then
    local ped = cache.ped
    RemovePedHelmet(ped, true)
    SetPedConfigFlag(ped, 35, false)
  end
end)
