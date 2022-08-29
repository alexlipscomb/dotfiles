if status is-interactive
    # Commands to run in interactive sessions can go here
end

nvm use 16.16.0

bass export GTK_IM_MODULE=ibus
bass export XMODIFIERS=@im=ibus
bass export QT_IM_MODULE=ibus

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

pyenv init - | source

starship init fish | source
