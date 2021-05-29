alias code='cd ~/code'

alias identity='cd ~/code/dsi_api/identity'

alias plat='cd ~/code/plat'

infiniteCurl() {
    while true; do curl $1; done
}

removeBinAndObj() {
  find . -iname "bin" -o -iname "obj" -print0 | xargs -0 rm -rf
}

setTabTitle() {
  echo -ne "\033]0;$1\007"
}

source ~/git-prompt.sh
