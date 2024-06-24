# if status is-interactive
# and not set -q TMUX
#     exec tmux
# end

function fzf_tmux
    set selected_dir (fd --type d --hidden --follow --exclude .git --exclude env . $HOME | fzf --height 40% --reverse --border)
    if test -n "$selected_dir"
        set session_name (basename "$selected_dir")

        # Check if running inside tmux
        if test -n "$TMUX"
          cd "$selected_dir"
          # if tmux list-windows -F "#{window_name}" | grep -q "^$window_name\$"
          #   tmux select-window -t "$window_name"
          # else
          #     # tmux new-window -c "$selected_dir" -n "$window_name"
          #   tmux new-window -c "$selected_dir"
          # end
        else
          tmux new-session -s "$session_name" -c "$selected_dir"
        end
    end
end

function fzf_open_with_editor
    set selected_file (fd --type f --hidden --follow --exclude .git . | fzf --height 40% --reverse --border)
    if test -n "$selected_file"
        $EDITOR "$selected_file"
    end
end

# Binding Ctrl+F to the fzf_tmux function
alias f=fzf_tmux
alias ff=fzf_open_with_editor

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
