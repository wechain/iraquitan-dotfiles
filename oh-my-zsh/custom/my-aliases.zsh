# My custom aliases for zsh

# Don't change. The following determines where Oh-My-Zsh is installed.
omz=$HOME/.oh-my-zsh

# My Alias Editing
alias ae='vim $omz/custom/my-aliases.zsh' #my-alias edit
alias ar='source $omz/custom/my-aliases.zsh'  #my-alias reload

# Zsh Profile Editing
alias ze='vim ~/.zshrc'  #zshrc edit
alias zr='source ~/.zshrc'  #zshrc reload

# show me files matching "ls grep"
alias lsg='ll | grep'

alias ka9='killall -9'
alias k9='kill -9'

# Alias to Show/Hide files
alias hidehf="defaults write com.apple.finder AppleShowAllFiles FALSE;killall Finder"
alias showhf="defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder"

# Alias for fast router config GUI
alias router="command -v route && open http://$(route -n get default | grep gateway | awk -F ': ' '{ print $2 }')"

# because typing 'cd' is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# Disk usage and finding directory or files
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# History
alias h='history'
alias hgrep="fc -El 0 | grep"

# Dock scroll gestures
alias dockscroll_on='defaults write com.apple.dock scroll-to-open -bool TRUE; killall Dock'
alias dockscroll_off='defaults write com.apple.dock scroll-to-open -bool FALSE; killall Dock'

# Terminal Proxy
function terminal_proxy() {
	export http_proxy=${1}
	export HTTPS_PROXY=${1}
	export HTTP_PROXY=${1}
}

function unset_terminal_proxy() {
	unset http_proxy
	unset HTTPS_PROXY
	unset HTTP_PROXY
}

# Alias for Git Custom
function git_setproxy() {
	git config --global http.proxy ${1}
	git config --global https.proxy ${1}
}
function git_unsetproxy() {
	git config --global --unset http.proxy
	git config --global --unset https.proxy
}

# Add MacTeX to path
alias mactex_path='export PATH=$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin'

# Check what process is listening on port
function whos_listening () {
	lsof -n -i4TCP:$1 | grep LISTEN
}

alias vagrant_shutdown_all='vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;'

alias gitignored='git ls-files --other --ignored --exclude-standard'

# Set a blazingly fast keyboard repeat rate
alias set_bf_kb='defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 12'

# Set keyboard settings to default
alias default_kb='defaults delete NSGlobalDomain KeyRepeat
defaults delete NSGlobalDomain InitialKeyRepeat'

# Flush DNS
alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed'

# Update dotfiles
function dfu() {
    (
        cd ~/.dotfiles && git pullff && ./install -q
    )
}

# Execute a command in a specific directory
function in() {
    (
        cd ${1} && shift && ${@}
    )
}

# Check if a file contains non-ascii characters
function nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' ${1}
}

# Mirror a website
alias mirrorsite='wget -m -k -K -E -e robots=off'

# Check octal mod of dir or file
function octmod() {
	stat -f %Mp%Lp ${1}
}

# Copy and create dir if not exist
function cpmkdir() {
    test -d "${2}" || mkdir -p "${2}" && cp ${1} "${2}"
}

# Count coffe
alias coffee='VALUE=$( cat ~/.cupsocoffee ) ; VALUE=$(( $VALUE + 1 )); echo $VALUE > ~/.cupsocoffee ; echo $VALUE'

# Unsecure http Google Chrome
alias chrome-unsecure="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=test --unsafely-treat-insecure-origin-as-secure=http://localhost:8080"

# Open in chrome
alias chrome="open -a 'Google Chrome'"

# Base64 encode function
function base64_enc() {
    echo -n ${1} | base64
}

# Base64 decode function
function base64_dec() {
    echo -n ${1} | base64 -D
}

# Alias vim to mvim
if [ -f "`which mvim`" ]; then
    alias vim="mvim -v"
fi

# Update Vim plugins
alias vim-plugin-update="vim +PluginUpdate +qall"

alias conda_activate='export PATH="$HOME/voohierra/bin:$PATH"'

# Docker aliases and functions

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Delete orphaned volumes
alias dcl='docker volume rm $(docker volume ls -qf dangling=true)'

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Remove untagged images
driut() { docker rmi $(docker images -q --filter "dangling=true") }

# Run interactive container using zsh
dkizsh () { docker run --rm -it -P $1 /bin/zsh }

# Run a deviantony/sandbox container using zsh
sandbox () { docker run --rm -it -v /tmp/docker-sandbox:/shared deviantony/sandbox /bin/zsh }

# docker-compose shortcut
alias dkc="docker-compose"

# docker-compose remove containers
alias dkcrm="docker-compose rm --force"

# docker-compose remove containers, build and up
alias dkcrbu="docker-compose rm --force && docker-compose build && docker-compose up"

# Mine
alias c="code -w"
alias a="atom"

# SSH autocomplete
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# system aliases and functions
alias apt-get='sudo apt-get'
alias ..='cd ..'
alias e='emacs -nw'
alias se='sudo emacs -nw'
alias meminfo='free -m -l -t'
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown'
alias h='history'
alias j='jobs -l'
alias mount='mount | column -t'
alias grep='grep --color=auto'
alias del='rm -rf'
alias sdel='sudo rm -rf'
alias du1='du -h --max-depth=1'
alias sdu1='sudo du -h --max-depth=1'
alias publicip='curl "https://api.ipify.org?format=json"'

function count_files() {
    if [ "$1" ]
    then
        find . -type f -name "${1}" | wc -l
    else
        find . -type f | wc -l
    fi
}

function debug_zsh() {
    zsh -xv 2>&1 | ts -i "%.s" > $HOME/zsh_startup.log
}
