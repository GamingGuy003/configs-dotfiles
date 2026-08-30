-- env variables
require("modules.env")
-- autostart
require("modules.autostart")
-- monitor configuration
require("modules.monitors")
-- keybinds
require("modules.keybinds")
-- workspace and windowrules
require("modules.rules")

-- core hyprland config
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "compose:rctrl",
		accel_profile = "flat",
		touchpad = {
			natural_scroll = true,
		},
	},
	xwayland = { force_zero_scaling = true },
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		col = {
			active_border = {
				colors = { "rgba(7aa2f7ee)", "rgba(bb9af7ee)" },
				angle = 45,
			},
			inactive_border = "rgba(414868ee)",
		},
		resize_on_border = true,
		hover_icon_on_border = true,
		layout = "master",
	},
	misc = {
		animate_manual_resizes = false,
		disable_splash_rendering = true,
	},
	decoration = {
		rounding = 5,
		dim_strength = 0.2,
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
		},
		shadow = {
			enabled = true,
			range = 10,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
	},
	animations = {
		enabled = true,
	},
	master = {
		orientation = "left",
		mfact = 0.60,
	},
})

hl.curve("windows", {
	type = "bezier",
	points = { { 0.85, 0 }, { 0.15, 1 } },
})

hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "windows" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "windows" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "windows" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "windows" })
