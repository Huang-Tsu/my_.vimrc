# Steps to deploy

## 1. Clone this repo to your home directory
```bash
cd ~
git clone https://github.com/Huang-Tsu/my_.vimrc.git
```

## 2. Copy `.vimrc` to your home directory
```bash
cp my_.vimrc/.vimrc ~/.vimrc
```

## 3. Install vim-plug (Unix/Linux)
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## 4. Install Node.js
Required for `coc.nvim`.

```bash
sudo curl -sL install-node.vercel.app/lts | sudo bash
```

## 5. Install Universal Ctags
Required for `preservim/tagbar`.

### Ubuntu / Debian
```bash
sudo apt update
sudo apt install universal-ctags
```

Check installation:
```bash
ctags --version
```

You should see `Universal Ctags` in the output.

## 6. Open Vim and install plugins
```vim
:PlugInstall
```

## 7. Optional: useful shortcuts
- `<F4>`: toggle Tagbar
- `<F5>`: toggle NERDTree
- `<F7>`: run Python file
- `<F8>`: compile and run C++
- `<F9>`: compile and run C
- `<F10>`: run Termdebug

---

# Notes

## Tagbar
`preservim/tagbar` depends on `ctags`, so make sure `Universal Ctags` is installed.

If Tagbar cannot find `ctags`, check:
```bash
which ctags
```

If needed, set the ctags path manually in `.vimrc`:
```vim
let g:tagbar_ctags_bin = '/usr/bin/ctags'
```

## coc.nvim
`coc.nvim` requires Node.js. If completion does not work, check:
```bash
node -v
npm -v
```
