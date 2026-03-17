#!/usr/bin/env bash
set -euo pipefail

pushd ~ > /dev/null

mv .vim .vim.bak 2>/dev/null || true
mv .vimrc .vimrc.bak 2>/dev/null || true
mv .zshrc .zshrc.bak 2>/dev/null || true
mv .tmux.conf .tmux.conf.bak 2>/dev/null || true

ln -sf .dotfiles/.vim .vim
ln -sf .dotfiles/.vimrc .vimrc
ln -sf .dotfiles/.zshrc.mac .zshrc
ln -sf .dotfiles/.tmux.conf .tmux.conf

popd > /dev/null

mkdir -p "$HOME/.local/bin"
cp bin/findcol "$HOME/.local/bin/findcol" 2>/dev/null || true
