## **DESKTOP ENVIRONMENT SETUP**

#### Install AUR helper
```sh
sudo pacman -Syu
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# cd to $HOME
cd ~

# Remove build files
rm -r yay
```

#### Install eww
```sh
yay -S eww
```

#### Install hyprland dependencies
```sh
sudo pacman -S hyprpaper ttf-jetbrains-mono-nerd stow thunar
```
