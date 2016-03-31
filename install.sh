#!/bin/bash

# Installing System Dependencies
if [ "$(uname)" = "Darwin" ]; then
  cat ./dependencies/os-brew.txt | xargs brew install
elif grep '^ID=.*opensuse' /etc/os-release > /dev/null; then
  # the package names happen to work
  sudo zypper install $(cat ./dependencies/os-brew.txt)
elif grep '^ID=.*fedora' /etc/os-release > /dev/null; then
  sudo dnf install $(cat ./dependencies/os-fedora.txt)
else
  echo 'Unsupported OS.'
  exit 1
fi

# Installing Fred's ImageMagick Scripts
mkdir ./lib
cat ./dependencies/lib.txt | xargs -I {} \
  wget -O ./lib/{} 'http://www.fmwconcepts.com/imagemagick/downloadcounter.php?scriptname={}&dirname={}'
chmod +x ./lib/*
