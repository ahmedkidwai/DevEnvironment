#!/usr/bin/env bash
echo "What is your name (first and last name)?"
read username

echo "What is your email?"
read email

# Throw in setting up git because why not.
git config --global user.name "$username"
git config --global user.email $email

echo "your git user name has been set to":
git config user.name
echo "your git email has been set to":
git config user.email

ssh-keygen -t rsa -b 4096 -C "$email"
eval "$(ssh-agent -s)"

echo "Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa" >> ~/.ssh/config

ssh-add -K ~/.ssh/id_rsa

# Copy SSH Key to clipboard
pbcopy < ~/.ssh/id_rsa.pub
echo "Done - SSH key is in your clipboard"