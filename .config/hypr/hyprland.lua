local constants = require 'constants'

require 'ui'
require 'rules'
require 'keybinds'
require 'autostart'
require 'input'

-- MONITORS
hl.monitor {
  output = '',
  mode = 'preferred',
  position = 'auto',
  scale = 'auto',
}

hl.monitor(constants.laptop_monitor_spec)

hl.config {
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    disable_autoreload = true,
  },

  xwayland = {
    force_zero_scaling = true,
  },
}
