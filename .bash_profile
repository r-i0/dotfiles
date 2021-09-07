export PATH=$HOME/.nodebrew/current/bin:$PATH
reset='\[\e[0m\]'
green='\[\e[32m\]'
red='\[\e[0;31m\]'

PS1="\$("
PS1+="status="\$?"; "
PS1+="if [ \$status -ne 0 ]; then echo \"$red[\$status] $rst\"; fi"
PS1+=")"
PS1+="${green}\s-\v${reset} "
export PS1
