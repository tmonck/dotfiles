#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias docker=podman
alias emacs-lab='emacs --with-profile=lab'
alias emacs-backup='emacs --with-profile=backup'

# ls alias
case $(uname -s) in
  Linux)
    alias ls='ls --color=auto'
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    ;;
  Darwin)
    alias ls='$(brew --prefix)/opt/coreutils/libexec/gnubin/ls --color=auto'
    alias ll='$(brew --prefix)/opt/coreutils/libexec/gnubin/ls --color=auto -alF'
    alias la='$(brew --prefix)/opt/coreutils/libexec/gnubin/ls --color=auto -A'
    alias l='$(brew --prefix)/opt/coreutils/libexec/gnubin/ls -- color=auto -CF'
    ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias code='cd ~/code'

alias emacsb='emacs --with-profile backup'

if [ "$HOSTNAME" == "moncktower" ];
then
    alias code="cd ~/secondary/code"
    alias shell_scripts="cd ~/secondary/code/shell_scripts/"
    alias nas="cd ~/dsmonckcrazy/"
fi

#### Work Specific
alias aws_lab='AWS_PROFILE=lab-us-east-1'
alias aws_sbx_use1='AWS_PROFILE=sandbox-us-east-1'
alias aws_sbx_euc1='AWS_PROFILE=sandbox-eu-central-1'
alias aws_stage='AWS_PROFILE=stage-us-east-1'
alias aws_prod='AWS_PROFILE=prod-us-east-1'
alias python='python3'
