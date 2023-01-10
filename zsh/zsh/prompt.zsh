function prompt {
  brace_start='%{'
  brace_end='%}'

  back_light_blue='\e[30;48;5;031m'

  text_white='\e[38;5;255m'
  text_light_blue='\e[38;5;031m'
  text_cyan='\e[38;5;087m'

  reset='%{\e[0m%}'

  triangle='\uE0B0'
  allow='\uf101'

  dir_back_color="${brace_start}${back_light_blue}${brace_end}"
  dir_text_color="${brace_start}${text_white}${brace_end}"
  triangle_color="${brace_start}${text_light_blue}${brace_end}"
  dir="${dir_back_color}${triangle}${dir_text_color} %~${reset}${triangle_color}${triangle}${reset}"

  allow_color="${brace_start}${text_cyan}${brace_end}"
  allow_with_color="${allow_color}${allow}${reset}"

  echo "${dir} \n${allow_with_color} "
}

# git ブランチ名を色付きで表示させる
function git-current-branch {
  branch='\ue0a0'
  green='%{\e[38;5;114m%}'
  red='%{\e[38;5;001m%}'
  yellow='%{\e[38;5;227m%}'
  blue='%{\e[38;5;033m%}'
  reset='%{\e[0m%}'

  # ブランチマーク
  if ! git rev-parse 2> /dev/null; then
    # git 管理されていないディレクトリは何も返さない
    return
  fi

  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`

  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${green}${branch}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${red}${branch}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="${red}${branch}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="${yellow}${branch}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "${red}${branch}!(no branch)${reset}"
    return
  else
    # 上記以外の状態の場合
    branch_status="${blue}${branch}"
  fi

  # ブランチ名を色付きで表示する
  echo "${branch_status}${branch_name}${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

PROMPT=`prompt`
RPROMPT='`git-current-branch`'

# コマンドの実行ごとに改行
function precmd() {
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
    NEW_LINE_BEFORE_PROMPT=1
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
    echo ""
  fi
}
