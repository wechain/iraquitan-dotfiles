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

# VirtualEnvWrapper env path
export WORKON_HOME=~/PyEnvs
# Add VirtualEnvWrapper to path
# source /usr/local/bin/virtualenvwrapper.sh

# Open PopcornTime Temp folder
alias popcorn_temp='open $TMPDIR/Popcorn-Time'

# Dock scroll gestures
alias dockscroll_on='defaults write com.apple.dock scroll-to-open -bool TRUE; killall Dock'
alias dockscroll_off='defaults write com.apple.dock scroll-to-open -bool FALSE; killall Dock'

# Terminal Proxy
alias terminal_proxy='export http_proxy=http://webcache.itv.local:8080/
export HTTPS_PROXY=http://webcache.itv.local:8080/'

# Alias for Git Custom
alias gsproxxy='git config --global http.proxy http://webcache.itv.local:8080
git config --global https.proxy http://webcache.itv.local:8080'
alias guproxxy='git config --global --unset http.proxy
git config --global --unset https.proxy'

# Anaconda python
alias conda_python='export PATH="$HOME/anaconda/bin:$PATH"'

# Check what process is listening on port
function whos_listening () {
	lsof -n -i4TCP:$1 | grep LISTEN
}

alias vagrant_shutdown_all='vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant halt $line; done;'

# Adjust terminal window
#printf '\e[3;0;950t'  # Move to bottom left
#printf '\e[8;24;400t' # Maximize horizontally

alias gitignored='git ls-files --other --ignored --exclude-standard'

# Set a blazingly fast keyboard repeat rate
alias set_bf_kb='defaults write NSGlobalDomain KeyRepeat -int 0.02
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
