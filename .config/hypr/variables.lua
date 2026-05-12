local M = {}

M.laptop_monitor = "eDP-1"
M.terminal = "foot"

local function term_app(app)
	return string.format("%s --app-id %s -T %s %s", M.terminal, app, app, app)
end

M.pickers = {
	app = "rofi -show drun",
	window = "rofi -show window",
	network = "connmenu",
	power = "powermenu",
	wallpaper = "setwall",
}

M.apps = {
	terminal = "foot",
	browser = "brave",
	music = term_app("rmpc"),
	file_manager = term_app("yazi"),
	bar = "waybar",
	clipboard = {
		add = "clipboard -a",
		copy = "clipboard -c",
		delete = "clipboard -d",
	},
}

M.laptop_monitor_spec = {
	output = M.laptop_monitor,
	mode = "preferred",
	position = "auto",
	scale = "1.2",
}

M.wallpaper_cmd = 'swaybg -i "${HOME}/.cache/wallpaper" -m fill &'

return M
