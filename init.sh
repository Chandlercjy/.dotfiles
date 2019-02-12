export EDITOR='nvim' # Editor Shotcut

# System setting
export TERM=xterm-24bits
# export TERM=xterm-256color

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Plugin
if [[ $(ps $$ | grep $$ | awk '{print $5}') == '-zsh' ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
elif [[ $(ps $$ | grep $$ | awk '{print $5}') == 'bash' ]]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

# =================== 取消brew自动更新 =====================

if [[ "$(uname)"=="Darwin" ]]; then
    export HOMEBREW_NO_AUTO_UPDATE=true

fi

# ========================= Alias ==========================
alias v="nvim"

# Emacs
# alias e='emacs -nw'
# alias et='emacsclient -t -a ""'
# alias ec='emacsclient -c -a ""'
