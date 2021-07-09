export DEFAULT_USER="$(whoami)"

### HOMEBREW
export HOMEBREW_BUNDLE_FILE=$HOME/.config/Brewfile

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.emacs.d/bin:$PATH"

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

source ~/.keys
