### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"

export EDITOR=$(which vim)

# aliases
alias ls="ls -G"
alias la="ls -aG"
alias ll="ls -lG"
alias lla="ls -laG"
alias dc="docker-compose"
alias docker-cleanup="docker rm $(docker ps -a -q) && docker rmi $(docker images -q)"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

### GO
export GOPATH="${HOME}/go"

### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -p ~/.ignore -g ""'

# added by travis gem
[ -f /Users/john/.travis/travis.sh ] && source /Users/john/.travis/travis.sh

### TAGS
alias ctags="`brew --prefix`/bin/ctags"
export GTAGSLABEL=ctags

# HOMEBREW GITHUB API KEY
export HOMEBREW_GITHUB_API_TOKEN="26c6306972b31368ed4f3add104d4d6b720e3a9e"
