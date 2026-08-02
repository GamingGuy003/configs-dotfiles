-- system binds
hl.bind("SUPER + Return", hl.dsp.exec_raw("kitty"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.kill())
hl.bind("SUPER + ALT + 0", hl.dsp.exit())
hl.bind("SUPER + E", hl.dsp.exec_raw("xdg-open ~"))
hl.bind("SUPER + N", hl.dsp.exec_raw("xdg-open https://"))
hl.bind("SUPER + D", hl.dsp.exec_raw("fuzzel --show-actions"))
hl.bind("SUPER + L", hl.dsp.exec_raw("hyprlock"))
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_raw("flatpak run net.nokyan.Resources"))
hl.bind("SUPER + V", hl.dsp.exec_raw("copyq show"))

-- window
hl.bind("SUPER + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + ALT + left", hl.dsp.layout("orientationleft"))
hl.bind("SUPER + ALT + right", hl.dsp.layout("orientationright"))
hl.bind("SUPER + ALT + down", hl.dsp.layout("orientationbottom"))
hl.bind("SUPER + ALT + up", hl.dsp.layout("orientationtop"))
hl.bind("SUPER + ALT + Space", hl.dsp.layout("orientationcenter"))
hl.bind("SUPER + H", hl.dsp.exec_raw("wtype sondig"))

-- screenshot
hl.bind(
	"SUPER + PRINT",
	hl.dsp.exec_cmd("killall -9 hyprpicker || hyprshot -z -m output -f \"$(date '+%y%m%d_%H-%M-%S').png\""),
	{ description = "select a monitor" }
)
hl.bind(
	"PRINT",
	hl.dsp.exec_cmd("killall -9 hyprpicker || hyprshot -z -m window -f \"$(date '+%y%m%d_%H-%M-%S').png\""),
	{ description = "select a window" }
)
hl.bind(
	"SUPER + SHIFT + S",
	hl.dsp.exec_cmd("killall -9 hyprpicker || hyprshot -z -m region -f \"$(date '+%y%m%d_%H-%M-%S').png\""),
	{ description = "select a region" }
)
hl.bind(
	"SUPER + SHIFT + PRINT",
	hl.dsp.exec_cmd("killall -9 hyprpicker || hyprshot -z -m window -m active -f \"$(date '+%y%m%d_%H-%M-%S').png\""),
	{ description = "use current window" }
)

-- move focus
hl.bind("SUPER + left", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "d" }))
hl.bind("ALT + TAB", hl.dsp.focus({ last = true }))
hl.bind("SUPER + TAB", hl.dsp.exec_raw("~/.config/hypr/window_switcher.sh"))

-- swap windows
hl.bind("SUPER + SHIFT + left", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.swap({ direction = "d" }))

for workspace = 1, 9 do
	-- focus workspace
	hl.bind("SUPER + " .. workspace, hl.dsp.focus({ workspace = workspace }))
	-- move to workspace
	hl.bind("SUPER + SHIFT + " .. workspace, hl.dsp.window.move({ workspace = workspace }))
end

-- drag window
hl.bind("SUPER + F", hl.dsp.window.drag())

-- resize
hl.bind("SUPER + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	hl.bind("SUPER + R", hl.dsp.submap("reset"))
end)

-- audio
hl.bind("XF86AudioPlay", hl.dsp.exec_raw("playerctl play-pause"), { locked = true })
hl.bind("XF86Tools", hl.dsp.exec_raw("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
