# if status is-interactive
# and not set -q TMUX
#     exec tmux
# end

function open_project
  # Gunakan fd untuk mencari direktori di tingkat pertama dalam folder Code
  set selected_project (fd . $HOME/Code/ --type d -d 1 | fzf --reverse)

  # Periksa apakah selected_project tidak kosong sebelum pindah direktori
  if test -n "$selected_project"
    cd "$selected_project"
    echo "Berada di directory: $selected_project"
  else
    echo "Tidak ada directory yang dipilih."
  end
end

function f
  if test (count $argv) -eq 0
    set selected_file (fd --type f --hidden --follow --exclude .git --exclude .local --exclude .cache --exclude env --exclude .ssh --exclude .cargo . | fzf --reverse --preview="bat --color=always {}")
    if test -n "$selected_file"
        $EDITOR "$selected_file"
    end
  else
    nvim $argv
  end
end

export EDITOR="nvim"
export DESKTOP_SESSION="bspwm"
export TMUXP_CONFIGDIR=$HOME/.tmuxp

set -x FZF_DEFAULT_OPTS '--bind=tab:down,shift-tab:up'

alias op=open_project
alias py=python

# general
alias ls="exa --icons --sort type"
alias lsa="ls -a"
# alias cat="bat"
alias ncm="ncmpcpp"

# config
alias viconf="cd ~/.config/nvim"

# text editor
alias vi="nvim"
alias hx="helix"
alias vidb="nvim -c \":DBUI\""

# git
alias gst="git status"

# translate shell
alias trid="trans en:id"
alias tred="trans id:ed"

starship init fish | source

# Created by `pipx` on 2024-07-20 10:24:03
set PATH $PATH /home/akmal/.local/bin
