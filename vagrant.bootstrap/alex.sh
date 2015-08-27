#!/usr/bin/env zsh

# ---------------------------------------
# CLI
# ---------------------------------------
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# ---------------------------------------
# Projects
# ---------------------------------------
mkdir -p $HOME/projects

# ---------------------------------------
# dotfiles
# ---------------------------------------
git clone https://github.com/xelau/dotfiles.git $HOME/projects/dotfiles

# ---------------------------------------
# Zshrc
# ---------------------------------------
cat >>! $HOME/.zshrc <<'DELIM'

# zshrc.d
if [ -d $HOME/projects/dotfiles/.zshrc.d ]; then
  for file in $HOME/projects/dotfiles/.zshrc.d/.*; do
    source $file
  done
fi
DELIM
source $HOME/.zshrc

# ---------------------------------------
# Chruby
# ---------------------------------------
cat >>! $HOME/.zshrc <<'DELIM'

# Chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.1.3
DELIM
source $HOME/.zshrc

# ---------------------------------------
# Vim
# ---------------------------------------
curl -Lo- https://bit.ly/janus-bootstrap | bash
ln -s $HOME/projects/dotfiles/.vimrc.before ~/.vimrc.before
ln -s $HOME/projects/dotfiles/.vimrc.after ~/.vimrc.after

# ---------------------------------------
# Postgresql
# ---------------------------------------
ln -s $HOME/projects/dotfiles/.psqlrc ~/.psqlrc

# ---------------------------------------
# Tmux
# ---------------------------------------

# ---------------------------------------
# Git
# ---------------------------------------
ln -s $HOME/projects/dotfiles/.gitconfig ~/.gitconfig

# ---------------------------------------
# Gemrc
# ---------------------------------------
ln -s $HOME/projects/dotfiles/.gemrc ~/.gemrc
