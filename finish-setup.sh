#!/usr/bin/env bash

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

installBrotherPrinterScannerDriver() {
  echo "Installing Brother MFC-L3760CDW printer/scanner driver..."
  wget -O ~/Downloads/mfcl3760cdwpdrv-3.5.1-1.i386.deb https://download.brother.com/welcome/dlf105762/mfcl3760cdwpdrv-3.5.1-1.i386.deb
  dpg --install ~/Downloads/mfcl3760cdwpdrv-3.5.1-1.i386.deb

  wget -O ~/Downloads/brscan5-1.5.1-0.amd64.deb https://download.brother.com/welcome/dlf104033/brscan5-1.5.1-0.amd64.deb
  dpg --install ~/Downloads/brscan5-1.5.1-0.amd64.deb
}

configureSshCredentials() {
  echo "Configuring SSH Credentials..."
  cat << EOF > ~/.ssh/config
Host github.com
  Preferredauthentications publickey
  IdentityFile ~/.ssh/id_devaholics_github_rsa

Host appliqon-dev
  Preferredauthentications publickey
  IdentityFile ~/.ssh/id_devaholics_appliqon_digitalocean_rsa
  HostName 164.92.193.56
  User root

Host appliqon-prod
  Preferredauthentications publickey
  IdentityFile ~/.ssh/id_devaholics_appliqon_digitalocean_rsa
  HostName 167.99.250.88
  User root

EOF

  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyIFxTCat4/PwhTsQQX7bQDFPBOeVXPVuyJCQkelQMmuLuIKOqgTsmS5SYAgv1vakFDblJLDjITngYS5ZjDcmwa34XdR8V/YpdN2rNc496xwd1NtTDu5dtqvoSUu4jBJ4lha0CNRtOdYNvKcoNRH50vlTETyBfmrqq/PmfAK/ZVDuwks1oqYr8bVpXm8DQNMCgzT8O5rHLGC9p696l8rAn28ea/U612iVGJHq89RCSY46yh3FwPmAkvrYxWgPcBy1G30in+VFN6tBabEJKeXPV05JaT+prUDsfGviAHjLMyiyLzAXicc4/sEEhE7SutV6IT1+AqYO89jjx8bX7U7YiU/eSTL19Jk0zJveWZU0LSB9HP7uuziYIbm9bLdP1PF7fH2X4CnslLggqo08tPfhiAh71SML9+lCnQAt05YtNbU31ILIqOAylD86mm0iy+pixFTD9IcMrPU3JcLUF8SPY96w9++RCgWPI07nkQiT7EuCO3zkimPjW8v0tB59iIVs= philipp@devaholics.io" \
    > ~/.ssh/id_devaholics_github_rsa.pub
  echo "Paste value for private key ~/.ssh/id_devaholics_github_rsa"
  cat > ~/.ssh/id_devaholics_github_rsa
  chmod 600 ~/.ssh/id_devaholics_github_rsa

  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzgogr6K08faDcv+g/pHwdacRolV7u7dKbhVyMDpMujq1nwCMxt5Mj6G5IAKHGaHxe6Qz9rZ+rrwl+S4NNJiN7yneMz3qUa/9BtyUmrkJSrgs0nUpFcHfdmBxnv2pDkmUupUWIbEsSzbbjBs6pbogfvngH7CpS2Sww1FzB0RFpZrlVpGH5yHddZV75AhorOGCy47Mo/QHzaFt9oGkeuv6yKlvNXv6D2vd3YrZjqSQwE2wXdl0kSiIs6wQy/eTFC5IV43mgKsi0vKAOJI5onwZCs2Pi+P15rM1/qRdAwwhCNtnNLYAjYCf8cpQ67Ac/x6jXAxm7hOm/kEnmYQ9kyyB7qUty/JeTe1cGFzeA8owLP3OsLnk2lZzFYsSuqfufKZedRPQdyP12VU9Gvvx7IWOr7tgSjKzQq+V6vbaRgTjU08yjPpQbspdUw6z80iEGpi5YTjQ1cvZ5eWXFggxbPxTqOtulLH9WEfBGLwGc93IwkpsmTTymJl1gXqxoY0mtcmk= philipp@appliqon.devaholics.io" \
    > ~/.ssh/id_devaholics_appliqon_digitalocean_rsa.pub
  echo "Paste value for private key ~/.ssh/id_devaholics_appliqon_digitalocean_rsa"
  cat > ~/.ssh/id_devaholics_appliqon_digitalocean_rsa
  chmod 600 ~/.ssh/id_devaholics_appliqon_digitalocean_rsa
}

configureGit() {
  echo "Configuring Git..."
  git config --global core.editor "vim"
  git config --global user.name "Philipp Sommersguter"
  git config --global user.email "philipp@devaholics.io"
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

prepareProjectAppliqon() {
  echo "Preparing project directory for Appliqon..."
  mkdir -p ~/projects/appliqon/
  git clone \
    git@github.com:appliqon/appliqon-server.git \
    git@github.com:appliqon/appliqon-webapp.git \
    git@github.com:appliqon/appliqon-distribution.git \
    git@github.com:appliqon/appliqon-mobile.git
}

updateUserPassword
installSDKMan
installNVM
installGoogleChrome
installJetbrainsToolbox
installBrotherPrinterScannerDriver
configureFlatpack
configureLocale
configurePinnedApps
configureSshCredentials
configureGit
prepareProjectAppliqon
validateAndReboot
