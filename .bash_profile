[[ "$(uname -s)" == "Darwin" && -s ~/.bashrc ]] && source ~/.bashrc

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

# if [ -f ~/git-prompt.sh ];
# then
#   source ~/git-prompt.sh
#   PROMPT_COMMAND='__posh_git_ps1 "\[\033[0;35m\]\u \[\033[0m\]on host \[\033[0;35m\]\h: \[\033[0;95m\]\w" "\n\[\033[0m\]$";'$PROMPT_COMMAND
# fi

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

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT
