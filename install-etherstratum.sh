#!/bin/bash


cat << "EOF"

┏━━━┓━┏┓━┏┓━━━━━━━━━┏━━━┓━┏┓━━━━━━━━━━┏┓━━━━━━━━━
┃┏━━┛┏┛┗┓┃┃━━━━━━━━━┃┏━┓┃┏┛┗┓━━━━━━━━┏┛┗┓━━━━━━━━
┃┗━━┓┗┓┏┛┃┗━┓┏━━┓┏━┓┃┗━━┓┗┓┏┛┏━┓┏━━┓━┗┓┏┛┏┓┏┓┏┓┏┓
┃┏━━┛━┃┃━┃┏┓┃┃┏┓┃┃┏┛┗━━┓┃━┃┃━┃┏┛┗━┓┃━━┃┃━┃┃┃┃┃┗┛┃
┃┗━━┓━┃┗┓┃┃┃┃┃┃━┫┃┃━┃┗━┛┃━┃┗┓┃┃━┃┗┛┗┓━┃┗┓┃┗┛┃┃┃┃┃
┗━━━┛━┗━┛┗┛┗┛┗━━┛┗┛━┗━━━┛━┗━┛┗┛━┗━━━┛━┗━┛┗━━┛┗┻┻┛
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

echo "Welcome to the EtherStratum debian template installer."
sudo echo "ready, Sudo allowed."
sleep 3
clear

echo "updating package lists..."
sudo apt update -y
clear
echo "upgrading package lists..."
sudo apt upgrade -y
clear
echo "installing base packages..."

sudo apt install apt-transport-https curl
clear
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
clear
sudo apt update && sudo apt install brave-browser
clear
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium
sudo apt install apt-transport-https -y
sudo apt update
sudo apt install software-properties-common
clear

udo apt install -y fastfetch || echo "Fastfetch install failed, check Debian source"

clear
curl -fsSL https://ollama.com/install.sh | sh
ollama pull tinyllama
clear
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client
clear
sudo add-apt-repository ppa:pypy/ppa


sudo apt install -y kde-plasma-desktop pypy protonvpn openvpn hide.me nvim vim emacs nano flatpak snap kitty git build-essential python3 python3-pip npm ollama gcc clang pyenv venv cargo rustup golang nodejs cowsay cmatrix cava openssl curl wget cmake default-jre default-jdk lua5.4 zsh rpi-imager kiwix
clear
sudo pip install colorama requests rich typer pipenv virtualenv psutil paramiko fabric schedule docker cryptography pyopenssl bcrypt scapy pwntools black flake8 pytest ipython juypter fastapi httpie tqdm
clear



echo "Customizing.."
mkdir -p ~/.config/fastfetch
cp etherstartum-logo.txt ~/.config/fastfetch/logo.txt
clear
fastfetch --gen-config
echo "fastfetch --logo ~/.config/fastfetch/logo.txt" >> /home/$USER/.bashrc
echo "cowsay EtherStratum!" >> /home/$USER/.bashrc

clear
echo "adding common aliases..."
cat << 'ALIASES' >> ~/.bashrc
alias python="python3"
alias ffs="fastfetch"
alias nef="neofetch"
alias vsc="codium"
alias lsa="ls -a"
alias py="python3"
alias lsl="ls -l"
alias pip3="python3 -m pip"
alias rmrf="rm -rf"
alias cls="clear"
alias repeat="yes"
alias print="echo"
alias etherstratum="echo EtherStratum v1.0.0, Debian 13 'Trixie'"
alias firf="firefox"
alias brvb="brave-browser"
ALIASES


echo "creating sandbox and temp directories.."
sudo mkdir -p /vat /temp /var
sudo chmod 777 /vat /temp
clear
echo "Finalizing.."
sudo apt update && sudo apt upgrade -y
clear

echo "Setup complete! please reboot for full affect"

