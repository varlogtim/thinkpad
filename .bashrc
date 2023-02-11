# PyEnv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

# Aliases
alias ls='ls --color=always'
alias grep='grep --color=always'
alias grepc='grep --color=never'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -iv'
alias less='less -R'
alias make='make'  # use 8 jobs
alias ct='ctags -R -o ~/.cache/ctags ./'
alias xc='xclip'
alias purgeDevDb='docker kill determined_db; docker container rm determined_db'
alias ca='conda activate'
alias cad='conda activate dev-3.7.11'
alias dact='conda deactivate'
alias dcl='devcluster -c ~/.devcluster.yaml'
alias token='export TOKEN=$(curl -X POST -d "{\"username\": \"admin\", \"password\": \"\"}" ${DET_MASTER}/api/v1/auth/login | jq ".token" | sed "s/\"//g")'
alias mnistp="det e create ~/determined/examples/tutorials/mnist_pytorch/const.yaml ~/determined/examples/tutorials/mnist_pytorch/"
alias dt='date +"%Y%m%dT%H%M%S"'
alias desc='det e describe'
alias rmdb='sudo rm -vrf ~/.postgres/'
alias topmem='top -bn1 -o%MEM | head -n 20'

# function gitfullblame { git blame $1 | cut -d" " -f1 | uniq | while read sha; do git show $sha; done; }
# export -f gitfullblame

# Display stuff:
export GDK_SCALE=0.5


# LD_LIBRARY_PATH  XXX You should probably dynamically set these
export LD_LIBRARY_PATH=/usr/lib/modules/6.1.9-arch1-1/build/include/:/usr/lib/modules/6.1.9-arch1-1/build/arch/x86/include/:/usr/lib/modules/6.1.9-arch1-1/build/arch/x86/include/generated/

# Functions
FUNC_DIR=$HOME/thinkpad/tools/bash_funcs
for f in $FUNC_DIR/*; do
    source $f
done

function dget {
    curl -H "Authorization: Bearer ${TOKEN}" -H  "accept: application/json" -X GET "${DET_MASTER}${1}"
}

# Variables
export CSCOPE_EDITOR=/usr/bin/vim
export EDITOR=/usr/bin/vim

# Browser
xdg-mime default browser.desktop x-scheme-handler/http
xdg-mime default browser.desktop x-scheme-handler/https


# bash-completion
BASH_COMPLETION='/usr/share/bash-completion/bash_completion'
if [ -e ${BASH_COMPLETION} ]; then
    source ${BASH_COMPLETION}
fi

# Node.js
# https://stackoverflow.com/questions/18088372/how-to-npm-install-global-not-as-root
export NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

# NVM for Node.js
# https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Additional bashrc's
for rc in $HOME/.config/.*.bashrc; do
    source $rc
done

export TERMINFO="/usr/share/terminfo"

# Go lang
# curl -LO https://dl.google.com/go/go1.17.2.linux-amd64.tar.gz 
# curl -LO https://go.dev/dl/go1.18.10.linux-amd64.tar.gz
export GOROOT="$HOME/tmp/src/golang/go-1.18.10"
export GOPATH="$HOME/tmp/go_roots/go-1.18.10"
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# System Go
#export PATH=$HOME/go/bin:$PATH

# Paths
export PATH=$HOME/bin:$PATH
export PATH=/usr/lib/jvm/java-11-openjdk/bin/:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/home/ttucker/tmp/determined/dev-scripts:$PATH



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ttucker/tmp/src/google-cloud-sdk/path.bash.inc' ]; then . '/home/ttucker/tmp/src/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ttucker/tmp/src/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ttucker/tmp/src/google-cloud-sdk/completion.bash.inc'; fi

export TZ='America/New_York';

# A better git log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ttucker/miniconda3/condabin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ttucker/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ttucker/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ttucker/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
