set fish_greeting


if status is-interactive
    # Commands to run in interactive sessions can go here
end

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
bass export NODE_OPTIONS=--openssl-legacy-provider # TEMPORARY

# Created by `pipx` on 2023-04-14 21:55:24
set PATH $PATH /home/alexl/.local/bin
$HOME/.cargo/bin/rtx activate fish | source
