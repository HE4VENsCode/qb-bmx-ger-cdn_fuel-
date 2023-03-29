local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("bmx", function(source)
    TriggerClientEvent('bmx', source)
    print('usado')
end)