set -gx fish_greeting 

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.deno/bin
fish_add_path $HOME/meh
fish_add_path $HOME/meh/flutter/bin
fish_add_path $HOME/meh/v
fish_add_path $HOME/.config/yarn/global/node_modules/.bin
fish_add_path $HOME/.sdkman/candidates/kotlin/1.8.0/bin
fish_add_path $HOME/meh/emsdk
fish_add_path $HOME/meh/emsdk/upstream/emscripten
fish_add_path $HOME/.dotnet/tools
fish_add_path $HOME/meh/flutter/bin

set -gx GPG_TTY (tty)
set -gx hydro_symbol_prompt ❄️
set -gx OOO_FORCE_DESKTOP "gnome" libreoffice
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx ANDROID_NDK_HOME /home/palash/Android/Sdk/ndk/25.1.8937393
set -gx CHROME_EXECUTABLE /usr/bin/chromium
set -gx DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
alias vim nvim
alias vi nvim
alias sshh "kitty +kitten ssh"
alias lstat "stat -c \"%a %n\""
alias clipnur "cargo clippy -- -W clippy::nursery"
alias emsdk_setup ". home/palash/meh/emsdk/emsdk_env.fish"

fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path /usr/local/go/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin
fish_add_path $ANDROID_HOME/tools 


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#status is-interactive && eval /home/palash/mambaforge/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

function runpio
	source ~/.platformio/penv/bin/activate.fish
end

function makelight
	# Colorscheme: Tomorrow
	set -gx fish_color_normal normal
	set -gx fish_color_command 8959a8
	set -gx fish_color_quote 718c00
	set -gx fish_color_redirection 3e999f
	set -gx fish_color_end 8959a8
	set -gx fish_color_error c82829
	set -gx fish_color_param 4271ae
	set -gx fish_color_comment eab700
	set -gx fish_color_match --background=brblue
	set -gx fish_color_selection white --bold --background=brblack
	set -gx fish_color_search_match bryellow --background=brblack
	set -gx fish_color_history_current --bold
	set -gx fish_color_operator 00a6b2
	set -gx fish_color_escape 00a6b2
	set -gx fish_color_cwd green
	set -gx fish_color_cwd_root red
	set -gx fish_color_valid_path --underline
	set -gx fish_color_autosuggestion 8e908c
	set -gx fish_color_user brgreen
	set -gx fish_color_host normal
	set -gx fish_color_cancel --reverse
	set -gx fish_pager_color_prefix normal --bold --underline
	set -gx fish_pager_color_progress brwhite --background=cyan
	set -gx fish_pager_color_completion normal
	set -gx fish_pager_color_description B3A06D
	set -gx fish_pager_color_selected_background --background=brblack
	set -gx fish_pager_color_secondary_background 
	set -gx fish_pager_color_selected_prefix 
	set -gx fish_pager_color_secondary_prefix 
	set -gx fish_color_keyword 
	set -gx fish_pager_color_selected_completion 
	set -gx fish_color_host_remote 
	set -gx fish_pager_color_background 
	set -gx fish_pager_color_secondary_completion 
	set -gx fish_color_option 
	set -gx fish_pager_color_selected_description 
	set -gx fish_pager_color_secondary_description
end

#makelight
