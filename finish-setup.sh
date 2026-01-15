#!/usr/bin/env bash

echo "Updating the locale..."
locale-gen de_AT.UTF-8
update-locale
gsettings set org.gnome.system.locale region 'de_AT.UTF-8'
#localectl set-locale LANG=en_US.UTF-8 \
#  LC_NUMERIC=de_AT.UTF-8 \
#  LC_TIME=de_AT.UTF-8 \
#  LC_MONETARY=de_AT.UTF-8 \
#  LC_PAPER=de_AT.UTF-8 \
#  LC_NAME=de_AT.UTF-8 \
#  LC_ADDRESS=de_AT.UTF-8 \
#  LC_TELEPHONE=de_AT.UTF-8 \
#  LC_MEASUREMENT=de_AT.UTF-8 \
#  LC_IDENTIFICATION=de_AT.UTF-8

echo "Setting desktop favorites..."
gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop', 'bitwarden_bitwarden.desktop', 'slack_slack.desktop']"

echo "Installing Node Version Manager v0.40.3..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo "Validate the installation and then press any key to close this window."
read -s -r
