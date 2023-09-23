	""plug-in
	"automatically download plug management
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.	
call plug#begin('~/.vim/plugged')

" Declare the list of plugins
	
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"自動調和背景與配色的關係
"Plug 'junegunn/seoul256.vim'

"讓ctrl-d變滑順
"Plug 'psliwka/vim-smoothie'

Plug 'Preservim/nerdtree'

"color scheme
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'Huang-Tsu/vim-syntax-extra'
"Plug 'drewtempelmeyer/palenight.vim'

"Plug 'airblade/vim-gitgutter'

	"highlight yank
Plug 'machakann/vim-highlightedyank'

	"airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

	"color scheme for c++ & c
Plug 'bfrg/vim-cpp-modern'

	"indent_line
Plug 'Yggdroot/indentLine'

  "easy comment
"Plug 'preservim/nerdcommenter'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
	
"colo seoul256
"colo seoul256-light


	"airline
"let g:airline#extensions#tabline#enabled = 1
""let g:airline#extensions#tabline#left_sep = ' '
""let g:airline#extensions#tabline#left_alt_sep = '>>'
"let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
"let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
"let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
"let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
"let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
"let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)



syntax on
set cindent
filetype on
set novisualbell
set visualbell t_vb=
set nobackup
set nocompatible
"set runtimepath=$VIMRUNTIME "會關閉自己定義的腳本(插件管理)
set background=dark
set hlsearch
set incsearch
set scroll=11
set ignorecase
set smartcase
set autoindent
au BufEnter * set fo-=c fo-=r fo-=o "disable auto comment when press 'o' src:shorturl.at/fkAH5"
set cino=g1	"讓class裡的public等字往後縮一格(遵照google style) source:https://reurl.cc/d2GYRV
set showcmd
set ruler
set showmode
"highlight SpecialKey ctermfg=240 guifg=#585858
"highlight NonText ctermfg=240 guifg=#585858
set shiftround
":hi LineNr cterm=bold ctermfg=LightGrey ctermbg=NONE	"行號粗體
":hi ColorColumn ctermbg=0 guibg=lightgrey
:inoremap {<CR> {<CR>}<Esc>ko
set shiftwidth=2	"自動縮排長度
set tabstop=2
set nu rnu
set cursorline
set mouse=a
"set cursorcolumn
"hi CursorColumn cterm=none ctermbg=238 ctermfg=none
"hi CursorLine cterm=none ctermbg=238 ctermfg=none
"hi Comment ctermfg=lightyellow
set viminfo='1000
	"Press <F9> to run C
map <F9> :w <CR> :!echo -e "(running \"%<\")\n" && gcc % -msse -lrt -Wall -g -lm -fsanitize=undefined -fsanitize=address -o %< &&./%< <CR>
	"-lm is for sqrt()
	"-lrt for clock_gettime()
	"-msse is for _mm_add_ps()
"map <F9> :w <CR> :!echo -e "(running \"%\")\n" && gcc % -g -fsanitize=undefined -fsanitize=leak -fsanitize=address && ./a.out <CR>
	"Press F8 to run C++
map <F8> :w <CR> :!echo -e "(running \"%<\")\n" && g++ % -Wall -g -lm -fsanitize=undefined -fsanitize=address -o %< &&./%< <CR>
"the upper can be refered to: https://stackoverflow.com/questions/2627886/how-do-i-run-a-c-program-from-vim/2650621

map <F7> :w <CR> :!echo -e "(running \"%\")\n" && python3 % <CR>


" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
"let g:cpp_simple_highlight = 1

" Enable highlighting of C++11 attributes
"let g:cpp_attributes_highlight = 0

" Highlight struct/class member variables (affects both C and C++ files)
"let g:cpp_member_highlight = 1


	"for colroscheme : deep-space
set termguicolors
colorscheme deep-space
let g:deepspace_italics=1
let g:airline_theme='deep_space'


	"option for gruvbox(vim_syntax)
"autocmd vimenter * ++nested colorscheme gruvbox
"let g:gruvbox_bold = 1
"let g:gruvbox_italic=1
"let g:gruvbox_italicize_comments=1
"let g:gruvbox_transparent_bg = 1
"let g:gruvbox_italicize_strings = 1
"colorscheme gruvbox

let g:smoothie_enabled=1
"let g:smoothie_experimental_mappings=1	"This is experimental option. If there is bug, turn off it.

	"concerning  NERDTree
nnoremap <F5> :NERDTree<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

  "for debugging in vim   //for help, see:https://www.dannyadam.com/blog/2019/05/debugging-in-vim/
packadd termdebug       "auto add pack
let g:termdebug_wide=1  "let sources code in right
  "set <F10> as shortcut of running Termdebug
map <F10> :Termdebug %<<CR>

	"for vim_gitgutter
"set updatetime=100 "單位是ms

	"about highlight_yank
let g:highlightedyank_highlight_duration = -1  "yank will always open

	"for ctags
set tags=tags
set autochdir
	"for taglist
"let Tlist_Compact_Format=1 "Hide help menu
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Auto_Open = 0     " 讓 Tlist 自動開啟
let Tlist_Show_One_File = 1             " 不同時顯示多個文件的tag，只顯示當前文件的
let Tlist_Exit_OnlyWindow = 1           " 如果taglist窗口是最後一個窗口，則退出vim
let Tlist_Use_Right_Window = 1          " 在右側窗口中顯示taglist窗口
let Tlist_Process_File_Always=1 				" 即時更新tags
let Tlist_File_Fold_Auto_Close = 1 			" 自動摺疊
nnoremap <silent> <F4> :TlistToggle<CR> " F8 為開啟/關閉 Tlist 的快速鍵

	"options for vim-cpp-modern
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 0

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

	"for line_indent
"let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
set expandtab

	"set vim without background(transparent)
"hi Normal guibg=NONE ctermbg=NONE
"highlight NonText ctermbg=none
"hi Normal ctermbg=none

  "copy entire file to system clipboard
noremap <F12> :%y+<CR>
"To use this in wsl, First install package "vim-gtk"

  "for nerdcommenter
:let mapleader = ","

"configuration for coc
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-pyright',
  \ ]
"end of configuration of coc
