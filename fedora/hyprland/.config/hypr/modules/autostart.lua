hl.on("hyprland.start", function()
	-- essential components
	hl.exec_cmd("$HOME/.config/waybar/waybar.sh")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("kdeconnect-cli --refresh")
	hl.exec_cmd("kdeconnect-indicator")
	hl.exec_cmd("copyq --start-server")
	hl.exec_cmd("nextcloud --background")
	-- exec-once = openrgb -p white // replaced by systemd user service
	hl.exec_cmd("playerctld")
	hl.exec_cmd("dunst")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	--exec-once = lxpolkit
	hl.exec_cmd("blueman-applet")
	--bitwarden for ssh authentication
	hl.exec_cmd("flatpak run com.bitwarden.desktop")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
	--kill portals
	hl.exec_cmd("killall -e xdg-desktop-portal-hyprland")
	hl.exec_cmd("killall -e xdg-desktop-portal-gtk")
	hl.exec_cmd("killall -e xdg-desktop-portal")

	--start portals
	hl.exec_cmd("/usr/libexec/xdg-desktop-portal-hyprland")
	hl.exec_cmd("sleep 2 && /usr/libexec/xdg-desktop-portal-gtk")
	hl.exec_cmd("sleep 3 && /usr/libexec/xdg-desktop-portal")

	--dark theme
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
	--icons
	hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme kora")
	--cursor
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")
	--terminal
	hl.exec_cmd("gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty")
	--open tablet driver
	hl.exec_cmd("otd-daemon")
end)
