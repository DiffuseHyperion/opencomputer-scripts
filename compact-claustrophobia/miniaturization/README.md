### Miniaturization field robot

These are scripts to atuomate using the miniaturization field cuz copy and paste gadget sucks to use lol

You need both `3x3x3-crafting.lua` and `recipes.lua` in your robot!

## Setup
Follow the picture below, this should fit perfectly in your 9x9 cube
You can add a crafter from refined storage into the input chest, and an importer at the output chest for easy autocrafting.

![Setup](setup.png)

## Recipes
There are some default recipes in the repository. If you want to make more, heres an example and breakdown of how the recipes work:
Included recipes:
  - Ender pearl
  - Compact machine walls
  - Small compact machine
  - Normal compact machine
  - Giant compact machine
  - Maximum compact machine
  - Tunnel

```
local OBI = "minecraft:obsidian"
local RSB = "minecraft:redstone_block"
local RS = "minecraft:redstone"
-- These variables are used to keep the "structure" part of each recipe tidy.
-- The variable should contain the internal/untranslated name of the blocks they represent
-- Press F4+H to see advanced tooltips to see the internal name

recipes = {
    enderpearl = { -- The name here is unused, but I would keep it as the recipe output name
        structure = { -- The structure the robot needs to create to create the output
        -- This should be seen from a top-down view.
        -- You can put "minecraft:air" to get the robot to skip placing blocks at the particular location.
          -- Useful for compact machine walls
            {
                {OBI, OBI, OBI},
                {OBI, OBI, OBI},
                {OBI, OBI, OBI},
            }, -- This is layer 1 / Bottom layer
            {
                {OBI, OBI, OBI}, 
                {OBI, RSB, OBI},
                {OBI, OBI, OBI},
            }, -- Layer 2 / Middle layer
            {
                {OBI, OBI, OBI},
                {OBI, OBI, OBI},
                {OBI, OBI, OBI},
            } -- Layer 3 / Top layer
        },
        required = { -- This should contain all required blocks needed to complete the recipe, including the catalyst required to start miniaturization
            {
                name = OBI, -- You can use the variables
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
        activation = RS, -- The catalyst / item to be thrown onto the structure, you can use the variables
        delay = 10, -- How long the miniaturization takes, in seconds
        label = "ender pearl" -- A human-readable name for the output item. Only used in logs.
    }
}

return recipes
```
