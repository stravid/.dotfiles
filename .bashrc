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
fi

load_chruby() {
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
}

# Setup chruby
if [[ -d /usr/local/share/chruby ]]; then
  load_chruby
fi

# Setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export GOPATH=$HOME/Code/go

# bin/mina deploy breaks without this in Kitty
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
