# Nodejs
VERSION="v17.3.0"
DISTRO="linux-x64"

# To be added to PATH
local_bin="$HOME/.local/bin"
menu_scripts="$HOME/.local/bin/menu"
nodejs="/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin"

### EXPORTS
export EDITOR="nvim"                                  # Set default editor to nvim.
export VISUAL="nvim"                                  # Set default editor to nvim.
export ZSH="/home/rasteli/.oh-my-zsh"                 # Path to oh-my-zsh installation.
export MANPAGER="sh -c 'col -bx | bat -l man -p'"     # Set bat as manpager (manual reader).
export PATH="$nodejs:$local_bin:$menu_scripts:$PATH"  # Exporting PATH with Nodejs binary.

#ZSH_THEME="amuse"
source $ZSH/oh-my-zsh.sh

# Restores the last theme generated by pwal (overwrites ZSH_THEME).
#(cat ~/.cache/wal/sequences &)

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ]; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# ====== ALIASES START ====== #
# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."

# Package management
alias pacmansyu="sudo pacman -Syu"                # Update all pacman packages
alias cleancache="sudo paccache -ruk0"            # Remove uninstalled packages cache
alias cleanup="sudo pacman -Rns $(pacman -Qdtq)"  # Remove orphaned packages

# Git
alias gps="git push"
alias gpl="git pull"
alias gcl="git clone"
alias gs="git status"
alias gc="git commit"
alias gaa="git add ."
alias gau="git add -u"
alias gcm="git commit -m"

# Git bare repository
#alias bare='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Misc
alias cat="bat"
alias vim="nvim"
alias clear="clear && colorscript -e zwaves"
alias ls="exa -al --group-directories-first"
alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
# ====== ALIASES END ====== #

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-rust \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-bin-gem-node

### End of Zinit's installer chunk
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

eval "$(starship init zsh)"
#neofetch
colorscript random
