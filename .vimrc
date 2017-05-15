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

Plugin 'Valloric/YouCompleteMe'

Plugin 'shawncplus/phpcomplete.vim'

Plugin 'benmills/vimux'

Plugin 'joonty/vdebug'

Plugin 'vimwiki/vimwiki'

Plugin 'lambdatoast/elm.vim'

Plugin 'swekaj/php-foldexpr.vim'

Plugin 'majutsushi/tagbar'

Plugin 'joonty/vim-taggatron'

Plugin 'janko-m/vim-test'

Plugin 'mattn/gist-vim'

Plugin 'othree/html5.vim'

Plugin 'tpope/vim-surround'

Plugin 'weierophinney/argumentrewrap'

Plugin 'airblade/vim-gitgutter'

Plugin 'ternjs/tern_for_vim'

Plugin 'othree/yajs.vim'

Plugin 'othree/javascript-libraries-syntax.vim'

Plugin 'othree/es.next.syntax.vim'

Plugin 'isRuslan/vim-es6'

Plugin 'lvht/phpcd.vim'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'joonty/vim-phpqa.git'

Plugin 'neomake/neomake'

let g:neomake_php_enabled_makers = ['php', 'phpmd', 'phpcs']

"let g:neomake_verbose=3


autocmd! BufWritePost,BufEnter  * Neomake

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["break_on_open"] = 1

let g:tagcommands = {
\    "php" : {"tagfile":".php.tags", "cmd": "ctags","args":"-R --exclude=.git --exclude=node_modules --exclude=vendor"},

\}
let g:taggatron_verbose = 0

let test#strategy = "dispatch"

let g:ycm_auto_trigger = 1


let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_enchance_jump_to_definition = 1
let g:phpcomplete_mapping = {
 \ 'jump_to_def_vsplit': ',g' 
 \}

autocmd FileType php set omnifunc=phpcd#CompletePHP
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_lazy_update = 1
let g:ctrlp_by_filename = 1

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = 2

let NERDTreeShowLineNumbers = 1
""""""""""""""""""""""
"My mappings
"
""""""""""""""""""""""

"let mapleader = "\<space>"
let mapleader = ","

" Tagbar Toggle
nnoremap <leader>f :TagbarToggle<CR>

" Toggen nerdtree
map <leader>n :NERDTreeToggle<CR>

" put in quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" save and quit
nnoremap <leader>q :wq<cr>
" save
nnoremap <leader>w :w<cr>

nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>

" make a split and switch to it
nnoremap <leader>s <C-w>v<C-w>l

" Movement
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Operators
nnoremap <silent> <leader>r :set opfunc=Replace<cr>g@
vnoremap <silent> <leader>r :<c-u>call Replace(visualmode())<cr>

" navigate panels
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" remove highlight
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

" vimrc
noremap <leader>vv :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" change the first word to return
" noremap <leader>r :s/^\S\+ \{-}=\{-}/return/<CR>

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
nnoremap j j
nnoremap k k
nnoremap <leader>p "0p

"abbrev

iabbrev f Facebook

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

    colorscheme solarized
catch
endtry

set background=dark


au FocusLost * :wa

command! W w !sudo tee % > /dev/null


"autocmd
autocmd InsertEnter * :normal! mi
autocmd InsertLeave * :normal! mo`iv`o"iy`o

noremap <leader>i "ip


set tags=./.php.tags;/

" Functions

function! SwitchBuffer()
  b#
endfunction

nnoremap <Tab> :call SwitchBuffer()<CR>

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

function! Replace(type)
    if a:type ==# 'v'
         normal! `<v`>d"0P
    elseif a:type ==# 'char'
        normal! `[v`]d"0P
    else
        return
    endif

    echom shellescape(@@)
endfunction