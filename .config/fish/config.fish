set -U fish_greeting 

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/meh

set --global GPG_TTY (tty)
set --global hydro_symbol_prompt 🐨
set --global OOO_FORCE_DESKTOP "gnome" libreoffice
set --global GTK_IM_MODULE ibus
set --global QT_IM_MODULE ibus
set --global XMODIFIERS @im=ibus


alias vim nvim
alias v nvim
alias sshh "kitty +kitten ssh"
alias lstat "stat -c \"%a %n\""

fish_add_path /usr/local/go/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#status is-interactive && eval /home/palash/mambaforge/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

