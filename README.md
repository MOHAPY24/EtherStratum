
# EtherStratum

> **EtherStratum** – The ultimate Debian-based dev & OPSEC installer. Fully automated setup for developers, sysadmins, and security enthusiasts.

---

## ⚡ Overview

EtherStratum is a **one-command installer** that transforms a fresh Debian system into a **full-featured development environment** with OPSEC tools, productivity enhancements, sandbox directories, and terminal customizations.

It’s ideal for:

* Developers who want all common languages & tools pre-installed
* Sysadmins who need fast setup on new machines
* Security-conscious users who want OPSEC-ready software

---

## 🚀 Features

* Automated installation of **core dev languages & tools**
* Sandbox directories for testing: `/vat` and `/temp`
* Custom aliases for productivity
* Terminal enhancements like Fastfetch, Kitty, and other CLI utilities
* Optional GUI desktop: KDE Plasma

---

## 🛠️ Installation

```bash
git clone https://github.com/YourUsername/EtherStratum.git
cd EtherStratum
chmod +x etherstratum-installer.sh
./etherstratum-installer.sh
```

> Must run with a user that has **sudo privileges**.

---

## 🖥️ Installed Packages & Tools

### **Core Development Tools**

* **Python 3 & pip3** – general development & scripting
* **Node.js & npm** – JavaScript & TypeScript development
* **Go & Rust** – systems & backend development
* **C/C++ (GCC, Clang, Build-essential)** – compiled languages
* **Java (OpenJDK)** – JVM applications
* **Lua 5.4** – scripting
* **VsCodium** – lightweight open-source code editor
* **Neovim, Vim, Emacs, Nano** – CLI editors

---

### **Python Packages (installed via pip3)**

* **colorama** – colored terminal output
* **requests** – HTTP requests library
* **rich** – beautiful terminal output & formatting
* **typer** – CLI app framework
* **pipenv, virtualenv** – Python environment management
* **psutil** – system & process monitoring
* **paramiko** – SSH automation
* **fabric** – remote server automation
* **schedule** – task scheduling
* **cryptography, pyopenssl, bcrypt** – security libraries
* **scapy** – network packet crafting
* **pwntools** – CTF exploitation tools
* **black, flake8** – Python code formatting & linting
* **pytest** – testing framework
* **ipython, jupyter** – interactive computing & notebooks
* **fastapi** – modern API framework
* **httpie** – command-line HTTP client
* **tqdm** – progress bars for scripts

---

### **Terminal Utilities**

* **cowsay** – fun terminal messages
* **cmatrix** – Matrix-style terminal effect
* **cava** – terminal-based audio visualizer
* **kitty terminal** – GPU-accelerated terminal emulator
* **fastfetch** – system info display tool

---

### **OPSEC & Productivity Tools**

* **Brave Browser** – privacy-focused browser
* **Spotify** – media streaming
* **VPN clients** – ProtonVPN, OpenVPN, hide.me
* **OpenSSL & GPG** – cryptography & secure communication
* **Ollama & TinyLlama** – optional local AI models

---

### **Other Utilities**

* **flatpak & snap** – universal package managers
* **wget, curl** – download & network tools
* **docker** – containerization
* **cmake** – build system
* **rpi-imager** – optional Raspberry Pi imaging tool

---

## 🔧 Sandbox Directories

* `/vat` –  environment for testing scripts; can be cleared anytime
* `/temp` – temporary files storage
* `/var` – standard system variable data

Permissions are set to allow easy access while keeping other directories safe.

---

## ⚡ Aliases Included

```bash
alias python="python3"
alias py="python3"
alias pip3="python3 -m pip"
alias ffs="fastfetch"
alias nef="neofetch"
alias vsc="codium"
alias lsa="ls -a"
alias lsl="ls -l"
alias rmrf="rm -rf"
alias cls="clear"
alias repeat="yes"
alias print="echo"
alias etherstratum="echo EtherStratum v1.0.0, Debian 'Bookworm'"
alias firf="firefox"
alias brvb="brave-browser"
```

These aliases streamline development and terminal navigation.

---

## 🌟 Why EtherStratum?

* One script sets up a **complete dev + OPSEC environment**
* Works across **any Debian-based distro**
* Sandbox directories keep your system clean and experiments isolated
* Pre-installed tools save **hours of setup time**
* Perfect for developers who **distro hop** without losing workflow consistency

---

## 📌 Notes

* Tested on **Debian 13 Trixie**, should work on other Debian derivatives
* Ensure your user has **sudo privileges**
* `/vat` can be used for **ephemeral testing or sandbox scripts**

---

## ⚡ License

MIT License – free to use, fork, and modify.
