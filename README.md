# Steps to deploy
- clone to your home directory
  ```
  cd ~
  git clone https://github.com/Huang-Tsu/my_.vimrc.git
  ```
- cp .vimrc to your home dir
  ```
  cp my_.vimrc/.vimrc ~/.vimrc
  ```
- Install vim-plug(in unix)
  ```
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```
- download nodejs
  ```
  sudo curl -sL install-node.vercel.app/lts | sudo bash
  ```
- open vim, and type `:PlugInstall` to install plugin
