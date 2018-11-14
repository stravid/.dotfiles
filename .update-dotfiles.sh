#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

if [ "$(uname)" == "Darwin" ]; then
  # macOS

  SUBLIME_PACKAGES_DIRECTORY=~/Library/Application\ Support/Sublime\ Text\ 3/Packages
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Linux

  SUBLIME_PACKAGES_DIRECTORY=~/.config/sublime-text-3/Packages/
fi

# Setup Sublime Text 3 by symlinking User settings directory
cd "$SUBLIME_PACKAGES_DIRECTORY"

if [[ -d User && ! -L User ]]; then
  mv User User.backup
fi

if ! [ -L User ]; then
  ln -s ~/.sublime-text-3/User
fi

# Copy git hooks to enable self updating
cp ~/.hooks/update ~/.dotfiles/hooks/update
cp ~/.hooks/post-checkout ~/.dotfiles/hooks/post-checkout
