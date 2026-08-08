local constants = require 'constants'
local utils = require 'utils'

local pickers = constants.pickers
local apps = constants.apps
local cmd = constants.commands

local mod = 'ALT'

hl.bind(mod .. ' + Q', hl.dsp.window.close())
hl.bind(mod .. ' + SHIFT + E', hl.dsp.exec_cmd(cmd.exit))

hl.bind(mod .. ' + RETURN', hl.dsp.exec_cmd(constants.terminal))
hl.bind(mod .. ' + D', hl.dsp.exec_cmd(pickers.app))
hl.bind(mod .. ' + E', hl.dsp.exec_cmd(apps.file_manager))
hl.bind(mod .. ' + B', hl.dsp.exec_cmd(apps.browser))
hl.bind(mod .. ' + W', hl.dsp.exec_cmd(pickers.window))
hl.bind(mod .. ' + SHIFT + M', hl.dsp.exec_cmd(apps.music))
hl.bind(mod .. ' + SHIFT + P', hl.dsp.exec_cmd(pickers.power))
hl.bind(mod .. ' + SHIFT + W', hl.dsp.exec_cmd(pickers.wallpaper))
hl.bind(mod .. ' + SHIFT + N', hl.dsp.exec_cmd(pickers.network))
hl.bind('PRINT', hl.dsp.exec_cmd(cmd.screenshot.desktop))

hl.bind('SUPER + SUPER_L', utils.toggle_waybar, { description = 'Toggle waybar visibility' })

hl.bind(mod .. '+ SHIFT + C', hl.dsp.exec_cmd(cmd.clipboard.add))
hl.bind(mod .. '+ SHIFT + V', hl.dsp.exec_cmd(cmd.clipboard.copy))
hl.bind(mod .. '+ SHIFT + X', hl.dsp.exec_cmd(cmd.clipboard.delete))

hl.bind(
  mod .. '+ F',
  hl.dsp.window.fullscreen_state {
    internal = 3,
    client = 0,
  },
  {
    action = 'toggle',
    long_press = true,
  }
)

hl.bind(mod .. '+ F', utils.toggle_fullscreen, { description = 'Toggle fullscreen and waybar' })
hl.bind(mod .. '+ SHIFT + F', hl.dsp.window.float { action = 'toggle' })
hl.bind(mod .. ' + P', hl.dsp.window.pseudo())
hl.bind(mod .. ' + S', hl.dsp.layout 'togglesplit')

-- Move focus with mainMod + arrow keys
hl.bind(mod .. ' + h', hl.dsp.focus { direction = 'left' })
hl.bind(mod .. ' + l', hl.dsp.focus { direction = 'right' })
hl.bind(mod .. ' + k', hl.dsp.focus { direction = 'up' })
hl.bind(mod .. ' + j', hl.dsp.focus { direction = 'down' })

-- Swap windows within workspace
hl.bind(mod .. ' + SHIFT + j', hl.dsp.window.swap { direction = 'down' })
hl.bind(mod .. ' + SHIFT + k', hl.dsp.window.swap { direction = 'up' })
hl.bind(mod .. ' + SHIFT + h', hl.dsp.window.swap { direction = 'left' })
hl.bind(mod .. ' + SHIFT + l', hl.dsp.window.swap { direction = 'right' })

hl.bind(
  mod .. ' + space',
  hl.dsp.focus { last = true },
  { action = 'toggle', description = 'Toggle focus between current and last window' }
)

hl.bind(
  mod .. '+ SHIFT + space',
  hl.dsp.window.cycle_next(),
  { description = 'Cycle focus between windows in the workspace' }
)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mod .. ' + ' .. key, hl.dsp.focus { workspace = i })
  hl.bind(mod .. ' + SHIFT + ' .. key, hl.dsp.window.move { workspace = i })
end

-- Special workspace (scratchpad)
hl.bind(mod .. ' + T', hl.dsp.workspace.toggle_special 'magic')
hl.bind(mod .. ' + SHIFT + T', hl.dsp.window.move { workspace = 'special:magic' })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd(cmd.audio.sink.raise), { locked = true, repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd(cmd.audio.sink.lower), { locked = true, repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd(cmd.audio.sink.toggle), { locked = true, repeating = true })
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd(cmd.audio.source.toggle), { locked = true, repeating = true })

hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd(cmd.brightness.raise), { locked = true, repeating = true })
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd(cmd.brightness.lower), { locked = true, repeating = true })

hl.bind('XF86AudioNext', hl.dsp.exec_cmd(cmd.media.next), { locked = true })
hl.bind('XF86AudioPause', hl.dsp.exec_cmd(cmd.media.toggle), { locked = true })
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd(cmd.media.toggle), { locked = true })
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd(cmd.media.previous), { locked = true })

-- Switches
hl.bind('switch:on:Lid Switch', utils.handle_lid_close, { locked = true })
hl.bind('switch:off:Lid Switch', utils.handle_lid_open, { locked = true })

-- Submap
hl.bind(mod .. ' + SHIFT + O', hl.dsp.submap 'clean', { description = 'Turn off keymaps' })
hl.define_submap(
  'clean',
  function() hl.bind(mod .. ' + SHIFT + R', hl.dsp.submap 'reset', { description = 'Restore keymaps' }) end
)

hl.bind(mod .. ' + R', hl.dsp.submap('resize', { description = 'Resize windows' }))
hl.define_submap('resize', function()
  -- Set repeating binds for resizing the active window.
  hl.bind('l', hl.dsp.window.resize { x = 10, y = 0, relative = true }, { repeating = true })
  hl.bind('h', hl.dsp.window.resize { x = -10, y = 0, relative = true }, { repeating = true })
  hl.bind('k', hl.dsp.window.resize { x = 0, y = 10, relative = true }, { repeating = true })
  hl.bind('j', hl.dsp.window.resize { x = 0, y = -10, relative = true }, { repeating = true })

  -- Use `reset` to go back to the global submap
  hl.bind('ESCAPE', hl.dsp.submap 'reset')
end)
