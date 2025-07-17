local dispatch = lib.load("config.dispatch")
local relationships = lib.load("config.relationships")
local scenarioGroups = lib.load("config.scenariogroups")
local scenarioTypes = lib.load("config.scenariotypes")

local maxWantedLevel = GetConvarInt("mnr:maxWantedLevel", 0)

SetMaxWantedLevel(maxWantedLevel)

for service, toggle in ipairs(dispatch) do
    EnableDispatchService(service, toggle)
end

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