#
install_brew () {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  brew install google-chrome \
    firefox \
    slack \
    notion \
    visual-studio-code \
    bat \
    ripgrep \
    go \
    jq \
    exa \
    fzf \
    z \
    gh \
    neovim \
    node \
    yarn \
    koekeishiya/formulae/yabai \
    koekeishiya/formulae/skhd \

  brew install --cask docker
  brew install --cask wez/wezterm/wezterm
}

ln -is ${PWD}/zsh/zshrc ~/.zshrc
ln -is ${PWD}/yabai/yabairc ~/.yabairc
ln -is ${PWD}/yabai/skhdrc ~/.skhdrc

install_brew
