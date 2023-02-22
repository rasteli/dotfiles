# To be added to PATH
set local_bin "$HOME/.local/bin"
set java "/usr/local/lib/jre1.8/bin"
set menu_scripts "$HOME/.local/bin/menu"
#set nodejs "/usr/lib/nodejs/bin"

### ADDING TO THE PATH
# First line removes the path, second line sets it. Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $local_bin $menu_scripts $java $fish_user_paths

### EXPORTS
set fish_greeting                                   # Supresses fish's greeting message.
set EDITOR "nvim"                                   # Sets default editor to neovim.
set FISH_CONFIG "$HOME/.config/fish"                # Path to fish's configuration files.
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"   # Sets bat as manpager (manual reader).
set PGDATA "$HOME/.local/share/postgresql"          # Postgresql data directory.

### AUTOCOMPLETE AND HIGHLIGHT COLORS
set fish_color_param '#8be9fd'
set fish_color_quote '#f1fa8c'
set fish_color_error '#ff6c6b'
set fish_color_normal '#8be9fd'
set fish_color_command '#50fa7b'
set fish_color_autosuggestion '#6272a4'

### NPM GLOBAL PACKAGES LOCATION
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH

### KEY MODE (vi or default)
function fish_user_key_bindings
  fish_vi_key_bindings
  # fish_default_key_bindings
end

### REMOVE ALL
function rmall -d "Removes all files matching the given name inside the given directory."
  command find "$argv[1]" -name "$argv[2]" -exec rm -rf {} \;
end

### SPARK
source "$FISH_CONFIG/functions/spark.fish"

### ARCHIVE EXTRACTION
source "$FISH_CONFIG/functions/ex.fish"

# ====== ALIASES START ====== #
# \x1b[2J   <- clears tty
# \x1b[1;1H <- goes to (1, 1) (start)
alias clear='echo -en "\x1b[2J\x1b[1;1H" ; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

### Navigation
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."

### Ask for confirmation
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

### Package management
alias pacmansyu="sudo pacman -Syu"                # Update all pacman packages
alias cleancache="sudo paccache -ruk0"            # Remove uninstalled packages cache
alias cleanup="sudo pacman -Rns (pacman -Qdtq)"   # Remove orphaned packages

### Git start
#alias gps="git push"
#alias gpl="git pull"
#alias gcl="git clone"
#alias gck="git checkout"
#alias gckm="git checkout master"
#alias gckb="git checkout -b"
#alias gst="git status -sb"
#alias gsf="git show --name-only"
#alias glg="git log --pretty=format:'%Cred%h%Creset %C(bold)%cr%Creset %Cgreen<%an>%Creset %s' --max-count=30"
#alias gc="git commit"
#alias gaa="git add ."
#alias gau="git add -u"
#alias gcm="git commit -m"
#alias gr="git remote -v"
#alias gra="git remote add"
#alias grr="git remote remove"
#alias nextts="git clone git@github.com:rasteli/NextTS.git"  # Boilerplate for NextJS with TypeScript
### Git end

### Emacs
alias emacs="emacsclient -c -a 'emacs'"

### Postgresql
alias startpg="pg_ctl start -D ~/.local/share/postgresql/ -l ~/.local/share/postgresql/logfile"
alias psql="psql -h /tmp -d"

### Doom Emacs
alias dooms="~/.emacs.d/bin/doom sync"
alias doomb="~/.emacs.d/bin/doom build"
alias doomd="~/.emacs.d/bin/doom doctor"
alias doomu="~/.emacs.d/bin/doom upgrade"

### Git bare repository
alias bare='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#### Misc
alias cat="bat"
alias vim="nvim"
#alias clear="clear && colorscript -e zwaves"
alias ls="exa -al --group-directories-first"
alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
# ====== ALIASES END ====== #

# Randomly selecting a color script.
colorscript random
# Initializing starship prompt.
starship init fish | source
#source ~/.cache/wal/colors.fish
