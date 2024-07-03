build-environment:
  apk update

  apk add \
    zsh \
    tmux \
    neovim \
    github-cli

  if [ ! -l "/etc/localtime" ]; then \
  ln -s /usr/share/zoneinfo/Europe/London /etc/localtime; \
  fi
  
  if [ ! -d "$HOME/.oh-my-zsh" ]; then \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
  chsh -s /bin/zsh
  fi

  # need to populate the GH_TOKEN environment variable with a GitHub API authentication token w/o including the token in a repo?!
  # gh extension install https://github.com/nektos/gh-act
