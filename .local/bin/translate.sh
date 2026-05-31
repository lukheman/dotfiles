
# text=$(xclip -selection clipboard -o)
text=$(wl-paste)
translate=$(trans en:id -shell -brief "$text")

theme="$HOME/.config/rofi/powermenu/style.rasi"
rofi -dmenu -mesg "$translate" -theme ${theme}
