#!/bin/bash

# git configuration
./configure-git.sh

# package installation
./install_packages < packages.txt

# create user accounts
./create_local_users.pl

# customise - user settings
cat dotfiles/.bashrc >> /root/.bashrc
cat dotfiles/.vimrc >> /root/.vimrc

cat dotfiles/.bashrc >> /home/qsapp/.bashrc
cat dotfiles/.vimrc >> /home/qsapp/.vimrc

