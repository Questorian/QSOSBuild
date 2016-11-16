#!/bin/bash

# git configuration
./configure-git.sh

# package installation
./install_packages < packages.txt

# create user accounts
./create_local_users.pl


