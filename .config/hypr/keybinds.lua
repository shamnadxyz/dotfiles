local var = require("variables")

local pickers = var.pickers
local apps = var.apps

local main_mod = "ALT"

hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd(var.terminal))
hl.bind(main_mod .. " + D", hl.dsp.exec_cmd(pickers.app))
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(apps.file_manager))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd(apps.browser))
hl.bind(main_mod .. " + W", hl.dsp.exec_cmd(pickers.window))
hl.bind(main_mod .. " + SHIFT + M", hl.dsp.exec_cmd(apps.music))
hl.bind(main_mod .. " + SHIFT + P", hl.dsp.exec_cmd(pickers.power))
hl.bind(main_mod .. " + SHIFT + W", hl.dsp.exec_cmd(pickers.wallpaper))
hl.bind(main_mod .. " + SHIFT + N", hl.dsp.exec_cmd(pickers.network))
hl.bind("PRINT", hl.dsp.exec_cmd("screenshot desktop"))

-- Toggle waybar visibility
hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

hl.bind(main_mod .. "+ SHIFT + C", hl.dsp.exec_cmd(apps.clipboard.add))
hl.bind(main_mod .. "+ SHIFT + V", hl.dsp.exec_cmd(apps.clipboard.copy))
hl.bind(main_mod .. "+ SHIFT + X", hl.dsp.exec_cmd(apps.clipboard.delete))

hl.bind(main_mod .. " + Q", hl.dsp.window.close())
hl.bind(
	main_mod .. "+ F",
	hl.dsp.window.fullscreen_state({
		internal = 3,
		client = 0,
	}),
	{
		action = "toggle",
		long_press = true,
	}
)
hl.bind(main_mod .. "+ F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(main_mod .. "+ SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + S", hl.dsp.layout("togglesplit"))

-- Move focus with mainMod + arrow keys
hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(
	main_mod .. " + space",
	hl.dsp.focus({ last = true }),
	{ action = "toggle", description = "Toggle focus between current and last window" }
)

hl.bind(
	main_mod .. "+ SHIFT + space",
	hl.dsp.window.cycle_next(),
	{ description = "Cycle focus between windows in the workspace" }
)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(main_mod .. " + T", hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod .. " + SHIFT + T", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
