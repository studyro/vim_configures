# Install/Update vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symbol link our vimrc to home directory
ln -s ~/.vim/.vimrc ~/.vimrc 
ln -s ~/.vim/.ctags ~/.ctags
ln -s ~/.vim/.eslintrc ~/.eslintrc

ln -s ~/.vim ~/.config/nvim
ln -s ~/.vim/.nvimrc ~/.config/nvim/init.vim

# Install all Plugins
nvim +PlugInstall +qall
