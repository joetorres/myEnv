#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

#instalações básicas de dependencias
sudo apt-get install -y software-properties-common apt-utils vim git nodejs npm python3-pip wget curl firefox ranger taskwarrior ssh chromium-browser cmake default-jdk build-essential vim-nox python3-dev mono-complete gcc gdb gpp g++ golang htop tmux net-tools neofetch deluge apt-transport-https gnupg-agent ca-certificates gitk mpv snapd rclone arduino

#config git
git config --global user.email "jeronimo.torres@outlook.com"
git config --global user.name "Jerônimo Torres"
git config --global credential.helper store
git config --global core.editor "vim"
git config --global pull.rebase false 



#dotnet
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update && sudo apt-get install -y dotnet-sdk-6.0

#php 
sudo apt install php8.1 php8.1-zip php8.1-gmp php8.1-http php8.1-cli php8.1-bz2  php8.1-mysql php8.1-ssh2 php8.1-sqlite3 php8.1-soap php8.1-ldap php8.1-odbc php8.1-oauth \
php8.1-xml php8.1-mbstring php8.1-common php8.1-curl php8.1-cgi  php8.1-yaml php8.1-uuid  php8.1-pgsql php8.gd php8.1-uploadprogress php8.1-smbclient php8.1-ldap -y

sudo apt install php php-common php-mysql php-pgsql php-zip php-bz2 php-composer-ca-bundle php-bcmath php-curl php-cgi php-date php-mbstring php-uuid phpunit php8.1-ldap php8.1-odbc php8.1-mysql php8.1-oauth php8.1-pspell php8.1-sqlite3 php8.1-soap php8.1-xsl php8.1-zip php8.1-yaml php8.1-mailparse php8.1-cli php8.1-common php8.1-bz2 php8.1-bcmath php8.1-cgi php8.1-mongodb php8.1-odbc php8.1-mbstring php8.1-phpdbg php8.1-http php8.1-intl 
 php8.1-xsl php8.1-uploadprogress php8.1-gd php8.1-gmp php8.1-gmagick php8.1-redis php8.1-ssh2 php8.1-rrd  php8.1-smbclient php8.1-xmlrpc php8.1-y

#snaps
sudo snap install code --classic && sudo snap install dbeaver-ce && sudo snap install spotify && sudo snap install postman && sudo snap install discord && sudo snap install android-studio --classic

#joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

#video stuff
sudo pip3 install subliminal
sudo pip3 install virtualenv
echo -e '\n' >> ~/.bashrc
echo 'alias sub="subliminal download -l pt-br ."' >> ~/.bashrc



#node
#install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
nvm use --lts


mkdir ~/tools
cp  onedrive.sh ~/tools/


#docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#vim
mkdir ~/.temp
cp dotconfig/vimrc ~/.vimrc
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

sudo usermod -aG dialup ${USER}
sudo usermod -aG plugdev ${USER}
