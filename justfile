build-environment:
  apk update

  apk add \
    zsh \
    tmux \
    neovim \
    npm \
    github-cli

  usermod -s /bin/zsh $USER

  curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && \
      sudo install -c -m 0755 devpod /usr/local/bin && \
      rm -f devpod

  if [ ! -l "/etc/localtime" ]; then \
  ln -s /usr/share/zoneinfo/Europe/London /etc/localtime; \
  fi
  
  if [ ! -d "$HOME/.oh-my-zsh" ]; then \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
  git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi

  # WARNING: this will overwrite any existing zshrc file
  git clone https://github.com/n3ddu8/zsh-config.git $HOME
  cp $HOME/zsh-config/zshrc $HOME/.zshrc
  rm -rf $HOME/zsh-config

  if [ ! -d "$HOME/.config/nvim" ]; then \
  git clone https://github.com/n3ddu8/nvim-config.git $HOME/.config/nvim
  fi

  if [ ! -d "$HOME/.tmux.conf" ]; then \
  git clone https://github.com/n3ddu8/tmux-config.git $HOME
  cp $HOME/tmux-config/tmux.conf $HOME/.tmux.conf
  rm -rf $HOME/tmux-config

  # need to populate the GH_TOKEN environment variable with a GitHub API authentication token w/o including the token in a repo?!
  # gh extension install https://github.com/nektos/gh-act

