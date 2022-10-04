print("initalizing...")
local os = require "os"
local robot = require "robot"
local sides = require "sides"
local component = require "component"
local ic = component.inventory_controller

local OBI = "minecraft:obsidian"
local RSB = "minecraft:redstone_block"
local RS = "minecraft:redstone"
local GDB = "minecraft:gold_block"
local INB = "minecraft:iron_block"
local EP = "minecraft:ender_pearl"
local AIR = "minecraft:air"

local CMW = "compactmachines3:wallbreakable"

print("reorientating...")
while robot.detect() do
    robot.turnRight()
end
print("going to face input chest...")
robot.turnLeft()

print("registering recipes...")
local recipes = require "recipes"
for i, recipe in pairs(recipes) do
    print("registering " .. recipe.label)
end


function waitForRecipe()
    -- construct a table with all resources in adjacent chest
    local chestContent = {}

    -- iterate over all slots in inventory
    for i=1, ic.getInventorySize(sides.front) do
        -- get item in slot i
        local item = ic.getStackInSlot(sides.front, i)
        -- if its not air then
        if item then
            -- add a new key with the item' internal name (e.g. minecraft:stone)
            -- with either 0 + item stack size or existing item stack size + new item stack size
            chestContent[item.name] = (chestContent[item.name] or 0) + item.size
        end
    end

    -- iterate over all tables in recipes
    for name, recipe in pairs(recipes) do
        if canCraft(chestContent, recipe) then
            -- found resources to a recipe!
            print("found items to craft a " .. recipe.label .. "!")
            craft(recipe)
        end
    end
end

-- check if inventory contains required resources to craft specified recipe
function canCraft(inventory, recipe)
    -- iterate over all tables in required in recipes
    for index, table in pairs(recipe.required) do 
        -- check if inventory contains required item or has too little
        if not inventory[table.name] or inventory[table.name] < table.quantity then
            -- stop checking, cannot craft
            return false
        end
    end
    return true
end

function craft(recipe)
    collectItems(recipe)

    robot.turnRight()

    buildStructure(recipe)

    dropCatalyst(recipe)

    print("crafting done!")
    print("waiting " .. recipe.delay .. " seconds for miniaturization!")
    os.sleep(recipe.delay)

    collectOutput()
    robot.turnLeft()
    print("waiting for ingridients to a recipe...")
end

function collectItems(recipe)
    local currentSlot = 1

    for i, requiredItem in pairs(recipe.required) do
        -- create counter of how many number of item left to collect
        local remainingItems = requiredItem.quantity
        print("collecting " .. requiredItem.quantity .. " " .. requiredItem.name)

        for i1=1, ic.getInventorySize(sides.front) do
            chestItem = ic.getStackInSlot(sides.front, i1)

            if chestItem and chestItem.name == requiredItem.name then
                robot.select(currentSlot)
                -- check if chestItem's size can fulfill the request
                if chestItem.size >= remainingItems then
                    -- sufficient items in the stack! take whats needed and continue to next item required
                    ic.suckFromSlot(sides.front, i1, remainingItems)
                    remainingItems = 0
                    currentSlot = currentSlot + 1
                    break
                else
                    -- not enough, take the entire stack and reduce remainingItems, then keep checking for more items
                    ic.suckFromSlot(sides.front, i1, chestItem.size)
                    remainingItems = remainingItems - chestItem.size
                end
            end
        end
    end
end

function buildStructure(recipe)
    print("building " .. recipe.label .. "'s structure now!")
    robot.forward()
    robot.forward()
    robot.forward()
    moveLeft(1)
    -- for each layer
    for i, layer in pairs(recipe.structure) do
        -- for each row
        for i1, row in pairs(layer) do
            -- for each block
            for i2, block in pairs(row) do
                if (block ~= "minecraft:air") then
                    -- skip placing blocks if the block is set as air
                    if ic.getStackInInternalSlot() == nil then
                        -- if selected slot is empty, select required block
                        selectBlock(block)
                    elseif ic.getStackInInternalSlot().name ~= block then
                        -- if slected slot has wrong block, select required block
                        selectBlock(block)
                    end
                    -- this if statement helps optimzation
                    robot.place()
                end
                if i2 ~= 3 then
                    moveRight(1)
                end
            end
            if i1 ~= 3 then
                robot.back()
                moveLeft(2)
            end
        end
        if i ~= 3 then
            robot.up()
            robot.forward()
            robot.forward()
            moveLeft(2)
        end
    end
    robot.down()
    robot.down()
    moveLeft(1)
    robot.back()
end

function dropCatalyst(recipe)
    print("dropping " .. recipe.activation .. " to start miniaturization!")
    selectBlock(recipe.activation)
    robot.drop(1)
end

function collectOutput()
    print("collecting output!")
    robot.forward()
    robot.forward()
    robot.select(1)
    robot.suck()
    print("collected items, storing now!")
    robot.back()
    robot.back()
    robot.turnRight()
    print("finding slot to put items")
    for i=1, ic.getInventorySize(sides.forward) do
        item = ic.getStackInSlot(sides.forward, i)
        outputItem = ic.getStackInInternalSlot(1)
        if item == nil or item.maxSize - item.size >= outputItem.size then
            print("dropping in slot " .. i)
            ic.dropIntoSlot(sides.forward, i)
            break
        end
    end
    robot.turnLeft()
end

-- find and select required block
function selectBlock(block)
    for i=1, robot.inventorySize() do
        item = ic.getStackInInternalSlot(i)
		if item and item.name == block then 
            -- found correct block!
            robot.select(i)
            break;
        end
    end
end

-- move right x amount of blocks
-- retains orientation
function moveRight(blocks)
    robot.turnRight()
    for i=1, blocks do
        robot.forward()
    end
    robot.turnLeft()
end

-- move left x amount of blocks
-- retains orientation
function moveLeft(blocks)
    robot.turnLeft()
    for i=1, blocks do
        robot.forward()
    end
    robot.turnRight()
end

print("waiting for ingridients to a recipe...")
while true do
    waitForRecipe()
    os.sleep(1)
end
