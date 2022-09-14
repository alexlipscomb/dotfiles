if status is-interactive
    # Commands to run in interactive sessions can go here
end

bass export GTK_IM_MODULE=ibus
bass export XMODIFIERS=@im=ibus
bass export QT_IM_MODULE=ibus

set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH

alias run-steam="flatpak run com.valvesoftware.Steam"

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

pyenv init - | source

starship init fish | source
