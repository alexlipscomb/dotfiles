if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr -a pvim pdm run lvim

nvm use 16.16.0

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

pyenv init - | source

starship init fish | source
