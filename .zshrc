### sources from other configs
source ~/.zshenv
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
[ -f /Users/john/.travis/travis.sh ] && source /Users/john/.travis/travis.sh
source ~/.nurc
source "$HOME/.cargo/env"

source /usr/local/opt/zinit/zinit.zsh

### evals
# eval "$(rbenv init -)"
# eval "$(pyenv init -)"
eval $(lending autocomplete:script zsh)
eval "$(starship init zsh)"

zstyle ':completion:*' menu select

### Plugins config
  # ytakahashi/igit           \
zinit wait lucid for        \
  Valiev/almostontop        \
  kiurchv/asdf.plugin.zsh   \
  sticklerm3/alehouse       \
  agkozak/zsh-z             \
  Tarrasch/zsh-bd           \
  kazhala/dotbare           \
  reegnz/jq-zsh-plugin      \
  OMZP::colored-man-pages   \
  OMZP::fancy-ctrl-z        \
  OMZP::git-auto-fetch

zinit ice blockf atpull"zinit creinstall -q ."
zinit snippet "https://github.com/technomancy/leiningen/blob/master/zsh_completion.zsh"

zinit ice wait lucid atinit"zicompinit; zicdreplay" blockf atpull"zinit creinstall -q ."
zinit light zsh-users/zsh-completions

zinit ice wait lucid atinit"zicompinit; zicdreplay" blockf atpull"zinit creinstall -q ."
zinit light z-shell/fast-syntax-highlighting

zinit load zsh-users/zsh-history-substring-search

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit load trapd00r/LS_COLORS

zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zinit load ogham/exa

zinit ice atload"unalias ld"
zinit light RitchieS/zsh-exa

zinit ice as"command" from"gh-r" atclone"./navi widget zsh > navi-widget.zsh" \
  atpull"%atclone" pick"navi" src"navi-widget.zsh"
zinit load denisidoro/navi

zinit ice as"program" pick"bin/git-dsf"
zinit light z-shell/zsh-diff-so-fancy

zinit ice from'gh-r' as'program'
zinit light sei40kr/fast-alias-tips-bin
zinit light sei40kr/zsh-fast-alias-tips

### Bindings
source ~/.bindings

### Aliases
source ~/.aliases
