sudo apt-get install -y ack-grep ctags # required by ack.vim and taglist

pushd ~
mv .vim .vim.bak
mv .vimrc .vimrc.bak
mv .zshrc .zshrc.bak
mv .tmux.conf .tmux.conf.bak
ln -s .dotfiles/.vim .vim
ln -s .dotfiles/.vimrc .vimrc
ln -s .dotfiles/.zshrc .zshrc
ln -s .dotfiles/.tmux.conf .tmux.conf
rm .vim/bundle/snipmate/snippets/*
popd
