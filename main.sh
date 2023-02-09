#!/bin/bash

figlet "TPLINK722N"
echo "By:FrankoSav"

function menu() {
    echo "Menu:"
    echo "1) Install Requeriments"
    echo "2) Install TPLINK722NV3"
    echo "3) Exit"
    read -p "Select A Option: " option   
    case $option in
        1) requirements;;
        2) install;;
        3) exit;;
        *) echo "[+]Invalid Option";;
    esac
}

function requirements() {
    echo "[+]Installing Requirements"
    sleep 1
    sudo apt-get update -y
    sudo apt-get install -y net-tools libuv1-dev build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev aircrack-ng
    echo "[+}Done"
}

function install() {
    echo "[+]Installing TPLINK722NV3"
    sleep 1
    sudo apt-get update -y
    sudo apt-get install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev bc dkms
    git clone https://github.com/aircrack-ng/rtl8188eus
    cd rtl8188eus/
    make
    sudo make install
    echo "blacklist r8188eu" | sudo tee -a /etc/modprobe.d/realtek.conf
    sudo apt-get upgrade -y
    echo "[+]Instaled, restart please"
}

while true; do
    menu
    read -p "[+]Press Enter To Continue"
done
