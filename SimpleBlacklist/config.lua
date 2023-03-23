------------------------------------------------
--                                            --
--             SimpleBlacklist                --
-- https://github.com/Fadin04/SimpleBlacklist --
--           Created by Fadin_laws            --
--                                            --
------------------------------------------------

Restricted = {

    VehicleConfig = {

        -- Vehicles that are blacklisted from the whole server (Including Administrators)
        'rhino',

        AdminVehicles = {
            -- Vehicles that can only be driven by server administrators!
            'VehicleSpawnCode' ,
        },

        ModVehicles = {
            -- Vehicles that can only be driven by server moderators!
            'VehicleSpawnCode',
        },
    },

    PedConfig = {

        -- Peds that are blacklisted from the whole server (Including Administrators)

        AdminPeds = {
            -- Peds that Administrators can only use.
            'PedSpawnCode',
        },

        ModPeds = {
            -- Peds that Moderators can only use.
            'PedSpawnCode',
        },
    },

    WeaponConfig = {

        -- Weapons that are blacklisted from the whole server (Including Administrators)
        'weapon_rpg',
        'weapon_minigun',

        ModWeapons = {
            'WeaponSpawnCode',
        },

        AdminWeapons = {
            'WeaponSpawnCode',
        },

        CustomAceGroup = {}, -- Add your own Ace Group (See Inherits below for more information!)

        --[[ Custom Group Template:
        
         CivWeapons = { 
            'weapon_flashbang',
            'weapon_smg',
            'weapon_stungun'
        },

        ]]

    },
}

WeaponAmmoBannedTypes = { 
    -- Only works for MRK II weapons as they are the only one with modded ammo!
    -- Check ammoTypes.lua for more info! (\SimpleBlacklist\data\ammoTypes.lua)
    -- table.unpack(AmmoFMJ),
    -- table.unpack(AmmoAP),
    -- table.unpack(AmmoIncendiary),
}

Prefix = '[^1SimpleBlacklist^0]: '

Inverted = false -- Make the blacklist turn into a whitelist! (False = Blacklist | True = Whitelist)

VehicleDriverBlacklist = true -- Kicks only the driver of a blacklisted vehicle (True = Only driver | False = Everyone (including passengers))

VehicleBlacklistMessage = Prefix .. "~y~Hey!~s~ This vehicle has been ~r~blacklisted~s~! You cannot drive it!"

PedBlacklistMessage = Prefix .. "~y~Hey!~s~ This ped has been ~r~blacklisted~s~! You cannot use this ped!"

WeaponBlacklistMessage = Prefix .. "~y~Hey!~s~ This weapon has been ~r~blacklisted~s~! You cannot use this weapon!"

Inherits = {
    'CustomAceGroup',
    'AdminWeapons',
    'AdminPeds',
    'AdminVehicles',
    'ModWeapons',
    'ModPeds',
    'ModVehicles',
    --'CivWeapons',
}


-- Ace Permission Groups (Add to your server.cfg)

-- add_ace group.moderator simpleblacklist.ModVehicles
-- add_ace group.moderator simpleblacklist.ModPeds
-- add_ace group.moderator simpleblacklist.ModWeapons
-- add_ace group.admin simpleblacklist.AdminVehicles
-- add_ace group.admin simpleblacklist.AdminPeds
-- add_ace group.admin simpleblacklist.AdminWeapons


-- Do not touch this --

RawVersionLink = 'https://raw.githubusercontent.com/Fadin04/SimpleBlacklist/main/version.txt'
ResourceName = 'SimpleBlacklist'
LatestRelease = 'https://github.com/Fadin04/SimpleBlacklist/releases'