local constants = require 'constants'
hl.on('hyprland.start', function()
  hl.exec_cmd(constants.terminal)
  hl.exec_cmd(constants.apps.bar)
  hl.exec_cmd(constants.commands.restore_wallpaper)
  hl.exec_cmd(constants.apps.music_daemon)
end)
