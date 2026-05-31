# list packages
packages=(
  "network-manager-applet"
  "starship"
  "alacritty"
  "tmux"
  "fzf" "fd"
  "bspwm" "picom" "sxhkd"
  "git" "lazygit"
  "bat"
  "stylua"
  "neovim"
  "dunst" "libnotify"
  "fish"
  "stow"
  "rofi"
  "xdg-user-dirs"
  "bluez" "bluez-utils" "blueman"
  "pipewire" "pipewire-pulse"
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
# Create target directories if they don't exist
mkdir -p $HOME/.config $HOME/.local/bin $HOME/.local/share/fonts $HOME/.local/share/themes $HOME/.local/share/wallpapers

# Symlink .config directories
for dir in $HOME/dotfiles/.config/*; do
  ln -sfn "$dir" $HOME/.config/
done

# Symlink .local/bin files
for file in $HOME/dotfiles/.local/bin/*; do
  ln -sfn "$file" $HOME/.local/bin/
done

# Symlink home files
ln -sfn $HOME/dotfiles/home/.zshrc $HOME/
ln -sfn $HOME/dotfiles/home/.tmux.conf $HOME/

# Symlink share directories
cp -rsf $HOME/dotfiles/.local/share/fonts/* $HOME/.local/share/fonts/ 2>/dev/null
cp -rsf $HOME/dotfiles/.local/share/themes/* $HOME/.local/share/themes/ 2>/dev/null
cp -rsf $HOME/dotfiles/.local/share/wallpapers/* $HOME/.local/share/wallpapers/ 2>/dev/null

# restore my configuration
git clone https://github.com/lukheman/nvimrc.git $HOME/.config/nvim
echo "Restore configuration done"

# setting user dir
xdg-user-dirs-update
