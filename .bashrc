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

  alias sublime='/usr/bin/subl'
fi

export GOPATH=$HOME/Code/go

# Setup projects in tmux

tmux has-session -t dartboard 2>/dev/null
if [ "$?" -eq 1 ] ; then
  tmux new-session -D -d -c ~/Code/datsu-api -s dartboard \; \
    split-window -v \; \
    split-window -h \; \
    send-keys 'cd ~/Code/datsu-frontend' C-m \; \
    select-pane -U \; \
    split-window -h \; \
    send-keys 'cd ~/Code/datsu-frontend' C-m \;
fi

tmux has-session -t tedian 2>/dev/null
if [ "$?" -eq 1 ] ; then
  tmux new-session -D -d -c ~/Code/tedian-api -s tedian \; \
    split-window -v \; \
    split-window -h \; \
    send-keys 'cd ~/Code/tedian-frontend' C-m \; \
    select-pane -U \; \
    split-window -h \; \
    send-keys 'cd ~/Code/tedian-frontend' C-m \;
fi
