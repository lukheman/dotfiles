#!/usr/bin/bash


THEME="$HOME/dotfiles/themes/onedark-warmer"
PATH_CONFIG="$HOME/.config"

# load color palette
source "$THEME/palette.bash"

apply_alacritty() {
  cat > "$PATH_CONFIG/alacritty/colors.toml" <<- EOF
[colors.primary]
background = "${background}"
foreground = "${foreground}"

[colors.cursor]
cursor = "${foreground}"
text = "${background}"

[colors.normal]
black  = "${black}"
white  = "${white}"
blue   = "${blue}"
cyan   = "${cyan}"
green  = "${green}"
magenta= "${purple}"
red    = "${red}"
yellow = "${yellow}"
EOF
}


apply_tmux() {
  cat > $HOME/.tmux-theme.conf <<- EOF
set -g @background "${background}"
set -g @foreground "${foreground}"
set -g @black      "${black}"
set -g @white      "${white}"
set -g @red        "${red}"
set -g @green      "${green}"
set -g @blue       "${blue}"
set -g @yellow     "${yellow}"
set -g @purple     "${purple}"
set -g @cyan       "${cyan}"
EOF
  tmux source-file ~/.tmux.conf
}

apply_polybar() {
  cat > "$PATH_CONFIG/polybar/colors.ini" <<- EOF
[colors]
background = "${background}"
foreground = "${foreground}"
black      = "${black}"
white      = "${white}"
blue       = "${blue}"
cyan       = "${cyan}"
green      = "${green}"
purple     = "${purple}"
red        = "${red}"
yellow     = "${yellow}"
EOF
  # cp "$THEME/polybar/colors.ini" "$PATH_CONFIG/polybar/colors.ini"
}

apply_rofi() {

  cat > "$PATH_CONFIG/rofi/colors.rasi" <<- EOF
* {
  background : ${background};
  foreground : ${foreground};
  black      : ${black};
  white      : ${white};
  blue       : ${blue};
  cyan       : ${cyan};
  green      : ${green};
  purple     : ${purple};
  red        : ${red};
  yellow     : ${yellow};
}
EOF
}

apply_alacritty
apply_tmux
apply_polybar
apply_rofi
