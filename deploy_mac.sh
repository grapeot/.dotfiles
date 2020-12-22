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

brew install socat coreutils
pip install powerline-status psutil
pip install flake8
export POWERLINE_ROOT=/usr/local/lib/python2.7/site-packages/powerline
cp $POWERLINE_ROOT/config_files/themes/tmux/default.json $POWERLINE_ROOT/config_files/themes/tmux/default.json.bak 
cp grapeot.json $POWERLINE_ROOT/config_files/themes/tmux/default.json 

# copy the utilities
cp bin/findcol /usr/bin
