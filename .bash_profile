alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

if type "rbenv" &> /dev/null; then
  eval "$(rbenv init -)"
fi

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
