#!/bin/bash

sudo dnf update
sudo dnf upgrade -y

#diretórios basicos
mkdir ~/.local
mkdir ~/.local/bin
mkdir ~/.local/share
mkdir ~/.local/share/bg
mkdir ~/.dwm
mkdir ~/projetos
mkdir ~/projetos/pessoal
mkdir ~/onedrive



#instalações básicas de dependencias
sudo dnf install -y \
    vim \
    git \
    nodejs \
    npm \
    python3-pip \
    python3-devel \
    golang \
    wget \
    curl \
    firefox \
    ranger \
    openssh-server \
    cmake \
    gcc \
    gdb \
    gpp \
    g++ \
    htop \
    tmux \
    net-tools \
    neofetch \
    deluge \
    gitk \
    rclone \
    gimp \
    libX11-devel \
    libXft-devel \
    libXinerama-devel \
    xorg-x11-xinit-session \
    steam \
    slock \
    xsetroot \
    feh



#config git
git config --global user.email "jeronimo.torres@outlook.com"
git config --global user.name "Jerônimo Torres"
git config --global credential.helper store
git config --global core.editor "vim"


#dotnet 
sudo dnf install dotnet-sdk-6.0 -y
sudo dnf install dotnet-sdk-5.0 -y


#php 
sudo dnf install -y php php-common php-mysqlnd php-pgsql php-zip php-bz2 php-composer-ca-bundle php-bcmath php-curl php-cgi php-date php-mbstring php-uuid phpunit

#flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sleep 10s
flatpak install flathub com.spotify.Client
flatpak install flathub net.cozic.joplin_desktop

#joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

#video stuff
sudo pip3 install subliminal
sudo pip3 install virtualenv
echo -e '\n' >> ~/.bashrc
echo 'alias sub="subliminal download -l pt-br ."' >> ~/.bashrc



#config de SSH
mkdir ~/.ssh
cp config ~/.ssh
ssh-keygen -t rsa -N ''

#onedrive rclone
cp  ./scripts/onedrive.sh ~/.local/bin

#docker
sudo dnf -y install dnf-plugins-core
 sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


#vim
sudo apt install build-essential cmake vim-nox python3-dev -y
sudo apt install mono-complete golang nodejs default-jdk npm -y
cp ./dotconfig/vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all

# instalando platformio e arduino
sudo pip install platformio 


#dwm
sudo dnf module install dwm:latest
git clone https://github.com/joetorres/dwm.git ~/projetos/pessoal/dwm
cd ~/projetos/pessoal/dwm
sudo make install
cp bg.jpg ~/.local/share/bg
cp ./scripts/autostart.sh ~/.dwm
cp scripts/*.sh ~/.local/bin
chmod +x autostart.sh
