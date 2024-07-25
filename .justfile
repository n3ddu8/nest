build-environment:
  apk update

  apk add \
    github-cli \
    neovim \
    npm \
    openssh \
    shadow \
    tmux \
    zsh

  chsh root -s /bin/zsh

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # WARNING: this will overwrite any existing dot files
  wget https://raw.githubusercontent.com/n3ddu8/zsh-config/main/zshrc
  mv zshrc ~/.zshrc
  wget https://raw.githubusercontent.com/n3ddu8/zsh-config/main/p10k.zsh
  mv p10k.zsh ~/.p10k.zsh
  wget https://raw.githubusercontent.com/n3ddu8/tmux-config/main/tmux.conf
  mv tmux.conf ~/.tmux.conf

  # WARNING: this will overwrite any existing nvim config
  git clone https://github.com/n3ddu8/nvim-config.git $HOME/.config/nvim

  git config --global core.editor nvim

