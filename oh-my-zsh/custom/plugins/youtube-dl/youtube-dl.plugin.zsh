# Custom plugin for Youtube-dl aliases

alias ytb-f='youtube-dl -F'
alias ytb-dl='youtube-dl -o "$HOME/Movies/Youtube-dl/%(title)s.%(ext)s"'
alias ytb-dlm='youtube-dl -o "$HOME/Movies/Youtube-dl/%(title)s.%(ext)s" -f best -i'
alias ytb-a='youtube-dl -o "%(title)s.%(ext)s" -x --audio-format'
alias ytb-dlm-sub='youtube-dl -o "$HOME/Movies/Youtube-dl/%(title)s.%(ext)s" -f best -i --write-sub --sub-lang en,pt-BR,pt'
alias ytb-dlm-asub='youtube-dl -o "$HOME/Movies/Youtube-dl/%(title)s.%(ext)s" -f best -i --write-auto-sub --sub-lang en,pt-BR,pt'
