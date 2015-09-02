# Install/Update vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symbol link our vimrc to home directory
ln -s ~/.vim/.vimrc ~/.vimrc 

# Install all Plugins
vim +PlugInstall +qall
