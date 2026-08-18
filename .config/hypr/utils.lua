local M = {}

local constants = require 'constants'

M.display_enabled = true

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
