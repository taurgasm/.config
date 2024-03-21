local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Frappe'
config.font = wezterm.font 'FiraCode Nerd Font Mono'
--config.window_background_image = 'C:/Users/Tauras/Pictures/Backgrounds/green_3.gif'
config.background = {
	{
		source = {File = {path = 'C:/Users/Tauras/Pictures/Backgrounds/green_3.gif', speed = 0.05}},
		hsb = {
			brightness = 0.1,
			saturation = 0.5,
			hue = 1.0,
		},
		opacity = 0.9
	}
	}	
config.hide_tab_bar_if_only_one_tab = true
config.keys = {
{ action = wezterm.action.ActivateCommandPalette, mods = 'CTRL|SHIFT', key =     'P' },
{ action = wezterm.action.CopyTo    'Clipboard' , mods = 'CTRL|SHIFT', key =     'C' },
{ action = wezterm.action.DecreaseFontSize      , mods =       'CTRL', key =     '-' },
{ action = wezterm.action.IncreaseFontSize      , mods =       'CTRL', key =     '=' },
{ action = wezterm.action.Nop                   , mods =        'ALT', key = 'Enter' },
{ action = wezterm.action.PasteFrom 'Clipboard' , mods = 'CTRL', key =     'V' },
{ action = wezterm.action.ResetFontSize         , mods =       'CTRL', key =     '0' },
{ action = wezterm.action.ToggleFullScreen      ,                      key =   'F11' },
{ key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.ShowLauncher },
{ key = '8', mods = 'CTRL', action = wezterm.action.PaneSelect },
{ key = 'LeftArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left', },
{ key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right',},
{ key = 'UpArrow',   mods = 'CTRL|SHIFT',  action = wezterm.action.ActivatePaneDirection 'Up',},
{ key = 'DownArrow',  mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down',},
{ key = 'w',  mods = 'CTRL|SHIFT|ALT', action = wezterm.action.CloseCurrentPane { confirm = true },},
{ key = 'n', mods = 'CTRL|SHIFT', action = wezterm.action.SplitPane { direction = 'Right',  command = { args = { 'top' } },size = { Percent = 40 }, }, }, 
}
config.default_prog = {'C:/Program Files/Git/bin/bash.exe'}
config.launch_menu = {
  {
    args = { 'top' },
  },
  {
    -- Optional label to show in the launcher. If omitted, a label
    -- is derived from the `args`
    label = 'Bash',
    -- The argument array to spawn.  If omitted the default program
    -- will be used as described in the documentation above
    args = { 'C:/Program Files/Git/bin/bash.exe'  },

    -- You can specify an alternative current working directory;
    -- if you don't specify one then a default based on the OSC 7
    -- escape sequence will be used (see the Shell Integration
    -- docs), falling back to the home directory.
    -- cwd = "/some/path"

    -- You can override environment variables just for this command
    -- by setting this here.  It has the same semantics as the main
    -- set_environment_variables configuration option described above
    -- set_environment_variables = { FOO = "bar" },
  },
}
return config
