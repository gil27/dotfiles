# Gil's vimfiles


## Plugins

* https://github.com/tpope/vim-pathogen
* https://github.com/scrooloose/nerdtree
* https://github.com/msanders/snipmate.vim
* https://github.com/dalibor/snipmate-snippets
* https://github.com/vim-ruby/vim-ruby
* https://github.com/ecomba/vim-ruby-refactoring
* https://github.com/scrooloose/nerdcommenter

## Installation

```sh
sudo apt-get install vim-gnome # vim with ruby support
sudo apt-get install exuberant-ctags ncurses-term xsel
git clone git://github.com/gil27/vimfiles.git ~/.vim
cd ~/.vim
echo "source ~/.vim/vimrc" > ~/.vimrc
```

### Update

```sh
# Update to newest vimiles
cd ~/.vim
git pull origin master

# Generate documentations for bundled plugins
:Helptags
```
