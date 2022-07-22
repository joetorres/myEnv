#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

#instalações básicas de dependencias
sudo apt-get install -y \
    software-properties-common \
    apt-utils \
    vim \
    git \
    nodejs \
    npm \
    python3-pip \
    wget curl \
    firefox \
    ranger \
    taskwarrior \
    ssh \
    cmake \
    default-jdk \
    build-essential \
    vim-nox \
    python3-dev \
    mono-complete \
    gcc \
    gdb \
    gpp \
    g++ \
    golang \
    htop \
    tmux \
    net-tools \
    neofetch \
    deluge \
    apt-transport-https \
    gnupg-agent \
    ca-certificates \
    gitk \
    mpv \
    snapd \
    rclone
    


#config git
git config --global user.email "jeronimo.torres@outlook.com"
git config --global user.name "Jerônimo Torres"
git config --global credential.helper store
git config --global core.editor "vim"
git config pull.rebase false 


#dotnet
wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install dotnet-sdk-6.0 -y

#php 
sudo apt install php php-common php-mysql php-pgsql php-zip php-bz2 php-composer-ca-bundle php-bcmath php-curl php-cgi php-date php-mbstring php-uuid phpunit -y


#video stuff
sudo pip3 install subliminal
sudo pip3 install virtualenv
echo -e '\n' >> ~/.bashrc
echo 'alias sub="subliminal download -l pt-br ."' >> ~/.bashrc


#config de SSH
cp config ~/.ssh

#node
#install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
nvm use --lts

#vim
cp vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all

# instalando platformio e arduino
pip install platformio 
curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/master/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
sudo service udev restart

