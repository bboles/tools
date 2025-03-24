#!/usr/bin/env bash
BASE_DIR="$HOME/src/github.com"

cd "${BASE_DIR}" || (
  echo "Unable to access directory ~/src/github.com. Exiting."
  exit 1
)

git clone git@github.com:unixorn/fzf-zsh-plugin.git unixorn/fzf-zsh-plugin
git clone git@github.com:z-shell/zui.git z-shell/zui
git clone git@github.com:z-shell/zbrowse.git z-shell/zbrowse

brew install zsh \
  zsh-vi-mode \
  zsh-syntax-highlighting \
  zsh-autosuggestions \
  zsh-completions \
  zsh-navigation-tools
