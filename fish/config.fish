set -gx PATH /home/kishore/.local/bin $PATH
set fish_greeting
#### my aliases ####
alias cd='z'
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias ls='eza --icons -lah --group-directories-first'
alias weather='curl wttr.in/madurai'
alias open='xdg-open'
alias publicip='curl -4 ifconfig.me'
alias cat='bat'
alias v='nvim'
alias zshrc='nvim $HOME/.zshrc'
alias bashrc='nvim $HOME/.bashrc'
alias fishrc='nvim $HOME/.config/fish/config.fish'
alias tmuxrc='nvim $HOME/.tmux.conf'
alias vimrc='nvim $HOME/.vimrc'
alias config='nvim $HOME/.config/'
alias tn='tmux new-session -s main nvim .'

## startup script##
if not set -q TMUX
  mystartupscript
end
#nerdfetch
## starship ###

### fzf ###
# Set up fzf key bindings and fuzzy completion

set -gx  FZF_DEFAULT_OPTS " \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4"
set -gx BAT_THEME "Catppuccin Mocha"
set -gx EDITOR "nvim"
set -gx TERMINAL "kitty"
set -gx QT_QPA_PLATFORMTHEME "qt6ct"

# extract any files
function extract
    if test (count $argv) -eq 0
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|.zlib|.cso|.zst>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
        return
    end

    for n in $argv
        if not test -f "$n"
            echo "'$n' - file doesn't exist"
            return 1
        end

        set -l ext (string match -r '.*\.(.+)' -- "$n" | tail -n 1)
        
        switch "$ext"
            case 'cbt' 'tar.bz2' 'tar.gz' 'tar.xz' 'tbz2' 'tgz' 'txz' 'tar'
                tar zxvf "$n"
            case 'lzma'
                unlzma ./"$n"
            case 'bz2'
                bunzip2 ./"$n"
            case 'cbr' 'rar'
                unrar x -ad ./"$n"
            case 'gz'
                gunzip ./"$n"
            case 'cbz' 'epub' 'zip'
                unzip ./"$n"
            case 'z'
                uncompress ./"$n"
            case '7z' 'apk' 'arj' 'cab' 'cb7' 'chm' 'deb' 'iso' 'lzh' 'msi' 'pkg' 'rpm' 'udf' 'wim' 'xar' 'vhd'
                7z x ./"$n"
            case 'xz'
                unxz ./"$n"
            case 'exe'
                cabextract ./"$n"
            case 'cpio'
                cpio -id < ./"$n"
            case 'cba' 'ace'
                unace x ./"$n"
            case 'zpaq'
                zpaq x ./"$n"
            case 'arc'
                arc e ./"$n"
            case 'cso'
                ciso 0 ./"$n" ./"$n.iso"; and extract "$n.iso"; and rm -f "$n"
            case 'zlib'
                zlib-flate -uncompress < ./"$n" > ./"$n.tmp"; and mv ./"$n.tmp" ./(string replace -r '\.zlib$' '' -- "$n"); and rm -f "$n"
            case 'dmg'
                hdiutil mount ./"$n" -mountpoint "./$n.mounted"
            case 'tar.zst'
                tar -I zstd -xvf ./"$n"
            case 'zst'
                zstd -d ./"$n"
            case '*'
                echo "extract: '$n' - unknown archive method"
                return 1
        end
    end
end
fzf --fish | source
starship init fish | source
zoxide init fish | source
