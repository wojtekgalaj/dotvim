
" Settings
set nocompatible
set sh=/bin/bash
set backupdir=~/.vim_backup//
set directory=~/.vim_swp//
set number
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
set guioptions-=T
set guioptions-=r
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


call neobundle#end()

filetyp plugin indent on

NeoBundleCheck

colorscheme distinguished
"colorscheme vividchalk
"colorscheme github
"colorscheme whitebox


" syntax highlighting
"set background=dark
syntax on
"color mango


highlight ColorColumn ctermbg=lightgray

" Automatically load .vimrc source when saved
autocmd BufWritePost .vimrc source $MYVIMRC


" automatically open quickfix window on grep searches
autocmd QuickFixCmdPost *grep* cwindow

au BufNewFile,BufRead *.markdown,*.md setf markdown

if has("gui_running")
  set guifont=Menlo\ Regular:h14
endif


" Functions
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Key Bindings
let mapleader = ","

inoremap kj <Esc>
inoremap <C-c> <Esc>
nnoremap <Leader>n :call NumberToggle()<cr>

" Switch buffers
nnoremap <C-n> :bn
nnoremap <C-b> :bp

" Is this for autocomplete?
" imap <Tab> <C-N>

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
let g:NERDTreeDirArrows=0


" VimPasta
let g:pasta_enabled_filetypes = ['javascript', 'css', 'sh']

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = '▶' 
