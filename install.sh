#!/bin/bash

# Installing System Dependencies
if [ "$(uname)" = "Darwin" ]; then
  cat ./dependencies/os-mac.txt | xargs brew install
elif grep '^ID=.*opensuse' /etc/os-release > /dev/null; then
  sudo zypper install $(cat ./dependencies/os-linux.txt)
elif grep '^ID=arch' /etc/os-release > /dev/null; then
  sudo pacman -S --needed $(cat ./dependencies/os-linux.txt)
elif grep '^ID=.*fedora' /etc/os-release > /dev/null; then
  # since Fedora 22, DNF is the default package manager
  if command -v dnf >/dev/null 2>&1; then
    sudo dnf install $(cat ./dependencies/os-fedora.txt)
  else
    sudo yum install $(cat ./dependencies/os-fedora.txt)
  fi
else
  echo 'Unsupported OS.'
  exit 1
fi

# Installing Fred's ImageMagick Scripts
mkdir ./lib
cat ./dependencies/lib.txt | xargs -I {} \
  wget -O ./lib/{} 'http://www.fmwconcepts.com/imagemagick/downloadcounter.php?scriptname={}&dirname={}'
chmod +x ./lib/*
