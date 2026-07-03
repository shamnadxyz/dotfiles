local M = {}

M.laptop_monitor = "eDP-1"
M.terminal = "kitty"

local function term_app(app)
	return string.format("%s --app-id %s -T %s %s", M.terminal, app, app, app)
end

M.pickers = {
	app = "fuzzel",
	window = "rofi -show window",
	network = "connmenu",
	power = "powermenu",
	wallpaper = "setwall",
}

M.apps = {
	browser = "brave",
	music = term_app("rmpc"),
	file_manager = term_app("yazi"),
	bar = "waybar",
	music_daemon = "mpd",
}

M.commands = {
	exit = "wm-exit",
	clipboard = {
		add = "clipboard -a",
		copy = "clipboard -c",
		delete = "clipboard -d",
	},
	screenshot = {
		desktop = "screenshot desktop",
		region = "screenshot region",
		output = "screenshot output",
	},
	audio = {
		sink = {
			raise = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
			lower = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
			toggle = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
		},
		source = {
			raise = "wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+",
			lower = "wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-",
			toggle = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
		},
	},
	brightness = {
		raise = "brightnessctl -e4 -n2 set 5%+",
		lower = "brightnessctl -e4 -n2 set 5%-",
	},
	media = {
		next = "playerctl next",
		toggle = "playerctl play-pause",
		previous = "playerctl previous",
		stop = "playerctl stop",
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
