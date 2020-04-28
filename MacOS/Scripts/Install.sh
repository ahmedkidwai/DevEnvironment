#!/usr/bin/env bash
function install {
  cmd=$1
  shift
  for pkg in "$@";
  do
    exec="$cmd $pkg"
    #prompt "Execute: $exec"
    if ${exec} ; then
      echo "Installed $pkg"
    else
      echo "Failed to execute: $exec"
      if [[ ! -z "${CI}" ]]; then
        exit 1
      fi
    fi
  done
}

echo Creating Workspace Folder
#Create Dev Folder
cd 
mkdir workspace
echo Workspace Folder Created

echo Installing Brew
# Install Brew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo Brew Installed

echo Installing Apps/Dev Requirments
# Open Source Installs
normalBrew=(
    zsh
    node
    git
    python
    python3
    cmake
    fzf
    php
    tmux
    wget
)
# Install Open Source Apps
install 'brew install' "${normalBrew[@]}"

#Closed Source
caskBrew=(
    java
    postman
    iterm2
    microsoft-edge
    flux
    dropbox
    vlc
    slack
    steam
    OneDrive
    transmission
    docker
    discord
    twitch
    spotify
    visual-studio-code
)

# Insall Cask Apps
install 'brew cask install' "${caskBrew[@]}"

echo Apps Installed

echo Installing Zsh
#Oh-My-Zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo Zsh Installed
