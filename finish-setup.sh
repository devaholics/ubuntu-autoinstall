#!/usr/bin/env bash

echo "Updating the locale..."
sudo locale-gen de_AT.UTF-8
sudo localectl set-locale LANG=en_US.UTF-8 \
  LC_NUMERIC=de_AT.UTF-8 \
  LC_TIME=de_AT.UTF-8 \
  LC_MONETARY=de_AT.UTF-8 \
  LC_PAPER=de_AT.UTF-8 \
  LC_NAME=de_AT.UTF-8 \
  LC_ADDRESS=de_AT.UTF-8 \
  LC_TELEPHONE=de_AT.UTF-8 \
  LC_MEASUREMENT=de_AT.UTF-8 \
  LC_IDENTIFICATION=de_AT.UTF-8
gsettings set org.gnome.system.locale region 'de_AT.UTF-8'

echo "Installing Node Version Manager v0.40.3..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo "Installing SDKMan..."
curl -s "https://get.sdkman.io" | bash

echo "Installing Google Chrome"
wget -O ~/Downloads/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb

echo "Installing JetBrains Toolbox 3.2.0.65851..."
wget -O ~/Downloads/jetbrains-toolbox.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-3.2.0.65851.tar.gz
mkdir -p ~/.local/share/JetBrains/Toolbox
tar -xvf ~/Downloads/jetbrains-toolbox.tar.gz -C ~/.local/share/JetBrains/Toolbox --strip-components=1
ln -s ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox
echo "Launching JetBrains Toolbox..."
setsid jetbrains-toolbox >/dev/null 2>&1 &

echo "Setting desktop favorites..."
gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop', 'jetbrains-idea.desktop', 'jetbrains-webstorm.desktop', 'jetbrains-datagrip.desktop', 'code_code.desktop', 'bitwarden_bitwarden.desktop', 'slack_slack.desktop']"

echo "Validate the installation now!"
ehco "Once you are ready, press any key to initiate a reboot so that the locale change takes effect. (Logging out and back in again is not enough)"
read -s -r

sudo systemctl reboot
