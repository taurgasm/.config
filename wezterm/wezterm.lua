local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local mux = wezterm.mux


config.audible_bell = "Disabled"
config.color_scheme = 'Catppuccin Frappe'
-- config.font = wezterm.font 'FiraCode Nerd Font Mono SemBd'
config.font = wezterm.font 'FiraCode Nerd Font Mono Ret'
-- config.font = wezterm.font('FiraCode Nerd Font Mono', {weight="Retina", stretch='Normal', })
config.font_size = 10
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
config.disable_default_key_bindings = true
config.leader = {key = 'a', mods='CTRL'}
config.keys = {
 { key = "a", mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
        { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        { key = "\\",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
        { key = "p", mods = "LEADER",       action="ActivateCommandPalette"},
        { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
        { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
        { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
        { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
        { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
        { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
        { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
        { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
        { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
        { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
        { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
        { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
        { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
        { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
        { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
        { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},

        { key = "n", mods="SHIFT|CTRL",     action="ToggleFullScreen" },
        { key ="v",  mods="SHIFT|CTRL",    action=wezterm.action.PasteFrom 'Clipboard'},
        { key ="c",  mods="SHIFT|CTRL",    action=wezterm.action.CopyTo 'Clipboard'},
        { key = "+", mods="SHIFT|CTRL",     action="IncreaseFontSize" },
        { key = "_", mods="SHIFT|CTRL",     action="DecreaseFontSize" },
        { key = ")", mods="SHIFT|CTRL",     action="ResetFontSize" },
  }
-- config.default_prog = {'C:/Users/TMaciulevicius/AppData/Local/Programs/Git/bin/bash.exe'}
config.default_prog = {'wsl.exe', '--cd', "~"}
-- config.default_cwd = {"/home/tmaciulevicius/"}
wezterm.on('gui-startup', function(spawnCmd)
  if spawnCmd then
  	if #(spawnCmd.args) > 0 then
  		local findName = string.lower(spawnCmd.args[1])
  		for _, menuItem in ipairs(config.launch_menu) do
			-- wezterm.log_info("Comparing launch first arg of: " .. findName .. " to: " .. string.lower(menuItem.label))
			if string.lower(menuItem.label) == findName then
				mux.spawn_window(menuItem)
			end
		end
  	end
  end
end)
config.launch_menu = {
  {
    label = 'WSL',
    args = {'wsl.exe', '--cd', '~'}
  },
  {
    label = 'Bash',
    args = {'C:/Users/TMaciulevicius/AppData/Local/Programs/Git/bin/bash.exe', }
  },
  {
    label = 'Server',
    args = {'C:/Users/TMaciulevicius/AppData/Local/Programs/Git/bin/bash.exe',"Ssh","AZ-NLAMS3-INVT1", "-l", "investments" }
  },

}
config.default_domain = 'WSL:Ubuntu'
-- if wezterm.target_triple == "x86_64-pc-windows-msvc" then
--     -- config.front_end = "Software" -- OpenGL doesn't work quite well with RDP.
--     -- config.term = "" -- Set to empty so FZF works on windows
--     table.insert(config.launch_menu, { label = "PowerShell", args = {"powershell.exe", "-NoLogo"} })
--         -- Find installed visual studio version(s) and add their compilation
--     -- environment command prompts to the menu
--     for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
--         local year = vsvers:gsub("Microsoft Visual Studio/", "")
--         table.insert(config.launch_menu, {
--             label = "x64 Native Tools VS " .. year,
--             args = {"cmd.exe", "/k", "C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat"},
--         })
--     end
-- else
--     config.default_prog = { '/bin/bash', '-l' }
--     table.insert(config.launch_menu, { label = "bash", args = {"bash", "-l"} })
--     table.insert(config.launch_menu, { label = "fish", args = {"fish", "-l"} })
-- end
-- }

return config
