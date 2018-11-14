alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if type "rbenv" &> /dev/null; then
  eval "$(rbenv init -)"
fi

if [ "$(uname)" == "Darwin" ]; then
  # macOS

  alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Linux

  alias sublime='/usr/lib/bin/subl'
fi
