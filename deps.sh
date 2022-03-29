sudo dnf makecache

#==========================================================================================================================================================
# Shells and stuff

sudo dnf install zsh dash -y
ln -sfT dash /usr/bin/sh

# kitty terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in your PATH)
sudo mkdir -p ~/.local/bin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# Update the path to the kitty icon in the kitty.desktop file
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop

#==========================================================================================================================================================
# More Fedora repositories

#rpm fusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

#albert
sudo rpm --import "https://build.opensuse.org/projects/home:manuelschneid3r/public_key"
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_34/home:manuelschneid3r.repo

 
# #==========================================================================================================================================================
# Audio and Video stuff
 
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia -y
 
 
# #==========================================================================================================================================================
# Drivers and stuff
 
#sudo dnf install 'wireless-tools' -y
#sudo dnf install kmod-wl -y
#sudo dnf groupinstall "Development Tools" -y
#sudo dnf groupinstall "C Development Tools and Libraries" -y
#sudo dnf install elfutils-libelf-devel unzip -y
#sudo dnf install dkms kernel-devel kernel-headers -y
#sudo dnf install lshw -y
 
 
# #==========================================================================================================================================================
# Ricing and stuff

# albert with picom for a clean finish
sudo dnf install -y picom albert

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
sudo dnf install -y ImageMagick

cp ./.p10k.zsh $HOME
cp ./.zshrc $HOME

# #==========================================================================================================================================================
# Editors and other extras.. and stuff

yes | sudo dnf copr enable agriffis/neovim-nightly
sudo dnf install -y neovim python3-neovim

# installing npm

sudo dnf install -y  npm

# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
# make sure the required folders exist (safe to execute even if they already exist)
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

npm install -g n
npm install -g typescript
#npm install -g @angular/cli

# Neovim vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

mkdir ~/.ssh
pushd $HOME/.ssh
yes | ssh-keygen -t rsa -b 8192 -f git -N ''
popd

sudo dnf install -y snapd
sudo ln -s /var/lib/snapd/snap /snap

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
