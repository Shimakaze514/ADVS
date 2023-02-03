-------------------------------------------------------------------------
-- CTLD 110 - Caucasus - Build and Move
-------------------------------------------------------------------------
-- Documentation
-- 
-- CTLD: https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Ops.CTLD.html
-- 
-------------------------------------------------------------------------
-- Join a Helicopter. Use the F10 menu to request crates and/or troops. 
-- Fly over to the drop zone at the far end of the airport and unload.
-- We'll auto create a MOVE type zone and the unloaded troops & vehicles
-- will attack REDFOR.
-------------------------------------------------------------------------
-- Date: November 2022
-------------------------------------------------------------------------

_SETTINGS:SetPlayerMenuOff()

local RAPACHE11 = CTLD:New(coalition.side.RED,{"【联合武装/R】帕琪 1-1"},"【联合武装/R】帕琪 1-1")
RAPACHE11.useprefix = true -- (DO NOT SWITCH THIS OFF UNLESS YOU KNOW WHAT YOU ARE DOING!) Adjust **before** starting CTLD. If set to false, *all* choppers of the coalition side will be enabled for CTLD.
RAPACHE11.CrateDistance = 35 -- List and Load crates in this radius only.
RAPACHE11.dropcratesanywhere = true -- Option to allow crates to be dropped anywhere.
RAPACHE11.maximumHoverHeight = 15 -- Hover max this high to load.
RAPACHE11.minimumHoverHeight = 0 -- Hover min this low to load.
RAPACHE11.forcehoverload = false -- Crates (not: troops) can **only** be loaded while hovering.
RAPACHE11.hoverautoloading = false -- Crates in CrateDistance in a LOAD zone will be loaded automatically if space allows.
RAPACHE11.smokedistance = 2000 -- Smoke or flares can be request for zones this far away (in meters).
RAPACHE11.movetroopstowpzone = false -- Troops and vehicles will move to the nearest MOVE zone...
RAPACHE11.movetroopsdistance = 5000 -- .. but only if this far away (in meters)
RAPACHE11.smokedistance = 2000 -- Only smoke or flare zones if requesting player unit is this far away (in meters)
RAPACHE11.suppressmessages = false -- Set to true if you want to script your own messages.
RAPACHE11.repairtime = 300 -- Number of seconds it takes to repair a unit.
RAPACHE11.buildtime = 0 -- Number of seconds it takes to build a unit. Set to zero or nil to build instantly.
RAPACHE11.cratecountry = country.id.GERMANY -- ID of crates. Will default to country.id.RUSSIA for RED coalition setups.
RAPACHE11.allowcratepickupagain = true  -- allow re-pickup crates that were dropped.
RAPACHE11.enableslingload = false -- allow cargos to be slingloaded - might not work for all cargo types
RAPACHE11.pilotmustopendoors = false -- force opening of doors
RAPACHE11.SmokeColor = SMOKECOLOR.Red -- default color to use when dropping smoke from heli 
RAPACHE11.FlareColor = FLARECOLOR.Red -- color to use when flaring from heli
RAPACHE11.basetype = "container_cargo" -- default shape of the cargo container
RAPACHE11.droppedbeacontimeout = 600 -- dropped beacon lasts 10 minutes
RAPACHE11.usesubcats = false -- use sub-category names for crates, adds an extra menu layer in "Get Crates", useful if you have > 10 crate types.
RAPACHE11.placeCratesAhead = true -- place crates straight ahead of the helicopter, in a random way. If true, crates are more neatly sorted.
RAPACHE11:__Start(5)

local BAPACHE11 = CTLD:New(coalition.side.BLUE,{"【联合武装/B】帕琪 1-1"},"【联合武装/B】帕琪 1-1")
BAPACHE11.useprefix = true -- (DO NOT SWITCH THIS OFF UNLESS YOU KNOW WHAT YOU ARE DOING!) Adjust **before** starting CTLD. If set to false, *all* choppers of the coalition side will be enabled for CTLD.
BAPACHE11.CrateDistance = 35 -- List and Load crates in this radius only.
BAPACHE11.dropcratesanywhere = true -- Option to allow crates to be dropped anywhere.
BAPACHE11.maximumHoverHeight = 15 -- Hover max this high to load.
BAPACHE11.minimumHoverHeight = 0 -- Hover min this low to load.
BAPACHE11.forcehoverload = false -- Crates (not: troops) can **only** be loaded while hovering.
BAPACHE11.hoverautoloading = false -- Crates in CrateDistance in a LOAD zone will be loaded automatically if space allows.
BAPACHE11.smokedistance = 2000 -- Smoke or flares can be request for zones this far away (in meters).
BAPACHE11.movetroopstowpzone = false -- Troops and vehicles will move to the nearest MOVE zone...
BAPACHE11.movetroopsdistance = 5000 -- .. but only if this far away (in meters)
BAPACHE11.smokedistance = 2000 -- Only smoke or flare zones if requesting player unit is this far away (in meters)
BAPACHE11.suppressmessages = false -- Set to true if you want to script your own messages.
BAPACHE11.repairtime = 300 -- Number of seconds it takes to repair a unit.
BAPACHE11.buildtime = 0 -- Number of seconds it takes to build a unit. Set to zero or nil to build instantly.
BAPACHE11.cratecountry = country.id.GERMANY -- ID of crates. Will default to country.id.RUSSIA for RED coalition setups.
BAPACHE11.allowcratepickupagain = true  -- allow re-pickup crates that were dropped.
BAPACHE11.enableslingload = false -- allow cargos to be slingloaded - might not work for all cargo types
BAPACHE11.pilotmustopendoors = false -- force opening of doors
BAPACHE11.SmokeColor = SMOKECOLOR.Red -- default color to use when dropping smoke from heli 
BAPACHE11.FlareColor = FLARECOLOR.Red -- color to use when flaring from heli
BAPACHE11.basetype = "container_cargo" -- default shape of the cargo container
BAPACHE11.droppedbeacontimeout = 600 -- dropped beacon lasts 10 minutes
BAPACHE11.usesubcats = false -- use sub-category names for crates, adds an extra menu layer in "Get Crates", useful if you have > 10 crate types.
BAPACHE11.placeCratesAhead = true -- place crates straight ahead of the helicopter, in a random way. If true, crates are more neatly sorted.
BAPACHE11:__Start(5)

--[[ -- generate generically loadable stuff
my_ctld:AddTroopsCargo("Infantry",{"Infantry6"},CTLD_CARGO.Enum.TROOPS,6,80,nil,"Troops")
my_ctld:AddCratesCargo("Humvee",{"Humvee"},CTLD_CARGO.Enum.VEHICLE,1,100,nil,"Vehicles")

-- generate zone types
my_ctld:AddCTLDZone("Loadzone",CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true) -- Note: since there are no blue flares, this will be a white flare when requested.
my_ctld:AddCTLDZone("Dropzone",CTLD.CargoZoneType.DROP,SMOKECOLOR.Red,true,true)
local dropzone = ZONE:FindByName("Dropzone"):DrawZone(-1,{0,0,1},1,{0,0,1},0.25,1)

-- update unit capabilities for testing
my_ctld:UnitCapabilities("SA342L", true, true, 1, 6, 12, 1000)

  -- We're using OnBefore ... to add a MOVE zone
function my_ctld:OnBeforeTroopsDeployed(From,Event,To,Group,Unit,Troops)
  -- find baddies near by with a ZONE filter
  local zone = ZONE_GROUP:New(Group:GetName(),Group,6000)
  local enemyset = SET_GROUP:New():FilterCoalitions("red"):FilterCategoryGround():FilterZones({zone}):FilterOnce()
  if enemyset:Count() > 0 then
    MESSAGE:New(string.format("Found %d enemy group nearby!", enemyset:Count()),15):ToAll()
    -- baddies found, add zone around them
    local zonename = "Baddies-"..math.random(1,10000)
    local redzone = ZONE_RADIUS:New(zonename,enemyset:GetRandom():GetCoordinate():GetVec2(),200)
    redzone:DrawZone(-1,{1,0.6,0},1,{1,0.6,0},0.25,4)
    my_ctld:AddCTLDZone(zonename,CTLD.CargoZoneType.MOVE,SMOKECOLOR.Orange,true,false)
  end
  return self
end

  -- We're using OnBefore ... to add a MOVE zone
function my_ctld:OnBeforeCratesBuild(From,Event,To,Group,Unit,Vehicle)
  -- find baddies near by with a ZONE filter
  local zone = ZONE_GROUP:New(Group:GetName(),Group,6000)
  local enemyset = SET_GROUP:New():FilterCoalitions("red"):FilterCategoryGround():FilterZones({zone}):FilterOnce()
  if enemyset:Count() > 0 then
    MESSAGE:New(string.format("Found %d enemy group nearby!", enemyset:Count()),15):ToAll()
    -- baddies found, add zone around them
    local zonename = "Baddies-"..math.random(1,10000)
    local redzone = ZONE_RADIUS:New(zonename,enemyset:GetRandom():GetCoordinate():GetVec2(),200)
    redzone:DrawZone(-1,{1,0.6,0},1,{1,0.6,0},0.25,4)
    my_ctld:AddCTLDZone(zonename,CTLD.CargoZoneType.MOVE,SMOKECOLOR.Orange,true,false)
  end
  return self
end ]]