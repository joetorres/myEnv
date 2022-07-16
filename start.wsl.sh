#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

#instalações básicas de dependencias
sudo apt-get install -y \
    firefox \
    golang \
    software-properties-common \
    apt-utils \
    vim \
    git \
    nodejs \
    npm \
    python3-pip \
    wget curl \
    ranger \
    taskwarrior \
    ssh \
    chromium-browser \
    cmake \
    gcc \
    gdb \
    gpp \
    g++ \
    htop \
    tmux \
    net-tools \
    neofetch \
    apt-transport-https \
    gnupg-agent \
    ca-certificates \
    gitk \
    mpv \
    snapd \
    rclone \
    lua5.3
    

#config git
git config --global user.email "jeronimo.torres@outlook.com"
git config --global user.name "Jerônimo Torres"
git config --global credential.helper store
git config --global core.editor "vim"



#dotnet
wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install dotnet-sdk-6.0 -y


#config de SSH
ssh-keygen


#node
sudo npm i -g npm 
sudo npm i -g n 
sudo n lts
sudo rm /usr/bin/nodejs
sudo ln -s /usr/local/bin/node /usr/bin/nodejs


#vim
cp ./dotconfig/vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all