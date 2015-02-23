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

# install powerline
sudo apt-get install -y socat # dependencies
sudo pip install powerline-status psutil
# config fonts for powerline
git clone https://github.com/powerline/fonts
./fonts/install.sh
rm -rf fonts
# copy our theme
export POWERLINE_ROOT=/usr/local/lib/python2.7/dist-packages/powerline
sudo cp $POWERLINE_ROOT/config_files/themes/tmux/default.json $POWERLINE_ROOT/config_files/themes/tmux/default.json.bak 
sudo cp grapeot.json $POWERLINE_ROOT/config_files/themes/tmux/default.json 
