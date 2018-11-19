alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [ "$(uname)" == "Darwin" ]; then
  # macOS

  alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Linux

  alias sublime='/usr/bin/subl'
fi

# Setup chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export GOPATH=$HOME/Code/go

# Setup projects in tmux

tmux has-session -t dartboard 2>/dev/null
if [ "$?" -eq 1 ] ; then
  tmux new-session -D -d -c ~/Code/datsu-api -s dartboard \; \
    split-window -v \; \
    send-keys 'cd ~/Code/datsu-api && clear' C-m \; \
    split-window -h \; \
    send-keys 'cd ~/Code/datsu-frontend && clear' C-m \; \
    select-pane -U \; \
    split-window -h \; \
    send-keys 'cd ~/Code/datsu-frontend && clear' C-m \;
fi

tmux has-session -t tedian 2>/dev/null
if [ "$?" -eq 1 ] ; then
  tmux new-session -D -d -c ~/Code/tedian-api -s tedian \; \
    split-window -v \; \
    send-keys 'cd ~/Code/tedian-api && clear' C-m \; \
    split-window -h \; \
    send-keys 'cd ~/Code/tedian-frontend && clear' C-m \; \
    select-pane -U \; \
    split-window -h \; \
    send-keys 'cd ~/Code/tedian-frontend && clear' C-m \;
fi

tmux has-session -t jobaktuell 2>/dev/null
if [ "$?" -eq 1 ] ; then
  tmux new-session -D -d -c ~/Code/jobaktuell -s jobaktuell \; \
    split-window -v \; \
    send-keys 'cd ~/Code/jobaktuell && clear' C-m \; \
    split-window -h \; \
    send-keys 'cd ~/Code/jobaktuell && clear' C-m \; \
    select-pane -U \; \
    split-window -h \; \
    send-keys 'cd ~/Code/jobaktuell && clear' C-m \;
fi
