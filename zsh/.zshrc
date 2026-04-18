# -- Created by newuser for 5.8.1

# -- path
typeset -U path

path+=("$HOME/.cargo/bin")
path+=("$HOME/bin")
path+=("$HOME/.local/bin")
path+=("/usr/local/bin")
path+=("/opt/nvim/")
export PATH

# -- lang
export LANG=ja_JP.UTF-8

# zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
HISTFILESIZE=1000000
SAVEHIST=1000000

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt append_history
setopt correct
setopt extended_glob

# -- general aliases
alias la="ls -a"
alias ll="ls -l"
alias lt="ls -t"
alias l="clear && ls"
alias fd="fdfind"
alias cln="git clone --recursive"
alias g++="g++ -std=c++17 -Wall -Wextra -Wconversion -pedantic"
alias gcc="gcc -std=c99 -Wall -Wextra"

cdroot() {
    dir="$(git rev-parse --show-superproject-working-tree --show-toplevel | head -1)"
    [ -n "$dir" ] && cd "$dir"
    unset dir
}

# -- zsh plugins
if [ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# -- starship
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# -- NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# -- machine-specific config
if [ -f "$HOME/.zshrc.local" ]; then
    source "$HOME/.zshrc.local"
fi
