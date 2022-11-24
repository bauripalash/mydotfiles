set -U fish_greeting 

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/meh
fish_add_path $HOME/meh/flutter/bin
fish_add_path $HOME/meh/v


set -gx GPG_TTY (tty)
set -gx hydro_symbol_prompt 🐨
set -gx OOO_FORCE_DESKTOP "gnome" libreoffice
set -gx GTK_IM_MODULE ibus
set -gx QT_IM_MODULE ibus
set -gx XMODIFIERS @im=ibus
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx ANDROID_NDK_HOME /home/palash/Android/Sdk/ndk/25.1.8937393
set -gx CHROME_EXECUTABLE /usr/bin/chromium

alias vim nvim
alias vi nvim
alias sshh "kitty +kitten ssh"
alias lstat "stat -c \"%a %n\""

fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path /usr/local/go/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin
fish_add_path $ANDROID_HOME/tools 

function avd
    emulator -avd rsz -netspeed full -netdelay none
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#status is-interactive && eval /home/palash/mambaforge/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

