if status is-interactive
    # Commands to run in interactive sessions can go here
end

set TASKDDATA /var/lib/taskd


bass export EDITOR=$HOME/.local/bin/lvim
bass export GTK_IM_MODULE=ibus
bass export XMODIFIERS=@im=ibus
bass export QT_IM_MODULE=ibus
bass export NODE_OPTIONS=--openssl-legacy-provider # TEMPORARY

set MANPATH /usr/share/man/
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH
set fish_greeting

set GRADLE_USER_HOME $HOME/.gradle/wrapper/dists

alias run-steam="flatpak run com.valvesoftware.Steam"

kubectl completion fish | source

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

pyenv init - | source

starship init fish | source

