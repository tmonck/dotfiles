echo "bash_profile"
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

infiniteCurl() {
    while true; do curl $1; done
}

removeBinAndObj() {
  find . -iname "bin" -o -iname "obj" -print0 | xargs -0 rm -rf
}

setTabTitle() {
  echo -ne "\033]0;$1\007"
}

minidocker() {
  eval $(minikube docker-env)
}

if [ -f ~/git-prompt.sh ];
then
  source ~/git-prompt.sh
  PROMPT_COMMAND='__posh_git_ps1 "\[\033[0;35m\]\u \[\033[32m\]on host \[\033[0;35m\]\h: \[\033[0;95m\]\w" "\n\[\033[32m\]$ ";'$PROMPT_COMMAND
fi

if command -v kubectl > /dev/null;
then
   source <(kubectl completion bash)
fi

if command -v argocd > /dev/null;
then
   source <(argocd completion bash)
fi
if command -v tkn > /dev/null;
then
   source <(tkn completion bash)
fi

export GOPATH="${HOME}/go"
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$PATH:$DOTNET_ROOT:$GOPATH/bin
