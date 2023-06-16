THEME_DIR="/nix/store/4mwrzqfyldxcygdfn8lld7j36zgksjai-catppuccin-gtk-0.4.1/share/themes/Catppuccin-Frappe-Standard-Lavender-Dark"

echo "Should be a theme folders content:"
ls -la ${THEME_DIR}
mkdir -p "${HOME}/.config/gtk-4.0"

echo "Unlinking..."

unlink "${HOME}/.config/gtk-4.0/assets"
unlink "${HOME}/.config/gtk-4.0/gtk.css"
unlink "${HOME}/.config/gtk-4.0/gtk-dark.css"

echo "Should be empty now:"
ls -la "${HOME}/.config/gtk-4.0"

echo "Creating new links..."

ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"