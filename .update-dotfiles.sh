#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

if [ "$(uname)" == "Darwin" ]; then
  # macOS

  SUBLIME_PACKAGES_DIRECTORY=~/Library/Application\ Support/Sublime\ Text\ 3/Packages
  ESPANSO_CONFIG_DIRECTORY=~/Library/Preferences/espanso
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Linux

  SUBLIME_PACKAGES_DIRECTORY=~/.config/sublime-text-3/Packages/
  ESPANSO_CONFIG_DIRECTORY="$XDG_CONFIG_HOME/espanso"
fi

# Setup Sublime Text 3 by symlinking User settings directory
cd "$SUBLIME_PACKAGES_DIRECTORY"

if [[ -d User && ! -L User ]]; then
  mv User User.backup
fi

if ! [ -L User ]; then
  ln -s ~/.sublime-text-3/User
fi

# Setup Espanso by symlinking configuration
cd "$ESPANSO_CONFIG_DIRECTORY"

if [[ -f default.yml && ! -L default.yml ]]; then
  mv default.yml default.yml.backup
fi

if ! [ -L default.yml ]; then
  ln -s ~/.espanso-config/default.yml
fi

# Copy git hooks to enable self updating
cp ~/.hooks/pre-push ~/.dotfiles/hooks/pre-push
cp ~/.hooks/post-merge ~/.dotfiles/hooks/post-merge
