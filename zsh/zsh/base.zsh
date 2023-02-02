# 補完を有効にする
autoload -U compinit
compinit -u

# 補完メッセージを読みやすくする
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=1

#shell options（シェルオプション）
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
DIRSTACKSIZE=100
setopt NO_CASE_GLOB
setopt CORRECT
setopt CORRECT_ALL
setopt SHARE_HISTORY
setopt APPEND_HISTORY  #デフォルトで有効。省略可能
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
setopt NO_BEEP
