function GetCurrentVersion()
    return GetResourceMetadata(GetCurrentResourceName(), "version")
end

local branding = [[
    //
    ||
    ||   _____   _   __    __   _____   _      _____
    ||  / ____| |_| |  \  /  | |   _ \ | |    |  ___|
    || | (___    _  |   \/   | |  |_) || |    | |___
    ||  \___ \  | | | |\  /| | |  ___/ | |    |  ___|
    ||  ____) | | | | | \/ | | | |     | |___ | |___
    || \_____/  |_| |_|    |_| |_|     |_____||_____|
    ||               ______   __
    ||              |   _  \ |  |
    ||              |  |_)  )|  |
    ||              |  ____/ |  |
    ||              |   __ \ |  |
    ||              |  |__) )|  |____
    ||              |______/ |_______|
    ||		 Created by Fadin_laws
    ||
    ||]]

PerformHttpRequest(RawVersionLink, function( err, text, headers )

    Citizen.Wait(2000)

    print(branding)

    local curVer = GetCurrentVersion()

    print("    ^0|| Current Version: ^2" .. curVer)

    if (text ~= nil) then
        print("    ^0|| Latest Recommended Version: ^2" .. text .. "\n^0    ||")

        if (text ~= curVer) then
            print("    ^0|| ^1Your ".. ResourceName .. " is outdated! You are currently running version: ^3".. curVer .. "^1! visit ^5".. LatestRelease .. "^1 to update!\n^0    \\\\\n")
        else
            print( "    ^0|| ^2".. ResourceName .. " is up to date! ||\n^0    \\\\\n")
        end
    else
        print("    ^0|| ^1There seemed to be an error attempting to gain the latest version information for ".. ResourceName .. "!\n^0    \\\\\n")
    end
end)