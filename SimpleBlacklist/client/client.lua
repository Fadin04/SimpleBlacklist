Restricted = nil

local ClientBlacklist = {
  VehicleConfig = {},
  PedConfig = {},
  WeaponConfig = {},
}

local ClientLastModel = GetHashKey('a_m_y_hipster_01')
for i, v in ipairs(WeaponAmmoBannedTypes) do
  WeaponAmmoBannedTypes[v] = true
  WeaponAmmoBannedTypes[i] = nil
end

RegisterNetEvent('SimpleBlacklist:setClientBlacklist')
AddEventHandler('SimpleBlacklist:setClientBlacklist', function (blacklist)
  ClientBlacklist = blacklist
end)

AddEventHandler('playerSpawned', function ()
  TriggerServerEvent('SimpleBlacklist:getClientBlacklist')
end)

TriggerServerEvent('SimpleBlacklist:getClientBlacklist')

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(500)
    local ped = PlayerPedId()
    local veh
    if IsPedInAnyVehicle(ped, false) then
      veh = GetVehiclePedIsUsing(ped)
    else
      veh = GetVehiclePedIsTryingToEnter(ped)
    end
    if veh and DoesEntityExist(veh) then
      local hash = GetEntityModel(veh)
      local driver = GetPedInVehicleSeat(veh, -1)
      if not VehicleDriverBlacklist or driver == ped then
        local confirm = ClientBlacklist.VehicleConfig[hash]
        if Inverted then confirm = not confirm end
        if confirm then
          DeleteEntity(veh)
          ClearPedTasksImmediately(ped)
          ShowNotification(VehicleBlacklistMessage)
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(5000)
    local ped = GetPlayerPed(-1)
    local hash = GetEntityModel(ped)
    local confirm = ClientBlacklist.PedConfig[hash]
    if Inverted then confirm = not confirm end
    if confirm then
      RequestModel(ClientLastModel)
      while not HasModelLoaded(ClientLastModel) do
        Citizen.Wait(400)
      end
      SetPlayerModel(PlayerId(), ClientLastModel)
      ShowNotification(PedBlacklistMessage)
    else
      ClientLastModel = hash
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    local ped = GetPlayerPed(-1)
    local _, hash = GetCurrentPedWeapon(ped, true)
    local confirm = ClientBlacklist.WeaponConfig[hash] or WeaponAmmoBannedTypes[GetPedAmmoTypeFromWeapon(ped, hash)]
    if Inverted then confirm = not confirm end
    if confirm then
      RemoveWeaponFromPed(ped, hash)
      ShowNotification(WeaponBlacklistMessage)
    end
  end
end)

function ShowNotification(message)
  SetNotificationTextEntry('STRING')
  AddTextComponentSubstringPlayerName(message)
  DrawNotification(true, true)
end