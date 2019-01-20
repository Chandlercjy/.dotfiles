# Editor Shotcut
alias v="nvim"
# alias e='emacs -nw'
# alias et='emacsclient -t -a ""'

# System setting
export TERM=xterm-24bits
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Plugin
if [[ `ps $$|grep $$|awk '{print $5}'` = '/bin/zsh' ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    echo "ZSH!"
elif [[ `ps $$|grep $$|awk '{print $5}'` = 'bash' ]]; then
    echo "BASH!"
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

