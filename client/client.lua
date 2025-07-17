local density = require "config.density"
local dispatch = lib.load("config.dispatch")
local relationships = lib.load("config.relationships")
local scenarioGroups = lib.load("config.scenariogroups")
local scenarioTypes = lib.load("config.scenariotypes")

CreateThread(function()
    while true do
        SetPedDensityMultiplierThisFrame(density.peds)
        SetScenarioPedDensityMultiplierThisFrame(density.scenarioInt, density.scenarioExt)
        SetVehicleDensityMultiplierThisFrame(density.vehicles)
        SetParkedVehicleDensityMultiplierThisFrame(density.vehiclesParked)
        SetRandomVehicleDensityMultiplierThisFrame(density.vehiclesRandom)
        Wait(0)
    end
end)

local maxWantedLevel = GetConvarInt("mnr:maxWantedLevel", 0)

SetMaxWantedLevel(maxWantedLevel)

for service, toggle in ipairs(dispatch) do
    EnableDispatchService(service, toggle)
end

---@todo check a mechanism to overwrite PLAYER/PLAYER to avoid vehicle cheat exploit (Kicks other players out of the vehicle)
for group, relationship in ipairs(relationships) do
    SetRelationshipBetweenGroups(relationship, group, `PLAYER`)
end

for scenarioGroup, toggle in pairs(scenarioGroups) do
    SetScenarioGroupEnabled(scenarioGroup, toggle)
end

for scenarioType, toggle in pairs(scenarioTypes) do
    SetScenarioTypeEnabled(scenarioType, toggle)
end

AddEventHandler("populationPedCreating", function(x, y, z)
    Wait(1000)
    local _, npc = GetClosestPed(x, y, z, 1.0)
    SetPedDropsWeaponsWhenDead(npc, false)
end)