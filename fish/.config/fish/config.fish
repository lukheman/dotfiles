if status is-interactive
and not set -q TMUX
    exec tmux
end


export EDITOR="nvim"

# general
alias ls="exa"
alias cat="bat"

# config
alias viconf="cd ~/.config/nvim"

# text editor
alias vi="nvim"
alias hx="helix"

# git
alias gst="git status"

starship init fish | source
