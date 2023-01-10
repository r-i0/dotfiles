alias c="clear"
alias ls="exa --icons"
alias pb="pbcopy"
alias t="translate"

alias python="python3"

# git
alias gitlog='git log --all --graph --pretty=format:"%Cred%h%Creset %C(bold blue)%an%Creset :%C(yellow)%d%Creset %s %Cgreen(%cr) %Creset" --abbrev-commit'
alias gsb='git status -sb'
alias lg='lazygit'

# codeコマンド
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

