# Created by newuser for 5.8.1
# If you come from bash you might have to change your $PATH.
# export PATH=$PATH:$HOME/.robotech/bin:$HOME/.robotech/flatbuffers/bin:$HOME/.robotech/grpc/bin:$HOME/satellite/build:/home/robotech/.local/bin
# export CPATH=/usr/include/eigen3

export PATH=$PATH:$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:/home/tota/opt/tdf/target/release/:/usr/local/bin:/home/tota/opt/qcad-3.30.1-trial-linux-qt5.14-x86_64:/home/tota/.local/bin/oritool:$HOME/Robotech/control/satellite/build:$HOME/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin:$HOME/RoboTech/control/satellite/build:$HOME/Downloads/amap.32.ubuntu2104.x64.GTK


export SATELLITE_ECAT_IFNAME_1='eth1'

export LANG=ja_JP.UTF-8

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

# export cdpath=(~/firmware/ongoing/ ~/firmware/ref/ ~/robotech_win/ ~)

alias ei="eza --icons --git"
alias ea="eza -a --icons --git"
alias ee="eza -aahl --icons --git"
alias et="eza -T -L 3 -a -I 'node_modules|.git|.cache' --icons"
alias eta="eza -T -a -I 'node_modules|.git|.cache' --color=always --icons | less -r"
alias ls=ei
alias la=ea
alias ll=ee
alias lt=et
alias lta=eta
alias l="clear && ls"

alias fd="fdfind"

alias cln="git clone --recursive"

eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias g++="g++ -std=c++17 -Wall -Wextra -Wconversion -pedantic"
alias gcc="gcc -std=c99 -Wall -Wextra"

cdroot() {
    dir="$(git rev-parse --show-superproject-working-tree --show-toplevel | head -1)"
    [ -n "$dir" ] && cd "$dir"
    unset dir
}
ide(){
  tmux split-window -v -p 25 #ウィンドウを垂直に分割し、新しいペインを作成
  tmux  split-window -h -p 50 #新しく作成されたペインをさらに水平に分割
}

alias nyc="sudo -E nyan_checker"
alias nic="sudo -E nyan_id_rewrite -c"
alias nil="sudo -E nyan_id_rewrite -l"
alias nee="sudo -E nyan_eepromtool 1 -w"
alias nfu="sudo -E nyan_fw_update"
alias _nyc="sudo -E ~/RoboTech/etc/bin/nyan_checker"
alias _nfu="sudo -E ~/RoboTech/etc/bin/nyan_fw_update"
alias _nee="sudo -E ~/RoboTech/etc/bin/nyan_eepromtool"
alias _net="sudo -E ~/RoboTech/etc/bin/nyan_error_test"
alias _nic="sudo -E  ~/RoboTech/etc/bin/nyan_id_rewrite -c"
alias _nil="sudo -E  ~/RoboTech/etc/bin/nyan_id_rewrite -l"

alias code="code --disable-gpu"


nir() {
    sudo -E nyan_id_rewrite -t $1 -k $2 -i $3
}

_nir() {
    sudo -E ~/RoboTech/etc/bin/nyan_id_rewrite -t $1 -k $2 -i $3
}


alias mat="matlab -softwareopengl"

export IS_SIM=ON
export CC=/usr/bin/clang-17
export CXX=/usr/bin/clang++-17

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# source /tools/Xilinx/Vivado/2024.2/settings64.sh

