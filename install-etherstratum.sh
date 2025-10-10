#!/bin/bash

cat <<"EOF"

┏━━━┓━┏┓━┏┓━━━━━━━━━┏━━━┓━┏┓━━━━━━━━━━┏┓━━━━━━━━━
┃┏━━┛┏┛┗┓┃┃━━━━━━━━━┃┏━┓┃┏┛┗┓━━━━━━━━┏┛┗┓━━━━━━━━
┃┗━━┓┗┓┏┛┃┗━┓┏━━┓┏━┓┃┗━━┓┗┓┏┛┏━┓┏━━┓━┗┓┏┛┏┓┏┓┏┓┏┓
┃┏━━┛━┃┃━┃┏┓┃┃┏┓┃┃┏┛┗━━┓┃━┃┃━┃┏┛┗━┓┃━━┃┃━┃┃┃┃┃┗┛┃
┃┗━━┓━┃┗┓┃┃┃┃┃┃━┫┃┃━┃┗━┛┃━┃┗┓┃┃━┃┗┛┗┓━┃┗┓┃┗┛┃┃┃┃┃
┗━━━┛━┗━┛┗┛┗┛┗━━┛┗┛━┗━━━┛━┗━┛┗┛━┗━━━┛━┗━┛┗━━┛┗┻┻┛
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

if [ -f /etc/debian_version ]; then
  echo "[*] Debian base detected. Continuing installation..."
else
  echo "[x] No Debian base located. Are you using a non-Debian based distro?"
  exit 1
fi

echo "Welcome to the EtherStratum distro installer."
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

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt install brave-browser

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt install codium
sudo apt install apt-transport-https -y
sudo apt install software-properties-common

udo apt install -y fastfetch || echo "Fastfetch install failed, check Debian source"
sudo apt install fastfetch -y

#curl -fsSL https://ollama.com/install.sh | sh
#ollama pull tinyllama

wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
sudo apt install -y proton-vpn-gnome-desktop

sudo apt install -y openvpn
sudo apt install -y neofetch
sudo apt install -y sway swaybg rofi waybar 
sudo apt install -y samba
sudo apt install -y python3.14-venv
sudo apt install -y xfce4
sudo apt install -y vim
sudo apt install -y emacs
sudo apt install -y nano
sudo apt install -y flatpak
sudo apt install -y kitty
sudo apt install -y git
sudo apt install -y nala
sudo apt install -y nix
sudo apt install -y build-essential
sudo apt install -y python3
sudo apt install -y python3-pip
sudo apt install -y npm
sudo apt install -y gcc
sudo apt install -y clang
sudo apt install -y lightdm 
sudo apt install -y lightdm-gtk-greeter 
sudo apt install -y cargo
sudo apt install -y rustup
sudo apt install -y golang
sudo apt install -y nodejs
sudo apt install -y cowsay
sudo apt install -y cmatrix
sudo apt install -y cava
sudo apt install -y openssl
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y wine
sudo apt install -y cmake
sudo apt install -y default-jre
sudo apt install -y default-jdk
sudo apt install -y lua5.4
sudo apt install -y zsh
sudo apt install -y ruby
sudo apt install -y nmap
sudo apt install -y sddm
sudo apt install -y lightdm
sudo apt install -y xorg
sudo apt install -y gpa
sudo apt install -y gnupg
sudo apt install -y yubikey-manager
sudo apt install -y cryptsetup
sudo apt install -y nftables
sudo apt install -y docker
sudo apt install -y podman
sudo apt install -y qemu
sudo apt install -y tty-clock
sudo apt install -y aircrack-ng
sudo apt install -y metasploit
sudo apt install -y masscan
clear
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
mkdir -p ~/venvs/venv
python3 -m venv ~/venvs/venv
source ~/venvs/venv/bin/activate
pip install colorama requests rich typer pipenv virtualenv psutil
pip install paramiko fabric schedule docker cryptography pyopenssl
pip install bcrypt scapy pwntools black flake8 pytest ipython
pip install fastapi httpie tqdm orjson
clear

echo "Customizing.."
mkdir -p ~/.config/fastfetch
cp etherstratum-logo.txt ~/.config/fastfetch/logo.txt


echo "Setting up EtherStratum identity files..."

sudo tee "/etc/os-release" >/dev/null <<'EOF'
NAME="EtherStratum"
PRETTY_NAME="EtherStratum 1.2.0 (Debian-based)"
VERSION="1.2.0"
VERSION_ID="1.2.0"
VERSION_CODENAME="Danio"
ID=etherstratum
ID_LIKE=debian
HOME_URL="https://github.com/MOHAPY24/EtherStratum"
SUPPORT_URL="https://github.com/MOHAPY24/EtherStratum/issues"
BUG_REPORT_URL="https://github.com/MOHAPY24/EtherStratum/issues"

ANSI_COLOR="0;36"
EOF

sudo tee "/usr/lib/os-release" >/dev/null <<'EOF'
NAME="EtherStratum"
PRETTY_NAME="EtherStratum 1.2.0 (Debian-based)"
VERSION="1.2.0"
VERSION_ID="1.2.0"
VERSION_CODENAME="Danio"
ID=etherstratum
ID_LIKE=debian
EOF

sudo tee "/etc/lsb-release" >/dev/null <<'EOF'
DISTRIB_ID=EtherStratum
DISTRIB_RELEASE=1.2.0
DISTRIB_CODENAME=Danio
DISTRIB_DESCRIPTION="EtherStratum 1.2.0 (Debian-based)"
EOF

sudo mkdir -p "/etc/skel/.config/fastfetch"
sudo cp etherstratum-logo.txt "/etc/skel/.config/fastfetch/logo.txt"

echo "EtherStratum identity setup complete!"
echo "Verify with: cat /etc/os-release, lsb_release -a, and login to see Fastfetch."

echo "creating sandbox and temp directories.."
mkdir -p /vat /tmp /var
sudo chmod 777 /vat

clear
echo "adding common aliases..."
cat <<'ALIASES' >>~/.bashrc
clear
fastfetch --logo ~/.config/fastfetch/logo.txt
alias python="python3"
alias ffs="fastfetch"
alias vsc="codium"
alias lsa="ls -a"
alias py="python3"
alias lsl="ls -l"
alias pip3="python3 -m pip"
alias rmrf="rm -rf"
alias cls="clear"
alias repeat="yes"
alias print="echo"
alias etherstratum="echo EtherStratum v1.2.0"
alias firf="firefox"
alias brvb="brave-browser"
alias fastfetch="fastfetch --logo ~/.config/fastfetch/logo.txt"
alias clearvat="sudo rm -rf /vat/*"
alias cleartmp="sudo rm -rf /tmp/*"

ALIASES

echo "Finalizing.."
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
clear

echo "Setup complete! please reboot for full affect"
