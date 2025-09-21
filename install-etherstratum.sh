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
clear
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
clear
sudo apt install brave-browser
clear
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt install codium
sudo apt install apt-transport-https -y
sudo apt install software-properties-common
clear

udo apt install -y fastfetch || echo "Fastfetch install failed, check Debian source"

clear
curl -fsSL https://ollama.com/install.sh | sh
ollama pull tinyllama
clear
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt install spotify-client
clear
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
sudo apt install proton-vpn-gnome-desktop
clear

sudo apt install -y openvpn neofetch samba 
sudo apt install -y kde-plasma-desktop openvpn vim emacs nano 
sudo apt install -y flatpak snap kitty git 
sudo apt install -y build-essential python3 python3-pip npm 
sudo apt install -y gcc clang cargo rustup 
sudo apt install -y golang nodejs cowsay cmatrix 
sudo apt install -y cava openssl curl wget 
sudo apt install -y cmake default-jre default-jdk lua5.4 
sudo apt install -y zsh rpi-imager kiwix ruby nmap gimp gpa gnupg
sudo apt install -y yubikey-manager cryptsetup nftables tor torsocks
sudo apt install -y docker podman qemu aircrack-ng metasploit masscan
clear
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo pip install colorama requests rich typer pipenv virtualenv psutil 
sudo pip install paramiko fabric schedule docker cryptography pyopenssl 
sudo pip install bcrypt scapy pwntools black flake8 pytest ipython 
sudo pip instakll juypter fastapi httpie tqdm
clear



echo "Customizing.."
mkdir -p ~/.config/fastfetch
cp etherstratum-logo.txt ~/.config/fastfetch/logo.txt
clear


# Set the root of the installed system
TARGET=${1:-/}  # default is / if no argument passed

echo "Setting up EtherStratum identity files..."

# -----------------------------
# /etc/os-release
# -----------------------------
sudo tee "$TARGET/etc/os-release" > /dev/null <<'EOF'
NAME="EtherStratum"
PRETTY_NAME="EtherStratum 1.0.0 (Debian-based)"
VERSION="1.0.0"
VERSION_ID="1.0.0"
VERSION_CODENAME="garra"
ID=etherstratum
ID_LIKE=debian
HOME_URL="https://github.com/MOHAPY24/EtherStratum"
SUPPORT_URL="https://github.com/MOHAPY24/EtherStratum/issues"
BUG_REPORT_URL="https://github.com/MOHAPY24/EtherStratum/issues"

ANSI_COLOR="0;36"
EOF

# -----------------------------
# /usr/lib/os-release (optional redundancy)
# -----------------------------
sudo tee "$TARGET/usr/lib/os-release" > /dev/null <<'EOF'
NAME="EtherStratum"
PRETTY_NAME="EtherStratum 1.0.0 (Debian-based)"
VERSION="1.0.0"
VERSION_ID="1.0.0"
VERSION_CODENAME="garra"
ID=etherstratum
ID_LIKE=debian
EOF

# -----------------------------
# /etc/lsb-release
# -----------------------------
sudo tee "$TARGET/etc/lsb-release" > /dev/null <<'EOF'
DISTRIB_ID=EtherStratum
DISTRIB_RELEASE=1.0.0
DISTRIB_CODENAME=garra
DISTRIB_DESCRIPTION="EtherStratum 1.0.0 (Debian-based)"
EOF

# -----------------------------
# /etc/issue and /etc/issue.net
# -----------------------------
sudo tee "$TARGET/etc/issue" > /dev/null <<'EOF'
EtherStratum GNU/Linux 1.0.0 (garra)
Welcome to EtherStratum — run 'etherstratum' for quick info.
EOF

sudo tee "$TARGET/etc/issue.net" > /dev/null <<'EOF'
EtherStratum GNU/Linux 1.0.0 (garra) - Authorized users only.
EOF

# -----------------------------
# /etc/motd
# -----------------------------
sudo tee "$TARGET/etc/motd" > /dev/null <<'EOF'
Welcome to EtherStratum Garra (1.0.0)
Run: etherstratum --help
EOF

# -----------------------------
# Fastfetch setup
# -----------------------------
sudo mkdir -p "$TARGET/etc/skel/.config/fastfetch"
sudo cp etherstratum-logo.txt "$TARGET/etc/skel/.config/fastfetch/logo.txt"

# Append fastfetch to new user bashrc
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
sudo mkdir -p /vat /temp /var
sudo chmod 777 /vat /temp
clear
echo "Finalizing.."
sudo apt update && sudo apt upgrade -y
clear



clear
echo "adding common aliases..."
cat << 'ALIASES' >> ~/.bashrc
clear
fastfetch --logo ~/.config/fastfetch/logo.txt
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
alias etherstratum="echo EtherStratum v1.0.0"
alias firf="firefox"
alias brvb="brave-browser"
alias clearvat="sudo rm -rf /vat/*"
ALIASES




echo "Setup complete! please reboot for full affect"

