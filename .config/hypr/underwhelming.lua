local constants = require 'constants'
local M = {}

local original_config = nil
local smart_gaps_rules = nil

local focus_mode = false

local minimal_bar = 'waybar --config ${HOME}/.config/waybar/minimal/config.jsonc --style ${HOME}/.config/waybar/minimal/style.css'
local minimal_term = 'foot --config=${HOME}/.config/foot/minimal.ini'

M.exec_term = function()
  local term = constants.terminal
  if focus_mode then term = minimal_term end

  hl.exec_cmd(term)
end

local minimal_config = {
  decoration = {
    rounding = 0,
    shadow = {
      enabled = false,
    },
    blur = {
      enabled = false,
    },
  },
  animations = {
    enabled = false,
  },
}

local function get_decorations_config()
  return {
    decoration = {
      rounding = hl.get_config 'decoration.rounding',
      shadow = {
        enabled = hl.get_config 'decoration.shadow.enabled',
      },
      blur = {
        enabled = hl.get_config 'decoration.blur.enabled',
      },
    },
    animations = {
      enabled = hl.get_config 'animations.enabled',
    },
  }
end

local function get_smart_gaps_rules()
  return {
    hl.workspace_rule { workspace = 'w[tv1]', gaps_out = 0, gaps_in = 0 },
    hl.workspace_rule { workspace = 'f[1]', gaps_out = 0, gaps_in = 0 },
    hl.window_rule {
      name = 'no-gaps-wtv1',
      match = { float = false, workspace = 'w[tv1]' },
      border_size = 0,
      rounding = 0,
    },
    hl.window_rule {
      name = 'no-gaps-f1',
      match = { float = false, workspace = 'f[1]' },
      border_size = 0,
      rounding = 0,
    },
  }
end

local function apply_config(config, bar, enable_rules)
  hl.config(config)
  hl.exec_cmd('pkill ' .. constants.apps.bar .. ' ; ' .. bar)

  if not smart_gaps_rules then return end

  for idx in pairs(smart_gaps_rules) do
    smart_gaps_rules[idx]:set_enabled(enable_rules)
  end
end

M.toggle_focus_mode = function()
  if original_config == nil then original_config = get_decorations_config() end
  if smart_gaps_rules == nil then smart_gaps_rules = get_smart_gaps_rules() end

  focus_mode = not focus_mode
  if focus_mode then
    apply_config(minimal_config, minimal_bar, true)
  else
    apply_config(original_config, constants.apps.bar, false)
  end
end

return M
