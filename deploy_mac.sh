brew install ack  # required by ack.vim

pushd ~
mv .vim .vim.bak
mv .vimrc .vimrc.bak
mv .zshrc .zshrc.bak
mv .tmux.conf .tmux.conf.bak
ln -s .dotfiles/.vim .vim
ln -s .dotfiles/.vimrc .vimrc
ln -s .dotfiles/.zshrc.mac .zshrc
ln -s .dotfiles/.tmux.conf .tmux.conf
popd
