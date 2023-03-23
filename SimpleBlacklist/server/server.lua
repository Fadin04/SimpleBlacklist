local restrictions = {}
local Categories = { 'VehicleConfig', 'PedConfig', 'WeaponConfig' }

for _, category in ipairs(Categories) do
  local restriction = { locked = {} }
  for ace, bl in pairs(Restricted[category]) do
    if type(bl) ~= 'table' then
      restriction.locked[bl] = true
    else
      if not restriction[ace] then
        restriction[ace] = {}
      end
      for _, hash in pairs(bl) do
        restriction[ace][hash] = true
      end
    end
  end

  
  local lastAce
  for parent, child in pairs(Inherits) do
    if type(parent) == 'number' then
      if lastAce then
        ExecuteCommand('add_ace ' .. Prefix .. '.' .. lastAce .. '.' .. category .. ' ' .. Prefix .. '.' .. child .. '.' .. category .. ' allow')
      end
      lastAce = child
    else
      ExecuteCommand('add_ace ' .. Prefix .. '.' .. parent .. '.' .. category .. ' ' .. Prefix .. '.' .. child .. '.' .. category .. ' allow')
    end
  end
  restrictions[category] = restriction
end


RegisterNetEvent('SimpleBlacklist:getClientBlacklist')
AddEventHandler('SimpleBlacklist:getClientBlacklist', function ()
  local blacklist = {}
  for category, aces in pairs(restrictions) do
    if not blacklist[category] then blacklist[category] = {} end
    for ace, bl in pairs(aces) do
      if not (IsPlayerAceAllowed(source, Prefix..'.'..ace) or IsPlayerAceAllowed(source, Prefix..'.'..ace..'.'..category)) then
        for name, _ in pairs(bl) do
          if type(name) == 'table' then
            for name, _ in pairs(bl) do
              blacklist[category][GetHashKey(name)] = true
            end
          else
            blacklist[category][GetHashKey(name)] = true
          end
        end
      end
    end
  end
  TriggerClientEvent('SimpleBlacklist:setClientBlacklist', source, blacklist)
end)