RegisterNetEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(playerId, text)
    local playerPed = GetPlayerPed(GetPlayerFromServerId(playerId))
    if playerPed == -1 then return end

    local coords = GetEntityCoords(playerPed)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(5000)
        displaying = false
    end)

    Citizen.CreateThread(function()
        while displaying do
            Wait(0)
            local dist = #(GetEntityCoords(PlayerPedId()) - coords)
            if dist < 20.0 then
                DrawText3D(coords.x, coords.y, coords.z + 1.0, text)
            end
        end
    end)
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = #(vec3(x, y, z) - p)
    local scale = 200 / (GetGameplayCamFov() * distance)

    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 0, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
