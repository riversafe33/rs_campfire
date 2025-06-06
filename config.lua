Config = {}

Config.CampFireItem = "campfire"                 -- Item used to place the campfire
Config.ExtinguishItem = "wateringcan"            -- Item used to extinguish the campfire if the command is set to false
Config.ExtinguishItemback = "wateringcan_empty"  -- Item returned after using Config.ExtinguishItem
Config.PlaceableCampfire = "p_campfire05x"       -- Campfire model placed when using the item

Config.Command = "extinguish"
Config.Commands = {
    extinguish = true -- If true, the command Config.command = "extinguish" is used; if false, Config.ExtinguishItem = "wateringcan" is used
}

Config.Animations = {
    ["campfire"] = {
        dict = "script_campfire@lighting_fire@male_male",
        name = "light_fire_b_p2_male_b",
        flag = 17,
        type = 'standard'
    }
}

Config.Campfire = {
    place = "Placing Campfire",
    extiguis = "Extinguishing Campfire",
}