# Custom plugins for Homebrew
function bu() {
    if [ ! hash pyenv 2>/dev/null ]; then
        echo "Pyenv not installed"
        brew update && brew upgrade && brew cleanup
    else
        echo "Pyenv installed, setting system python"
        pyenv shell system
        brew update && brew upgrade && brew cleanup
        echo "unsetting system python"
        pyenv shell --unset
    fi
}
