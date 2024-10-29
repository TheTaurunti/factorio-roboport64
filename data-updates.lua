-- Load settings value
local MOD_SETTINGS_ROBOPORT_LOGISTIC_AREA = settings.startup["Roboport64-logistic-area"].value
local MOD_SETTINGS_SCALE_RADAR_RANGE = settings.startup["Roboport64-scale-radar"].value
local mod_logistic_radius = math.floor(MOD_SETTINGS_ROBOPORT_LOGISTIC_AREA / 2)

-- We are only changing the vanilla roboport range
local roboports = data.raw["roboport"]
local vanilla_roboport = roboports and roboports["roboport"]
if (vanilla_roboport)
then
	vanilla_roboport.logistics_radius = mod_logistic_radius
	local construction_radius = (mod_logistic_radius * 2) + math.floor(mod_logistic_radius * 0.2)
	vanilla_roboport.construction_radius = construction_radius

	if (MOD_SETTINGS_SCALE_RADAR_RANGE) then
		-- vanilla range is 3 (own chunk + 2 outwards) at construction range of 100.
		-- >> This makes the vanilla tiles revealed range somewhere between 64+(32-(<4>/2)) and 64+(32-(32-(<4>/2)))
		-- >>>>> which is to say, between 66 and 94. Note that values should be compared to logi/constuction RADIUS of 25x25 and 55x55 as in vanilla.
		local radar_distance = 1 + math.ceil((construction_radius - 2) / 32)
		vanilla_roboport.radar_range = radar_distance
	end
end
