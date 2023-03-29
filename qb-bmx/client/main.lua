local QBCore = exports['qb-core']:GetCoreObject()
local bmx = nil

RegisterNetEvent('bmx')
AddEventHandler('bmx', function()
    if not DoesEntityExist(bmx) then
        local bmxModel = 'bmx'
        RequestModel(bmxModel)
        while not HasModelLoaded(bmxModel) do
            Citizen.Wait(0)
        end
        bmx = CreateVehicle(bmxModel, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false)
        SetVehicleOnGroundProperly(bmx)
        SetVehicleNumberPlateText(bmx, "BMX".. math.random(9))
        SetPedIntoVehicle(PlayerPedId(), bmx, -1)
        SetModelAsNoLongerNeeded(bmxModel)
        local bmxPlate = GetVehicleNumberPlateText(bmx)
        TriggerEvent("vehiclekeys:client:SetOwner", bmxPlate)
        SetVehicleEngineOn(bmx, true, true)
        exports['cdn-fuel']:SetFuel(bmx, 100)
    elseif DoesEntityExist(bmx) and #(GetEntityCoords(bmx) - GetEntityCoords(PlayerPedId())) < 3.0 and GetPedInVehicleSeat(bmx,-1) == 0 then
        DeleteVehicle(bmx)
        bmx = nil
    else
        QBCore.Functions.Notify("Zu weit vom Fahrrad entfernt oder jemand sitzt darauf")
    end
end)
