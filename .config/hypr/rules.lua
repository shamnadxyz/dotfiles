hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	name = "brave",
	match = { class = "brave-browser" },
	workspace = 2,
})

hl.window_rule({
	name = "signal",
	match = { class = "signal" },
	workspace = 4,
})

hl.window_rule({
	name = "mpv",
	match = { class = "mpv" },
	workspace = 5,
})

hl.window_rule({
	name = "pavucontrol",
	match = { class = "org.pulseaudio.pavucontrol" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "proton-settings",
	match = { class = "protonvpn-app", title = "Settings" },
	float = true,
	center = true,
	size = "720 720",
})

hl.window_rule({
	name = "proton",
	match = { class = "protonvpn-app", title = "Proton VPN" },
	float = true,
	center = true,
	size = "0 720",
})

hl.window_rule({
	name = "excali",
	match = { initial_title = "Excalidraw" },
	fullscreen_state = "0 2",
})

hl.window_rule({
	name = "swayimg",
	match = { class = "swayimg" },
	float = true,
})

hl.window_rule({
	name = "bluetui",
	match = { class = "bluetui" },
	float = true,
	center = true,
	size = "1000 700",
})

hl.window_rule({
	name = "foot",
	match = { class = "foot" },
	fullscreen_state = "0 1",
})

hl.window_rule({
	name = "obsidian",
	match = { class = "obsidian" },
	workspace = 7,
})

hl.layer_rule({
	name = "wofi",
	blur = true,
	ignore_alpha = 0,
	match = { namespace = "wofi" },
})

hl.layer_rule({
	name = "fuzzel",
	blur = true,
	ignore_alpha = 0,
	match = { namespace = "launcher" },
})

hl.layer_rule({
	name = "rofi-blur",
	blur = true,
	ignore_alpha = 0,
	match = { namespace = "rofi" },
})

hl.layer_rule({
	name = "dunst",
	blur = true,
	ignore_alpha = 0,
	match = { namespace = "notifications" },
})

hl.layer_rule({
	name = "waybar-blur",
	blur = true,
	ignore_alpha = 0,
	match = { namespace = "waybar" },
})
