" Settings
set nocompatible
set backupdir=~/.vim_backup//
set directory=~/.vim_swp//
set backupcopy=yes
set expandtab
set laststatus=0
set incsearch
set autoindent
set showcmd
set tabstop=4
set shiftwidth=4
set numberwidth=4
set ignorecase
set smartcase
set mouse=a
set backspace=indent,eol,start
set nowrap
set cursorline
set cursorcolumn
set relativenumber

set wildmode=list:longest,list:full
set hlsearch
set lines=999 columns=9999
set background=dark
set hidden
set grepprg=ack
highlight Comment cterm=italic
set term=xterm-256color-italic

set t_ZH=[3m
set t_ZR=[23m

let g:grep_cmd_opts = '--noheading'

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

" NeoBundle "bling/vim-airline"
NeoBundle "flazz/vim-colorschemes"
NeoBundle "tpope/vim-fugitive"
NeoBundle "tpope/vim-git"
NeoBundle "tpope/vim-surround"
NeoBundle "garbas/vim-snipmate"
NeoBundle "wojtekgalaj/vim-snippets"
NeoBundle "kien/ctrlp.vim"
NeoBundle "FelikZ/ctrlp-py-matcher"
NeoBundle "mileszs/ack.vim"
NeoBundle "joequery/Stupid-EasyMotion"
NeoBundle "rizzatti/dash.vim"
NeoBundle "sickill/vim-pasta"
NeoBundle "vim-scripts/ZoomWin"
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "scrooloose/nerdtree"
NeoBundle "tomtom/tlib_vim"
NeoBundle "Raimondi/delimitMate"
NeoBundle "scrooloose/syntastic"
NeoBundle "tomtom/tcomment_vim"
NeoBundle "szw/vim-ctrlspace"
NeoBundle "ervandew/supertab"
NeoBundle "othree/javascript-libraries-syntax.vim"
NeoBundle "mustache/vim-mustache-handlebars"
NeoBundle "pangloss/vim-javascript"
NeoBundle "groenewege/vim-less"
NeoBundle "mattn/emmet-vim"
NeoBundle "mxw/vim-jsx"
NeoBundle "skwp/greplace.vim"
NeoBundle "wavded/vim-stylus"
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}



call neobundle#end()

filetyp plugin indent on

set t_Co=256
syntax on
colorscheme gruvbox

let g:used_javascript_libs = "angularjs, jasmine, angularui, jquery"

if has("gui_running")
  set guifont=Operator\ Mono:h16
  set guioptions-=egt
	set guioptions=LR
	set guioptions-=LR
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
let mapleader = "\<space>"
nnoremap <Leader>n :call NumberToggle()<cr>
nnoremap <Leader>nn :set nonumber<cr>
nnoremap <Leader>m :set modifiable<cr>
nnoremap <Leader>j :%!python -m json.tool<cr>
nnoremap <Leader>d :TernDef<cr>
nnoremap <Leader>h :noh<cr>
nnoremap <Leader>c :bufdo bd<cr>

"Disable Arrow Keys to force myslef to use the home row
" nn <Left> <nop>
" nn <Right> <nop>
" nn <Up> <nop>
" nn <Down> <nop>
"

nn <F9> mzggg?G`z

" Clean trailing whitespace
au BufWritePre * :%s/\s\+$//e

" Split windows
nnoremap <Leader>s :sp<cr><C-w><C-w>
nnoremap <Leader>v :vsp<cr><C-w><C-w>


" Easily switch between windows
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-l> :wincmd l<cr>

nnoremap <leader>w :w<cr>

nnoremap <Leader>a :Ack<Space>

" NERDTree
let NERDTreeShowHidden=1
nnoremap <leader><Tab> :NERDTreeToggle<cr>
nnoremap <leader><leader><Tab> :NERDTreeFind<cr>

nnoremap <leader>r :vertical resize 120<cr>

" CtrlP
" 'c' The directory of current file
" 'r' nearest ancestor with .git
let g:ctrlp_working_path_mode='r'
let g:ctrlp_custom_ignore = {'dir': '\v[\/](\.git|\.hg|\.svn|bower_components|node_modules|coverage)$', 'file': '\v\.(exe|so|dll)$'}
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}

" NerdTree
set encoding=utf-8

" VimPasta
let g:pasta_enabled_filetypes = ['javascript', 'css', 'sh', 'jsx']

" Prevent cursor from moving after exiting insert mode
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif"

" Use jsx syntax in js files
let g:jsx_ext_required = 0


let g:airline_powerline_fonts = 1
" No lag in airline with this.
set timeoutlen=1000 ttimeoutlen=0
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

nnoremap <leader>t :SyntasticToggleMode<cr>

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

autocmd InsertEnter,InsertLeave * set cul!

let g:ctrlspace_use_mouse_and_arrows_in_term = 1

let g:user_emmet_leader_key=','
