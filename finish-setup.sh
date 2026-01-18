#!/usr/bin/env bash

#installAptPackages() {
#  echo "Installing APT packages..."
#  sudo apt update
#  sudo apt install \
#    curl \
#    vim \
#    git \
#    podman
#}
#
#installSnapPackages() {
#  echo "Installing Snap packages..."
#  sudo snap install \
#    htop \
#    bitwarden \
#    slack \
#    spotify
#
#  sudo snap install --classic code
#}

installGoogleChrome() {
  echo "Installing Google Chrome"
  wget -O ~/Downloads/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
}

installJetbrainsToolbox() {
  echo "Installing JetBrains Toolbox 3.2.0.65851..."
  wget -O ~/Downloads/jetbrains-toolbox.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-3.2.0.65851.tar.gz
  mkdir -p ~/.local/share/JetBrains/Toolbox
  tar -xvf ~/Downloads/jetbrains-toolbox.tar.gz -C ~/.local/share/JetBrains/Toolbox --strip-components=1
  sudo ln -s ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox
  echo "Launching JetBrains Toolbox..."
  setsid jetbrains-toolbox >/dev/null 2>&1 &
}

installSDKMan() {
  echo "Installing SDKMan..."
  curl -s "https://get.sdkman.io" | bash
}

installNVM() {
  echo "Installing Node Version Manager v0.40.3..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
}

configureFlatpack() {
  echo "Configuring Flathub as source for Flatpak..."
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

configureLocale() {
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
}

configurePinnedApps() {
  echo "Setting desktop favorites..."
  gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop', 'code_code.desktop', 'bitwarden_bitwarden.desktop', 'slack_slack.desktop']"
}

validateAndReboot() {
  echo "Validate the installation now!"
  echo "Once you are ready, press any key to initiate a reboot so that the locale change takes effect. (Logging out and back in again is not enough)"
  read -s -r

  sudo systemctl reboot
}

updateUserPassword() {
  echo "Updating temporary password to final one!"
  passwd
}

updateUserPassword
#installAptPackages
#installSnapPackages
installSDKMan
installNVM
installGoogleChrome
installJetbrainsToolbox
configureFlatpack
configureLocale
configurePinnedApps
validateAndReboot
