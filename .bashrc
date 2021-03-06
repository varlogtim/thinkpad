# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Aliases
alias ls='ls --color=always'
alias grep='grep --color=always'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -iv'
alias make='make'  # use 8 jobs
alias ct='ctags -R -o ~/.cache/ctags ./'

# Functions
FUNC_DIR=$HOME/thinkpad/tools/bash_funcs
for f in $FUNC_DIR/*; do
    source $f
done

# Variables
export CSCOPE_EDITOR=/usr/bin/vim

# Node.js
# https://stackoverflow.com/questions/18088372/how-to-npm-install-global-not-as-root
export NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

# Additional bashrc's
for rc in $HOME/.config/.*.bashrc; do
    source $rc
done

# Android
export ANDROID_SDK_ROOT=$HOME/Android/Sdk/

# Paths
export PATH=$HOME/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ttucker/tmp/src/google-cloud-sdk/path.bash.inc' ]; then . '/home/ttucker/tmp/src/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ttucker/tmp/src/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ttucker/tmp/src/google-cloud-sdk/completion.bash.inc'; fi

# PyEnv init
eval "$(pyenv init -)"


# Determined - XXX Move to additional bashrcs
alias entdet='source $HOME/.virtualenvs/determined/bin/activate' 
alias gdet='source $HOME/determined/det/bin/activate'

# A better git log
#git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
