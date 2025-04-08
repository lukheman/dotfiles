#!/usr/bin/bash

THEME="$HOME/.local/share/themes/$1" # selected theme

CONFIG_PATH="$HOME/.config"

# load color palette
source $THEME

apply_alacritty() {
  cat > "$CONFIG_PATH/alacritty/colors.toml" <<- EOF
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
  cat > "$CONFIG_PATH/polybar/colors.ini" <<- EOF
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
  # cp "$THEME/polybar/colors.ini" "$CONFIG_PATH/polybar/colors.ini"
}

apply_rofi() {

  cat > "$CONFIG_PATH/rofi/colors.rasi" <<- EOF
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

apply_waybar() {

  cat > "$CONFIG_PATH/waybar/color.css" <<- EOF
@define-color background ${background};
@define-color foreground ${foreground};
@define-color black ${black};
@define-color white ${white};
@define-color red ${red};
@define-color green ${green};
@define-color blue ${blue};
@define-color yellow ${yellow};
@define-color purple ${purple};
@define-color cyan ${cyan};
EOF

  killall waybar
  waybar &

}

apply_foot() {

  cat > "$CONFIG_PATH/foot/color.ini" <<- EOF

[colors]
foreground=${foreground}
background=${background}
regular0=${black}    # black
regular1=${red}      # red
regular2=${green}    # green
regular3=${yellow}   # yellow
regular4=${blue}     # blue
regular5=${purple}   # magenta
regular6=${cyan}     # cyan
regular7=${white}    # white
EOF

  # clean # in color.ini
  sed -i 's/#\([0-9a-fA-F]\+\)/\1/g' "$CONFIG_PATH/foot/color.ini"

  # reload foot
  printf '\033]110\007'
}

apply_alacritty
apply_tmux
apply_polybar
apply_rofi
apply_waybar
apply_foot
