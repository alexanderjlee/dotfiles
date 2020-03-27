#!/bin/bash

set -e

# STEP: Make sure you have $HOME/.ssh copied in


# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew upgrade
brew update
brew install wget
brew install ack
brew install tree
brew install telnet
brew install jq
brew install watch
easy_install pip

# install GnuPG
brew install gnupg

# install Keybase
wget -O ${HOME}/Downloads/Keybase.dmg https://prerelease.keybase.io/Keybase.dmg
hdiutil attach ${HOME}/Downloads/Keybase.dmg
cp -r /Volumes/Keybase/Keybase.app /Applications/
hdiutil unmount /Volumes/Keybase -force

# install Git
cd ~ && mkdir git
brew install git
git config --global core.excludesfile ~/git/.gitignore
echo .DS_Store >> ~/git/.gitignore

# install Slack
wget -O ${HOME}/Downloads/Slack.dmg https://slack.com/ssb/download-osx
hdiutil attach ${HOME}/Downloads/Slack.dmg
cp -r /Volumes/Slack.app/Slack.app /Applications/
hdiutil unmount /Volumes/Slack.app -force

# install iTerm2
wget -O ${HOME}/Downloads/iTerm2.zip https://iterm2.com/downloads/stable/latest
unzip ${HOME}/Downloads/iTerm2.zip -d /Applications/

# install zsh
brew install zsh zsh-completions
#echo "fpath=(/usr/local/share/zsh-completions \$fpath)" >> ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
echo -e "# for use with iTerm2 interpolated strings\n# \(user.kubecontext)\n# \(user.gcloudproject)\nfunction iterm2_print_user_vars() {\n  iterm2_set_user_var kubecontext \$(awk -F' ' '/current/{print \$2}' ~/.kube/config | cut -d_ -f2)\n  iterm2_set_user_var gcloudproject \$(cat ~/.config/gcloud/configurations/config_default | grep project | awk '{print \$3}')\n}\n$(cat ~/.iterm2_shell_integration.zsh)" > ~/.iterm2_shell_integration.zsh
sed -i -e 's/printf "]133;A"/#printf "]133;A"/' ~/.iterm2_shell_integration.zsh #^[ is ctrl+v Esc     ^G is ctrl+v ctrl+g
echo "
source ~/.iterm2_shell_integration.zsh" >> ~/.zshrc

# install Docker
wget -O ${HOME}/Downloads/Docker.dmg https://download.docker.com/mac/stable/Docker.dmg
hdiutil attach ${HOME}/Downloads/Docker.dmg
cp -r /Volumes/Docker/Docker.app /Applications/
hdiutil unmount /Volumes/Docker -force
