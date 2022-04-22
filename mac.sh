brew install bash

echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells
sudo chpass -s /usr/local/bin/bash $(whoami)

brew install bash-completion@2
