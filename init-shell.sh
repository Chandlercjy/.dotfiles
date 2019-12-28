export EDITOR='nvim' # Editor Shotcut

# System setting
# export TERM=xterm-24bits
export TERM=xterm-256color

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Plugin
if [[ $(ps $$ | grep $$ | awk '{print $5}') == '-zsh' ]]; then
    DISABLE_AUTO_TITLE="true"
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
elif [[ $(ps $$ | grep $$ | awk '{print $5}') == 'bash' ]]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

if [ -n "$TMUX" ]; then
    export TERM=screen-256color
fi


# =================== 取消brew自动更新 =====================
export HOMEBREW_NO_AUTO_UPDATE=true

# ========================= Alias ==========================
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
