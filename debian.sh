#!/bin/bash
read -p "Enter git username: " gitUser
echo "Hey $gitUser!"

read -p "Enter git email: " gitEmail
read -p "Enter git token: " gitToken
read -p "Enter hostname: " hostname

sudo hostnamectl hostname $hostname
sudo apt update
sudo apt upgrade
sudo apt install -y gcc python3-dev python3-venv python3-pip python3-psutil git ansible flatpak

# following does not work with ubuntu 24 anymore
# pip install --no-binary :all: psutil
git config --global user.name $gitUser
git config --global user.email $gitEmail
ansible-pull -v -U https://$gitToken:x-oauth-basic@github.com/reckseba/ansible-desktop local-deb.yml
ansible-pull -v -U https://$gitToken:x-oauth-basic@github.com/reckseba/ansible-desktop flatpak.yml

