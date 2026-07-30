local M = {}

local constants = require 'constants'

M.waybar_visible = true
M.display_enabled = true

M.toggle_waybar = function()
  local toggle_waybar_cmd = 'pkill -SIGUSR1 waybar'
  hl.exec_cmd(toggle_waybar_cmd)
  M.waybar_visible = not M.waybar_visible
end

--- Toggle fullscreen mode
--- Hides waybar in fullscreen mode and shows it otherwise
M.toggle_fullscreen = function()
  local FULLSCREEN <const> = 2

  hl.dispatch(hl.dsp.window.fullscreen { action = 'toggle' })

  local window = hl.get_active_window()
  if window == nil then return end

  local show_waybar = window.fullscreen ~= FULLSCREEN
  if M.waybar_visible ~= show_waybar then M.toggle_waybar() end
end

--- Turns off the laptop monitor if we have two monitors
M.handle_lid_close = function()
  local monitors = hl.get_monitors()
  if #monitors <= 1 then return end

  local laptop_monitor_spec = constants.laptop_monitor_spec
  laptop_monitor_spec.disabled = true
  hl.monitor(laptop_monitor_spec)
end

M.handle_lid_open = function()
  local laptop_monitor_spec = constants.laptop_monitor_spec
  laptop_monitor_spec.disabled = false
  hl.monitor(laptop_monitor_spec)
end

return M
