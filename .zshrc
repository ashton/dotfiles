setopt incappendhistory

### sources from other configs
source ~/.zshenv
source ~/.nurc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

### evals
# eval "$(rbenv init -)"
# eval "$(pyenv init -)"
eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

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

