alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [ "$(uname)" == "Darwin" ]; then
  # macOS

  alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

  # Setup iTerm
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm"
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Linux

  alias sublime='/usr/bin/subl'

  export TERM="xterm-kitty"
  export TERMINFO="$HOME/.local/kitty.app/lib/kitty/terminfo"
  export LOCALE_ARCHIVE="/usr/lib/locale/locale-archive"
fi

load_chruby() {
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
}

# bin/mina deploy breaks without this in Kitty
export LANG=en_US.UTF-8

# Setup chruby
if [[ -d /usr/local/share/chruby ]]; then
  load_chruby
fi

# Setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export GOPATH=$HOME/Code/go

if [ -e /Users/david/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/david/.nix-profile/etc/profile.d/nix.sh; fi
if [ -e /home/david/.nix-profile/etc/profile.d/nix.sh ]; then . /home/david/.nix-profile/etc/profile.d/nix.sh; fi