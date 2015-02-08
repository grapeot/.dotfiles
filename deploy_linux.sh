sudo apt-get install -y ack-grep ctags python-dev # required by ack.vim and taglist and YCM

cd ~
mv .vim .vim.bak
mv .vimrc .vimrc.bak
mv .zshrc .zshrc.bak
mv .tmux.conf .tmux.conf.bak
ln -s .dotfiles/.vim .vim
ln -s .dotfiles/.vimrc .vimrc
ln -s .dotfiles/.zshrc .zshrc
ln -s .dotfiles/.tmux.conf .tmux.conf
cd -
