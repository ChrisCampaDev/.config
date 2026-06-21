if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
end

# Initialize tools
starship init fish | source
zoxide init fish | source
atuin init fish | source
fzf --fish | source

set -x PATH $HOME/.cargo/bin $PATH

Carapace completions
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'

if not test -d ~/.config/fish/completions
    mkdir -p ~/.config/fish/completions
end

if not test -f ~/.config/fish/completions/.initialized
    if not test -d ~/.config/fish/completions
        mkdir -p ~/.config/fish/completions
    end
    carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish
    touch ~/.config/fish/completions/.initialized
end

carapace _carapace | source

set -g fish_greeting ""

Enable vi mode
fish_vi_key_bindings

# Set nvim as default editor for opencode and other tools
set -gx EDITOR nvim
set -gx VISUAL nvim

## alias
alias ls='ls --color=auto'
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim (fzf --preview="bat --theme=gruvbox-dark --color=always {}")'
alias zed='zeditor .'

set -l foreground F3F6F9 normal
set -l selection 263356 normal
set -l comment 8394A3 brblack
set -l red CB7C94 red
set -l orange DEBA87 orange
set -l yellow FFE066 yellow
set -l green B7CC85 green
set -l purple A3B5D6 purple
set -l cyan 7AA89F cyan
set -l pink FF8DD7 magenta

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
clear

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

fish_add_path /home/chris/.spicetify
