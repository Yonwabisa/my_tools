sudo dnf makecache

#==========================================================================================================================================================
# Shells and stuff

sudo dnf install zsh dash -y

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


mkdir ~/.ssh
pushd $HOME/.ssh
yes | ssh-keygen -t rsa -b 8192 -f git -N ''
popd

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

git clone https://github.com/nwg-piotr/autotiling.git
chmod +x ./autotiling/main.py
mv ./autotiling/main.py ~/.bin/autotiling

pip install --user bumblebee-status
sudo dnf install -y dunst gnome-system-monitor python-pulsectl xset


# Get Homebrew

git clone https://github.com/Homebrew/install.git
/bin/bash -c ./install/install.sh
(echo; echo eval export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH:$MANPATH};";
export INFOPATH="/home/linuxbrew/.linuxbrew/share/infor:${INFOPATH:-}";) >> /home/$USER/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Getting nice terminal theme-ey stuff from brew
brew install lsd
