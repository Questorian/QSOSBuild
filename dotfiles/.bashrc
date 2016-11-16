# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"

# ls 
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias l='ls -la'

# command history
shopt -s histappend
PROMPT_COMMAND='history -n;history -a'
HISTSIZE=100000
HISTFILESIZE=1000000
HISTTIMEFORMAT="%F %T "


alias ...='cd ../..'
alias ....='cd ../../..'
alias a='alias'
alias h='history'
alias mount='mount | column -t'

#git
alias ga='git add '
alias gc='git commit '
alias gd='git diff '
alias gp='git push '
alias gpom='git push origin master '
alias gs='git status '

