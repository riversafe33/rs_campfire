local campfire = 0
local Core = exports.vorp_core:GetCore()
local progressbar = exports.vorp_progressbar:initiate()

local function placeCampfire()
    if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire, false, false)
        DeleteObject(campfire)
        campfire = 0
    end

    local playerPed = PlayerPedId()
    Animations.playAnimation(playerPed, "campfire")

    progressbar.start(Config.Campfire.place, 10000, function()
        Animations.endAnimation("campfire")
        Animations.endAnimations()
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        RequestModel(Config.PlaceableCampfire, false)
        repeat Wait(0) until HasModelLoaded(Config.PlaceableCampfire)
        local prop = CreateObject(GetHashKey(Config.PlaceableCampfire), x, y, z, true, false, false, false, false)
        repeat Wait(0) until DoesEntityExist(prop)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop, false)
        campfire = prop
    end)
end

RegisterNetEvent('rs_campfire:campfire')
AddEventHandler('rs_campfire:campfire', function()
    placeCampfire()
end)

RegisterNetEvent('clientExtinguish')
AddEventHandler('clientExtinguish', function()
    if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire, false, false)
        TaskStartScenarioInPlaceHash(PlayerPedId(), GetHashKey('WORLD_HUMAN_BUCKET_POUR_LOW'), 7000, true, 0, 0, false)
        Core.NotifyAvanced(Config.Campfire.extiguis, "generic_textures", "tick", "COLOR_GREEN", 4000)
        Wait(7000)
        ClearPedTasksImmediately(PlayerPedId())
        DeleteObject(campfire)
        campfire = 0
    end
end)