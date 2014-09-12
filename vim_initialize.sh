# symbol link our vimrc to home directory
ln -s ~/.vimrc ~/.vim/.vimrc 

# Install all Plugins
vim +PluginInstall +qall
