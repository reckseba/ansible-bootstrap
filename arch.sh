#!/usr/bin/env bash
# S Sync; y refresh packages; u upgrade
sudo pacman -Syu --noconfirm --needed gcc python-virtualenv python-pip git ansible less
mkdir -p ~/repos/github/reckseba
git clone git@github.com:reckseba/ansible-desktop.git ~/repos/github/reckseba/ansible-desktop
cd ~/repos/github/reckseba/ansible-desktop
ansible-playbook playbook.yml

