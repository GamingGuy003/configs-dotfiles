if status is-interactive
    # Commands to run in interactive sessions can go here
    date
    source "$HOME/.cargo/env.fish"

    # Utility functions
    function y
        yazi
    end
    function power
        sudo poweroff
    end
    function powerpower
        sudo reboot
    end
    function lg
        lazygit
    end
    function q
        exit
    end

    function cleartex
        for p in *.aux *.bcf *.bbl *.blg *.run.xml *.toc *.fls *.out *.log *.fdb_latexmk *.pdf
            rm -vf $p ^/dev/null
        end
    end

    function bcdlp -d "Bandcamp artist downloader"
        yt-dlp -x --audio-format mp3 --add-metadata --embed-thumbnail \
            -o "%(artist)s/%(album)s/%(track_number)02d - %(title)s.%(ext)s" $argv
    end

    set -x SSH_AUTH_SOCK /home/gamingguy003/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
end

function fish_greeting
end

fish_add_path /home/gamingguy003/.spicetify
