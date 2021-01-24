#!/usr/bin/env bash

cd "$(dirname ${BASH_SOURCE})";

git pull origin main

function doIt() {
    rsync --exclude ".git/" \
          --exclude "setup.sh" \
          --exclude "package_setup.sh" \
          --exclude "README.md" \
          --exclude ".emacs.d/" \
          -avh --no-perms . ~;
    # ln -s .emacs.d $HOME/.emacs.d
    source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo ;
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
