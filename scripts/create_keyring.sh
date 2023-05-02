#!/bin/env bash


mkdir -p /home/lcavalcante/.local/share/keyrings/
echo -n "Default_keyring" > /home/lcavalcante/.local/share/keyrings/default
cat > /home/lcavalcante/.local/share/keyrings/Default_keyring.keyring << EOF 
[keyring]
display-name=Default keyring
ctime=0
mtime=0
lock-on-idle=false
lock-after=false
EOF
chmod og= /home/lcavalcante/.local/share/keyrings/
chmod og= /home/lcavalcante/.local/share/keyrings/Default_keyring.keyring
chown -R lcavalcante:lcavalcante /home/lcavalcante/.local
