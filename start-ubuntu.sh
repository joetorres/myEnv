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
    deluge \
    apt-transport-https \
    gnupg-agent \
    ca-certificates \
    gitk \
    mpv \
    snapd \
    rclone \
    arduino





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
sudo apt-get install dotnet-sdk-5.0 -y
sudo apt-get install dotnet-sdk-3.1 -y
sudo apt-get install dotnet-sdk-2.1 -y

#php 
sudo apt install php php-common php-mysql php-pgsql php-zip php-bz2 php-composer-ca-bundle php-bcmath php-curl php-cgi php-date php-mbstring php-uuid phpunit -y


#snaps
sudo snap install code --classic
sudo snap install dbeaver-ce
sudo snap install spotify
sudo snap install postman
sudo snap install discord
sudo snap install android-studio --classic

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
ssh-keygen
ssh-copy-id bahamut



#node
sudo npm i -g npm 
sudo npm i -g n 
sudo n lts
sudo rm /usr/bin/nodejs
sudo ln -s /usr/local/bin/node /usr/bin/nodejs



mkdir ~/tools
cp  onedrive.sh ~/tools/


#docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo usermod -aG docker ${USER}

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


#vim
sudo apt install build-essential cmake vim-nox python3-dev -y
sudo apt install mono-complete golang nodejs default-jdk npm -y
cp vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
#git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
#cd ~/.vim/bundle/YouCompleteMe
#git submodule update --init --recursive
#python3 install.py --all

# instalando platformio e arduino
pip install platformio 
curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/master/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
sudo service udev restart

sudo usermod -aG dialup ${USER}
sudo usermod -aG plugdev ${USER}
