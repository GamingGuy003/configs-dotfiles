-- define monitors
hl.monitor({
	output = "DP-2",
	mode = "1920x1080@60",
	position = "0x-360",
	transform = 1,
})
hl.monitor({
	output = "DP-1",
	mode = "3440x1440@180",
	position = "1080x0",
	transform = 0,
	vrr = false,
})
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "4520x-360",
	transform = 3,
})
