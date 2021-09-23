sudo dnf makecache

#==========================================================================================================================================================
# Shells and stuff

sudo dnf install zsh dash -y
ln -sfT dash /usr/bin/sh

# kitty terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

#==========================================================================================================================================================
# More Fedora repositories

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

 
# #==========================================================================================================================================================
# Audio and Video stuff
 
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia -y
 
 
# #==========================================================================================================================================================
# Drivers and stuff
 
sudo dnf install 'wireless-tools' -y
sudo dnf install kmod-wl -y
sudo dnf groupinstall "Development Tools" -y
sudo dnf groupinstall "C Development Tools and Libraries" -y
sudo dnf install elfutils-libelf-devel unzip -y
sudo dnf install dkms kernel-devel kernel-headers -y
sudo dnf install lshw -y
 
 
# #==========================================================================================================================================================
# Ricing and stuff

# download and install omz
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# fuzzy finder
sudo dnf install fzf -y

# zsh auto completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions


#zsh auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


#download powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# Installing imagemagick
sudo dnf install -y Imagemagick

cp ./.p10k.zsh $HOME
cp ./.zshrc $HOME

sudo dnf install -y i3 i3status dmenu i3lock xbacklight feh conky picom xrandr
sudo dnf install -y python-dbus dunst xset

# #==========================================================================================================================================================
# Editors and other extras.. and stuff

yes | sudo dnf copr enable agriffis/neovim-nightly
sudo dnf install -y neovim python3-neovim

sudo dnf -y install npm

# Neovim vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

yes | ssh-keygen -t rsa -b 8192 -f gitLab -N ''
mkdir ~/.ssh
mv ./gitLab ~/.ssh/
mv ./gitLab.pub ~/.ssh/


sudo dnf install -y snapd
sudo ln -s /var/lib/snapd/snap /snap

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

