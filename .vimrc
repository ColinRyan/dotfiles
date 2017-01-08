set nocompatible
filetype off


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'easymotion/vim-easymotion'

Plugin 'tpope/vim-fugitive'

Plugin 'StanAngeloff/php.vim'
 
Plugin 'pangloss/vim-javascript'

Plugin 'jwalton512/vim-blade'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'


Plugin 'joonty/vdebug'

Plugin 'vimwiki/vimwiki'

let g:vdebug_options = {'ide_key': 'vim'}
let g:vdebug_options = {'break_on_open': 0}
let g:vdebug_options = {'server': 'heyorca.app'}
let g:vdebug_options = {'port': '9000'}

Plugin 'joonty/vim-taggatron'

Plugin 'janko-m/vim-test'

let g:tagcommands = {
\    "php" : {"tagfile":".php.tags", "cmd": "ctags","args":"-R --exclude=.git --exclude=node_modules --exclude=vendor"},
\    "javascript" : {"tagfile":".js.tags", "cmd": "ctags","args":"-R --exclude=.git --exclude=node_modules --exclude=vendor"} 
\}
let g:taggatron_verbose = 1

Plugin 'shawncplus/phpcomplete.vim'

Plugin 'benmills/vimux'

let test#strategy = "dispatch"

autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Keep Plugin commands between vundle#begin/end.
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on


"Plugin config

let g:ctrlp_max_files=30001 
let g:ctrlp_clear_cache_on_exit = 0

"let mapleader = "\<space>"
let mapleader = ","
""""""""""""""""""""""
"My mappings
"
""""""""""""""""""""""
" Toggen nerdtree
map <C-n> :NERDTreeToggle<CR>

" put in quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" save and quit
nnoremap <leader>q :wq<cr>
" save
nnoremap <C-s> :w<cr>

nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>

" make a split and switch to it
nnoremap <leader>s <C-w>v<C-w>l

" Movement
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" navigate panels
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" remove highlight
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

" vimrc
noremap <leader>vv :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" change the first word to return
noremap <leader>r :s/^\S\+ \{-}=\{-}/return/<CR>

" bashrc
noremap <leader>vb :vsplit ~/.bashrc<cr>

" yank and paste

" duplicates line
noremap <leader>d "dyy"dp
" delete word and paste new word
noremap <leader>r diw"0P

" Delete in
noremap <leader>[ di[
noremap <leader>{ di{
noremap <leader>( di(

" To command mode
inoremap jj <ESC>
inoremap kk <ESC>
inoremap jk <ESC>
inoremap kj <ESC>


inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


"Disabled 
"

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <leader>p "0p



" Config
set modelines=0

set pastetoggle=<F5>

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set number
set undofile


"nnoremap / /\v
"vnoremap / /\v

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch


set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set omnifunc=syntaxcomplete#Complete

" Color 


try 

    colorscheme solariszed
catch
endtry

set background=dark


au FocusLost * :wa

command! W w !sudo tee % > /dev/null


"autocmd
autocmd InsertEnter * :normal! mi
autocmd InsertLeave * :normal! mo`iv`o"iy`o

noremap <leader>i "ip


set tags+=./php.tags

" Functions

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END


function! PublicPrivateToggle()
    let line = getline('.')
    if (line =~ 'public')
        s/public/private/
    elseif (line =~ 'private')
        s/private/public/
    endif
endfunction

noremap <leader>t :call PublicPrivateToggle()<cr>

