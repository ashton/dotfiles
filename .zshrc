setopt incappendhistory
source ~/.zshenv

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/john/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

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

eval "$(starship init zsh)"
zstyle ':completion:*' menu select

bindkey -v

zinit wait lucid for        \
  Valiev/almostontop        \
  kiurchv/asdf.plugin.zsh   \
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

### Sources
. /opt/asdf-vm/asdf.sh
. "$HOME/.cargo/env"

### Bindings
source ~/.bindings

### Aliases
source ~/.aliases
