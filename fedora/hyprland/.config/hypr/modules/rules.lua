-- assign workspaces to monitors
hl.workspace_rule({ workspace = "r[1-5]", monitor = "DP-1" }) -- Loop through workspaces 6 and 7 individually
for w = 1, 5 do
	hl.workspace_rule({
		workspace = tostring(w),
		monitor = "DP-1",
	})
end
for w = 6, 7 do
	hl.workspace_rule({
		workspace = tostring(w),
		monitor = "DP-2",
		layout_opts = { orientation = "top" },
	})
end
for w = 8, 9 do
	hl.workspace_rule({
		workspace = tostring(w),
		monitor = "HDMI-A-1",
		layout_opts = { orientation = "top" },
	})
end

-- make single windows centered
hl.workspace_rule({ workspace = "r[6-9] w[t1]", gaps_out = { top = 260, left = 10, bottom = 160, right = 10 } })

-- window rules
hl.window_rule({
	float = true,
	size = { 400, 600 },
	move = { "cursor_x - 200", "cursor_y - 60" },
	match = { title = "(.*)(CopyQ)$" },
})
hl.window_rule({
	float = true,
	match = { class = "(org.gnome.Calculator)$" },
})
hl.window_rule({
	fullscreen = true,
	monitor = "DP-1",
	match = { title = "^(Steam Big Picture Mode)$" },
})
hl.window_rule({
	float = true,
	size = { 480, 854 },
	match = { title = "(Waydroid)$" },
})
hl.window_rule({
	monitor = "DP-1",
	match = { initial_title = "(osu!)$" },
})
hl.window_rule({
	monitor = "DP-1",
	tile = true,
	match = { initial_title = "(Content Manager (Lite mode))$" },
})
