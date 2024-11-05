if status is-interactive
    # Commands to run in interactive sessions can go here
  date
  alias q='exit'
  alias power='sudo poweroff'
  alias powerpower='sudo reboot'
  alias lg='lazygit'
  source "$HOME/.cargo/env.fish"
end

function fish_greeting
end


fish_add_path /home/gamingguy003/.spicetify
