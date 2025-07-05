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

function shon
    eval (ssh-agent -c)
    ssh-add ~/.ssh/akmal
end

# # Setiap kali pindah direktori, simpan ke file
# function save_pwd --on-variable PWD
#     echo $PWD > ~/.last_dir
# end
#
# # Saat shell dimulai, cd ke direktori terakhir jika ada
# if test -f ~/.last_dir
#     set last_dir (cat ~/.last_dir)
#     if test -d $last_dir
#         cd $last_dir
#     end
# end

export EDITOR="nvim"
export DESKTOP_SESSION="bspwm"
export TMUXP_CONFIGDIR=$HOME/.tmuxp

# export QT_QPA_PLATFORMTHEME="qt5ct"

# wayland fix
export QT_QPA_PLATFORM=wayland

#export XDG_CURRENT_DESKTOP=hyprland
#export XDG_SESSION_DESKTOP=hyprland
#export XDG_CURRENT_SESSION_TYPE=wayland
#export GDK_BACKEND="wayland,x11"
#export MDZ_ENABLE_WAYLAND=1

set -x FZF_DEFAULT_OPTS '--bind=tab:down,shift-tab:up'

# nvm
set -x NVM_DIR $HOME/.nvm
set -x PATH $NVM_DIR/bin $PATH

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
alias v="nvim"
alias vihb="nvim -c \"colorscheme habamax\""
alias hx="helix"
alias vidb="nvim -c \":DBUI\""

# git
alias gst="git status"

# translate shell
alias trid="trans en:id"
alias tred="trans id:ed"

# laravel
alias artisan="php artisan"

alias y="yazi"

starship init fish | source
atuin init fish | source


# Created by `pipx` on 2024-07-20 10:24:03
set PATH $PATH /home/akmal/.local/bin
