#!/bin/bash
read -p "Enter git username: " gitUser
echo "Hey $gitUser!"

read -p "Enter git email: " gitEmail
read -p "Enter git token: " gitToken
read -p "Enter hostname: " hostname

sudo hostnamectl hostname $hostname
sudo dnf update -y
sudo dnf install -y gcc python3-devel python3-pip git flatpak
pip install ansible
pip install --no-binary :all: psutil
git config --global user.name $gitUser
git config --global user.email $gitEmail
ansible-pull -v -U https://$gitToken:x-oauth-basic@github.com/reckseba/ansible-desktop local-rhel.yml
ansible-pull -v -U https://$gitToken:x-oauth-basic@github.com/reckseba/ansible-desktop flatpak.yml

