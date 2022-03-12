alias code='cd ~/code'

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

if [ -f ~/.trapd00r_colors ]; then
  if command -v gdircolors;
  then
    eval `gdircolors ~/.trapd00r_colors`
  else
    eval `dircolors ~/.trapd00r_colors`
  fi
fi

source ~/git-prompt.sh
source <(kubectl completion bash)
source <(argocd completion bash)
source <(tekton completion bash)

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT
