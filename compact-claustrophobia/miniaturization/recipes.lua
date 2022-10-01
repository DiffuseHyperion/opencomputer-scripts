local OBI = "minecraft:obsidian"
local RSB = "minecraft:redstone_block"
local RS = "minecraft:redstone"
local GDB = "minecraft:gold_block"
local INB = "minecraft:iron_block"
local EP = "minecraft:ender_pearl"
local AIR = "minecraft:air"

local CMW = "compactmachines3:wallbreakable"

recipes = {
    enderpearl = {
        structure = {
            {
                {OBI, OBI, OBI},
                {OBI, OBI, OBI},
                {OBI, OBI, OBI},
            },
            {
                {OBI, OBI, OBI}, 
                {OBI, RSB, OBI},
                {OBI, OBI, OBI},
            },
            {
                {OBI, OBI, OBI},
                {OBI, OBI, OBI},
                {OBI, OBI, OBI},
            }
        },
        required = {
            {
                name = OBI,
                quantity = 26
            },
            {
                name = RSB,
                quantity = 1
            },
            {
                name = RS,
                quantity = 1
            }
        },
        activation = RS,
        delay = 10,
        label = "ender pearl"
    },
    compactmachinewall = {
        structure = {
            {
                {AIR, AIR, AIR},
                {AIR, AIR, AIR},
                {AIR, INB, AIR},
            },
            {
                {AIR, AIR, AIR}, 
                {AIR, AIR, AIR},
                {AIR, RS, AIR},
            },
            {
                {AIR, AIR, AIR},
                {AIR, AIR, AIR},
                {AIR, AIR, AIR},
            }
        },
        required = {
            {
                name = INB,
                quantity = 1
            },
            {
                name = RS,
                quantity = 2
            },
        },
        activation = RS,
        delay = 5,
        label = "compact machine walls"
    },
    smallcompactmachine = {
        structure = {
            {
                {CMW, CMW, CMW},
                {CMW, CMW, CMW},
                {CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW}, 
                {CMW, INB, CMW},
                {CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW},
                {CMW, CMW, CMW},
                {CMW, CMW, CMW},
            }
        },
        required = {
            {
                name = CMW,
                quantity = 26
            },
            {
                name = INB,
                quantity = 1
            },
            {
                name = EP,
                quantity = 1
            }
        },
        activation = EP,
        delay = 25,
        label = "small compact machine"
    },
    normalcompactmachine = {
        structure = {
            {
                {CMW, CMW, CMW},
                {CMW, CMW, CMW},
                {CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW}, 
                {CMW, GDB, CMW},
                {CMW, CMW, CMW},
            },
            {
                {CMW, CMW, CMW},
                {CMW, CMW, CMW},
                {CMW, CMW, CMW},
            }
        },
        required = {
            {
                name = CMW,
                quantity = 26
            },
            {
                name = GDB,
                quantity = 1
            },
            {
                name = EP,
                quantity = 1
            }
        },
        activation = EP,
        delay = 25,
        label = "normal compact machine"
    }
}

return recipes