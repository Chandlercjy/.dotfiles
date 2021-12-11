export EDITOR='nvim' # Editor Shotcut

# System setting
# export TERM=xterm-24bits
export TERM=xterm-256color

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

if [ -n "$TMUX" ]; then
    export TERM=screen-256color
fi


# ========================= Alias ==========================
alias lg="lazygit"
alias v="nvim"
alias ll="ls -la -h"

# Emacs
# alias e='emacs -nw'
# alias et='emacsclient -t -a ""'
# alias ec='emacsclient -c -a ""'

# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .repo -g ""'
export MAN_DISABLE_SECCOMP=1 # Fix Man bugs

# ========================== Lib ===========================
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PATH=$PATH:/usr/local/bin
