#!/bin/bash
sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | bash
rm install.log | true
spicetify restore backup apply
flatpak run com.spotify.Client
