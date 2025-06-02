#!/usr/bin/env bash
# S Sync; y refresh packages; u upgrade
sudo pacman -Syu --noconfirm --needed gcc python-virtualenv python-pip git ansible less
mkdir -p ~/repos/github/reckseba
echo "Now I will clone the ansible repo. This will prompt for GitHub username and password. Use the github token as password."
git clone https://github.com/reckseba/ansible-desktop.git ~/repos/github/reckseba
cd ~/repos/github/reckseba/ansible-desktop
ansible-playbook playbook.yml

