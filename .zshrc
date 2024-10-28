setopt incappendhistory

### sources from other configs
source ~/.zshenv
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
[ -f /Users/john/.travis/travis.sh ] && source /Users/john/.travis/travis.sh
source ~/.nurc
#source "$HOME/.cargo/env"

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### evals
# eval "$(rbenv init -)"
# eval "$(pyenv init -)"
eval $(lending autocomplete:script zsh)
eval "$(starship init zsh)"

zstyle ':completion:*' menu select

## Avoid vim keybindings in terminal
bindkey -e

zinit ice wait lucid as"completion" atload"zicompinit;zicdreplay" blockf
zinit snippet https://gist.githubusercontent.com/ashton/5189ac9730bce1711776f9232ac896fc/raw/93cc026e993d73f10b1d1f728347740b26f1960b/brew_completion.sh

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

zinit ice atload"unalias ld"
zinit ice has'eza' atinit'AUTOCD=1'
zinit light z-shell/zsh-eza

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

# Created by `pipx` on 2024-10-10 15:10:43
export PATH="$PATH:/Users/matheus.ashton/.local/bin"
