local M = {}

M.waybar_visible = true

M.toggle_waybar = function()
	local toggle_waybar_cmd = "pkill -SIGUSR1 waybar"
	hl.exec_cmd(toggle_waybar_cmd)
	M.waybar_visible = not M.waybar_visible
end

--- Toggle fullscreen mode
--- Hides waybar in fullscreen mode and shows it otherwise
M.toggle_fullscreen = function()
	local FULLSCREEN <const> = 2

	hl.dispatch(hl.dsp.window.fullscreen({ action = "toggle" }))

	local window = hl.get_active_window()
	if window == nil then
		return
	end

	local show_waybar = window.fullscreen ~= FULLSCREEN
	if M.waybar_visible ~= show_waybar then
		M.toggle_waybar()
	end
end

return M
