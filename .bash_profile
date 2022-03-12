
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

case $(uname -s) in
Darwin)
  if [ -f /usr/local/opt/coreutils/libexec/gnubin/ls ];
  then
    alias ls="/usr/local/opt/coreutils/libexec/gnubin/ls"
  fi
  ;;
esac

if [ -f ~/.trapd00r_colors ]; then
  if command -v gdircolors;
  then
    eval `gdircolors ~/.trapd00r_colors`
  else
    eval `dircolors ~/.trapd00r_colors`
  fi
fi

if [ -f ~/git-prompt.sh ];
then
  source ~/git-prompt.sh
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

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT
