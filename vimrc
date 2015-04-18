
" Settings
set nocompatible
set backupdir=~/.vim_backup//
set directory=~/.vim_swp//
set relativenumber
set expandtab
set laststatus=2
set incsearch
set autoindent
set showcmd
set tabstop=2
set shiftwidth=2
set numberwidth=4
set ignorecase
set smartcase
set tags=./tags;
set foldenable
set foldmethod=manual
set mouse=a
set backspace=indent,eol,start
set nowrap
set cursorline

set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t
set hlsearch
set lines=999 columns=9999

" Set up NeoBundle
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch "Shougo/neobundle.vim"

" My bundles
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle "Lokaltog/vim-distinguished"
NeoBundle "bling/vim-airline"

NeoBundle "flazz/vim-colorschemes"
NeoBundle "tpope/vim-fugitive"
NeoBundle "tpope/vim-git"
NeoBundle "tpope/vim-surround"
NeoBundle "pangloss/vim-javascript"
NeoBundle "garbas/vim-snipmate"
NeoBundle "kien/ctrlp.vim"
NeoBundle "mileszs/ack.vim"
NeoBundle "wojtekgalaj/vim-snippets"
NeoBundle "burnettk/vim-angular"
NeoBundle "joequery/Stupid-EasyMotion"
NeoBundle "rizzatti/dash.vim"
NeoBundle "sickill/vim-pasta"
NeoBundle "ervandew/supertab"
NeoBundle "vim-scripts/ZoomWin"
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "scrooloose/nerdtree"
NeoBundle "tomtom/tlib_vim"
NeoBundle "bling/vim-bufferline"
NeoBundle "Raimondi/delimitMate"
NeoBundle "scrooloose/syntastic"
NeoBundle "tomtom/tcomment_vim"

call neobundle#end()

filetyp plugin indent on

NeoBundleCheck

colorscheme monokai

syntax on

if has("gui_running")
  set guifont=Ubuntu\ Mono\ derivative\ Powerline:h19
  set guioptions-=R
  set guioptions-=L
endif

highlight ColorColumn ctermbg=lightgray

" Automatically load .vimrc source when saved
autocmd BufWritePost .vimrc source $MYVIMRC

" Functions
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Key Bindings
" let mapleader = ","
inoremap kj <Esc>
nnoremap <Leader>n :call NumberToggle()<cr>
nnoremap <Leader>m :set modifiable<cr>
nnoremap <Leader>j :%!python -m json.tool<cr>


" Clean trailing whitespace
au BufWritePre * :%s/\s\+$//e

" Switch buffers
nnoremap <C-n> :bn<cr>
nnoremap <C-b> :bp<cr>
nnoremap <C-d> :bd<cr>


" Split windows
nnoremap <Leader>s :sp<cr><C-w><C-w>
nnoremap <Leader>v :vsp<cr><C-w><C-w>

" Easily switch between windows
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-l> :wincmd l<cr>

" Exit insert mode and write file
inoremap <leader>w <Esc> :w<cr>
nnoremap <leader>w :w<cr>

" NERDTree
let NERDTreeShowHidden=1
nnoremap <leader><Tab> :NERDTreeToggle<cr>

" CtrlP
" 'c' The directory of current file
" 'r' nearest ancestor with .git
let g:ctrlp_working_path_mode='r'

" NerdTree
set encoding=utf-8

" VimPasta
let g:pasta_enabled_filetypes = ['javascript', 'css', 'sh']

" Prevent cursor from moving after exiting insert mode
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif"


let g:airline_powerline_fonts = 1
" No lag in airline with this.
set ttimeoutlen=50

" syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = []


"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

:autocmd InsertEnter,InsertLeave * set cul!
