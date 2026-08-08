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
