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
    ranger \
    taskwarrior \
    ssh \
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
    apt-transport-https \
    gnupg-agent \
    ca-certificates \
    snapd \
    rclone
  

#config git
git config --global user.email "jeronimo@mykolab.com"
git config --global user.name "Jerônimo Torres"
git config --global credential.helper store
git config --global core.editor "vim"



#dotnet
wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install dotnet-sdk-5.0 -y
sudo apt-get install dotnet-sdk-3.1 -y
sudo apt-get install dotnet-sdk-2.1 -y


#config de SSH
mkdir ~/.ssh
cp config ~/.ssh
ssh-keygen
ssh-copy-id bahamut


#node
sudo npm i -g npm 
sudo npm i -g n 
sudo n lts
sudo rm /usr/bin/nodejs
sudo ln -s /usr/local/bin/node /usr/bin/nodejs


#vim
sudo apt install build-essential cmake vim-nox python3-dev -y
sudo apt install mono-complete golang nodejs default-jdk npm -y
cp vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree