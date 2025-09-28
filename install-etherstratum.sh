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
sudo apt install fastfetch

#curl -fsSL https://ollama.com/install.sh | sh
#ollama pull tinyllama

wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
sudo apt install -y proton-vpn-gnome-desktop


sudo apt install -y openvpn 
sudo apt install -y neofetch 
sudo apt install -y samba 
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
sudo apt install -y gpa 
sudo apt install -y gnupg
sudo apt install -y yubikey-manager 
sudo apt install -y cryptsetup 
sudo apt install -y nftables
sudo apt install -y docker 
sudo apt install -y podman 
sudo apt install -y qemu 
sudo apt install -y aircrack-ng 
sudo apt install -y metasploit 
sudo apt install -y masscan
clear
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
mkdir -p ~/venvs/venv
sudo python3 -m venv ~/venvs/venv
source ~/venvs/venv/bin/activate
sudo pip install colorama requests rich typer pipenv virtualenv psutil 
sudo pip install paramiko fabric schedule docker cryptography pyopenssl 
sudo pip install bcrypt scapy pwntools black flake8 pytest ipython 
sudo pip install juypter fastapi httpie tqdm orjson
clear






echo "Customizing.."
mkdir -p ~/.config/fastfetch
cp etherstratum-logo.txt ~/.config/fastfetch/logo.txt




TARGET=${1:-/}  

echo "Setting up EtherStratum identity files..."

sudo tee "$TARGET/etc/os-release" > /dev/null <<'EOF'
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


sudo tee "$TARGET/usr/lib/os-release" > /dev/null <<'EOF'
NAME="EtherStratum"
PRETTY_NAME="EtherStratum 1.2.0 (Debian-based)"
VERSION="1.2.0"
VERSION_ID="1.2.0"
VERSION_CODENAME="Danio"
ID=etherstratum
ID_LIKE=debian
EOF

sudo tee "$TARGET/etc/lsb-release" > /dev/null <<'EOF'
DISTRIB_ID=EtherStratum
DISTRIB_RELEASE=1.2.0
DISTRIB_CODENAME=Danio
DISTRIB_DESCRIPTION="EtherStratum 1.2.0 (Debian-based)"
EOF

sudo tee "$TARGET/etc/issue" > /dev/null <<'EOF'
EtherStratum GNU/Linux 1.2.0 (Kirbensis)
Welcome to EtherStratum — run 'etherstratum' for quick info.
EOF

sudo tee "$TARGET/etc/issue.net" > /dev/null <<'EOF'
EtherStratum GNU/Linux 1.2.0 (Danio) - Authorized users only.
EOF

sudo tee "$TARGET/etc/motd" > /dev/null <<'EOF'
Welcome to EtherStratum Kirbensis (1.2.0)
Run: etherstratum 
EOF


sudo mkdir -p "$TARGET/etc/skel/.config/fastfetch"
sudo cp etherstratum-logo.txt "$TARGET/etc/skel/.config/fastfetch/logo.txt"


sudo tee -a "$TARGET/etc/skel/.bashrc" > /dev/null <<'EOF'
# Display EtherStratum Fastfetch on login
if command -v fastfetch >/dev/null 2>&1; then
  clear
  fastfetch --logo ~/.config/fastfetch/logo.txt
fi
EOF

echo "EtherStratum identity setup complete!"
echo "Verify with: cat $TARGET/etc/os-release, lsb_release -a, and login to see Fastfetch."




echo "creating sandbox and temp directories.."
sudo mkdir -p /vat /tmp /var
sudo chmod 777 /vat 

echo "Setting up TestVat System..."


mkdir -p /vat/{base,overlay,work,merged}


mount -t overlay overlay \
  -o lowerdir=/vat/base,upperdir=/vat/overlay,workdir=/vat/work \
  /vat/merged


if [ ! -L /vat ]; then
    mv /vat /vat_old
    ln -s /vat/merged /vat
fi


grep -q "/vat/merged" /etc/fstab || echo "overlay /vat/merged overlay lowerdir=/vat/base,upperdir=/vat/overlay,workdir=/vat/work 0 0" >> /etc/fstab

echo "TestVat System containerized at /vat"



clear
echo "adding common aliases..."
cat << 'ALIASES' >> ~/.bashrc
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
alias etherstratum="echo EtherStratum v1.1.0"
alias firf="firefox"
alias brvb="brave-browser"
alias fastfetch="fastfetch --logo ~/.config/fastfetch/logo.txt"
alias clearvat="sudo rm -rf /vat/*"
alias cleartmp="sudo rm -rm /tmp/*"

source ~/venvs/venv/bin/activate
ALIASES

echo "Finalizing.."
sudo apt update && sudo apt upgrade -y
sudo apt autoremove
clear



echo "Setup complete! please reboot for full affect"

