local var = require("variables")

require("ui")
require("rules")
require("keybinds")
require("autostart")
require("input")

-- MONITORS
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

hl.monitor(var.laptop_monitor_spec)

-- ENVIRONMENT VARIABLES
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata Modern Ice")
hl.env("HYPRCURSOR_SIZE", "24")
