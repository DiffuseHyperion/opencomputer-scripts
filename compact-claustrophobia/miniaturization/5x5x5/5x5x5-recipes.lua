local EP = "minecraft:ender_pearl"
local DMB = "minecraft:diamond_block"
local AIR = "minecraft:air"

local CMW = "compactmachines3:wallbreakable"
local GGM = "contenttweaker:glitched4"

recipes = {
    largecompactmachine = {
        structure = {
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            }
        },
        required = {
            {
                name = CMW,
                quantity = 98
            },
            {
                name = EP,
                quantity = 1
            }
        },
        activation = EP,
        delay = 30,
        label = "large compact machine"
    },
    giantcompactmachine = {
        structure = {
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, DMB, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            }
        },
        required = {
            {
                name = CMW,
                quantity = 98
            },
            {
                name = DMB,
                quantity = 1
            },
            {
                name = EP,
                quantity = 1
            }
        },
        activation = EP,
        delay = 30,
        label = "giant compact machine"
    },
    maximumcompactmachine = {
        structure = {
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, GGM, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, AIR, AIR, AIR, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
                {CMW, CMW, CMW, CMW, CMW},
            }
        },
        required = {
            {
                name = CMW,
                quantity = 98
            },
            {
                name = GGM,
                quantity = 1
            },
            {
                name = EP,
                quantity = 1
            }
        },
        activation = EP,
        delay = 30,
        label = "maximum compact machine"
    }
}

return recipes
