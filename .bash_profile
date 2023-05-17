[[ -s ~/.bashrc ]] && source ~/.bashrc

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
