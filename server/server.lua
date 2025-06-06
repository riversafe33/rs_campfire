local VorpInv = {}

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

VorpInv.RegisterUsableItem(Config.CampFireItem, function(data)
    local _source = data.source   
    TriggerClientEvent("rs_campfire:campfire", data.source)
    VorpInv.subItem(_source, Config.CampFireItem, 1 )  
    VorpInv.CloseInv(data.source)
end)

RegisterCommand( Config.Command, function(source)
    if Config.Commands.extinguish then
        TriggerClientEvent('clientExtinguish', source)
    end
end, false)

RegisterNetEvent('extinguishCampfire')
AddEventHandler('extinguishCampfire', function()
    local _source = source

    if not Config.Commands.extinguish then
        TriggerClientEvent('clientExtinguish', _source)
    end
end)

VorpInv.RegisterUsableItem(Config.ExtinguishItem, function(data)
    local _source = data.source    

    if not Config.Commands.extinguish then
        TriggerClientEvent('clientExtinguish', _source)
        VorpInv.subItem(_source, Config.ExtinguishItem, 1)  
        VorpInv.addItem(_source, Config.ExtinguishItemback, 1)  
        VorpInv.CloseInv(data.source)
    end
end)