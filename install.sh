# list packages
packages=(
  "network-manager-applet"
  "starship"
  "alacritty"
  "tmux"
  "fzf" "fd"
  "lxappearance-gtk3"
  "bspwm" "picom" "sxhkd"
  "git" "lazygit"
  "bat"
  "stylua"
  "ranger"
  "neovim"
  "dunst" "libnotify"
  "fish"
  "stow"
  "polybar"
  "rofi"
  "xdg-user-dirs"
  "flameshot"
  "feh" "ueberzug"
  "bluez" "bluez-utils" "blueman"
  "pipewire"
)

for item in "${packages[@]}"; do
  sudo pacman -S --noconfirm $item
done

echo "\n\n"
echo "Start to restore configuration..."

# restore configuration
git clone https://github.com/lukheman/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles

# in dotfiles directory
stow tmux alacritty bspwm picom sxhkd dunst fish polybar rofi qutebrowser


# restore my configuration
git clone https://github.com/lukheman/nvimrc.git $HOME/.config/nvim
echo "Restore configuration done"

# setting user dir
xdg-user-dirs-update

# ranger icons support
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
