-- Load settings value
local MOD_SETTINGS_ROBOPORT_LOGISTIC_AREA = settings.startup["Roboport64-logistic-area"].value
local mod_logistic_radius = math.floor(MOD_SETTINGS_ROBOPORT_LOGISTIC_AREA / 2)

-- We are only changing the vanilla roboport range
local roboports = data.raw["roboport"]
local vanilla_roboport = roboports and roboports["roboport"]
if (vanilla_roboport)
then
  vanilla_roboport.logistics_radius = mod_logistic_radius
  local construction_radius = (mod_logistic_radius * 2) + math.floor(mod_logistic_radius * 0.2)
  vanilla_roboport.construction_radius = construction_radius

  local radar_distance = 1 + math.ceil((construction_radius - 2) / 32)
  vanilla_roboport.radar_range = radar_distance
end
