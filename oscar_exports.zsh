# Oscar PyPi mirror
export PIP_INDEX_URL="https://devpi.hioscar.com/root/oscar/+simple/"

# Repositories
export DATA_REPO=$HOME/workspace/data

# Certs directory
export OSC_CERTS=$HOME/oscar/certs

# Paths
export PATH=$PATH:$HOME/oscar/deps/arcanist/bin
export PATH=$PATH:$DATA_REPO/engshare/bin
export PATH=$PATH:$DATA_REPO/go/bin:$DATA_REPO/go_third_party_local/bin
export PATH=$PATH:/usr/local/opt/mysql/bin

# Go paths
export GOPATH=$DATA_REPO/go_third_party_local:$DATA_REPO/go:$DATA_REPO/protobuf/gen-go

# Python virtual environment
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Default environment
workon oscar

# Set default compiler/linker flags for brew-installed libraries
# Without these, the libraries are not found by binary builds (e.g. native Python libs), or
# outdated versions bundled with OSX are used instead
export CFLAGS="-I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include/sasl $(PKG_CONFIG_PATH=$(brew --prefix libffi)/lib/pkgconfig pkg-config libffi --cflags) -I$(brew --prefix libyaml)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix libffi)/lib -L$(brew --prefix libyaml)/lib"

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# Needed for successful pyicu installation
export ICU_VERSION=60.2.0

# Miscellaneous
export RADONFILESENCODING=UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm 

source $HOME/workspace/data/engshare/bin/stack-diff-tools

export fpath=(${DATA_REPO}/engshare/bin $fpath)
