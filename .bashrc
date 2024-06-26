# ~/.bashrc: executed by bash(1) for nn-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
timeStart=$(date +%s)
case $- in
  *i*) ;;
  *) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
Force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

  #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]|$(date +%H:%M)$(parse_git_branch)\[\033[00m\]\$ '

else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]|$(date +%H:%M)$(parse_git_branch)\[\033[00m\]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *) ;;
esac

if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

# Set colors for bash (pretty!!)
if [ -f $HOME/.bash_colors ]; then
  . $HOME/.bash_colors
fi

if [ -f $HOME/.trapd00r_colors ]; then
  if command -v gdircolors &>/dev/null; then
    eval $(gdircolors $HOME/.trapd00r_colors)
  elif command -v dircolors &>/dev/null; then
    eval $(dircolors $HOME/.trapd00r_colors)
  fi
fi

if [ -f $HOME/git-prompt.sh ]; then
  source $HOME/git-prompt.sh
  PROMPT_COMMAND='__posh_git_ps1 "\[\033[0;35m\]\u \[\033[0m\]on host \[\033[0;35m\]\h: \[\033[0;95m\]\w" "\n\[\033[0m\]$ ";'$PROMPT_COMMAND
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Evaluate brew
[ -s /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

if command -v kubectl >/dev/null; then
  source <(kubectl completion bash)
fi

if command -v argocd >/dev/null; then
  source <(argocd completion bash)
fi

if command -v tkn >/dev/null; then
  source <(tkn completion bash)
fi

if command -v oc >/dev/null; then
  source <(oc completion bash)
fi

if command -v aws >/dev/null; then
  complete -C '$(brew --prefix)/bin/aws_completer' aws
fi

# python
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nvm/node
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ] && [ -s "$NVM_DIR/bash_completion" ]; then
  source "$NVM_DIR/nvm.sh"  # This loads nvm
  source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

export GPG_TTY=$(tty)

# Dotnet
# TODO: Do this only if dotnet is installed and this is the right path
# export DOTNET_ROOT=$HOME/.dotnet
# export PATH=$PATH:$DOTNET_ROOT

#### Work Specific
export ANSIBLE_VAULT_IDENTITY_LIST=keystone-default@$HOME/.oneid/.keystone-vault-password.txt,keystone-prod@$HOME/.oneid/.keystone-vault-password-prod.txt

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

# Jenv
export JENV_ROOT="$HOME/.jenv"
if [ -d $JENV_ROOT ]; then
  command -v jenv >/dev/null || export PATH="$JENV_ROOT/bin:$PATH"
  eval "$(jenv init -)"
fi

# golang goenv
export GOENV_ROOT="$HOME/.goenv"
if [ -d $GOENV_ROOT ]; then
  command -v goenv >/dev/null || export PATH="$GOENV_ROOT/bin:$PATH"
  eval "$(goenv init -)"
  export PATH=$PATH:"$GOPATH/bin"
fi

#set -o vi
export PROMPT_COMMAND='history -a;'$PROMPT_COMMAND

timeEnd=$(date +%s)
sec=$(((timeStart-timeEnd)%60))
printf '.bashrc loaded in: %ss\n' "$sec"
