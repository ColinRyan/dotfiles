set nocompatible
filetype off



set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required


" Plugins
Plugin 'blueshirts/darcula'

Plugin 'tpope/vim-commentary'

Plugin 'tpope/vim-unimpaired'

Plugin 'machakann/vim-swap'

Plugin 'adoy/vim-php-refactoring-toolbox'

Plugin 'chriskempson/base16-vim'

Plugin 'sniphpets/sniphpets'

Plugin 'sniphpets/sniphpets-common'

Plugin 'Shougo/deoplete.nvim'

" Plugin 'padawan-php/deoplete-padawan'

Plugin 'docteurklein/neovim-php'

Plugin 'scrooloose/nerdcommenter'

Plugin 'noahfrederick/vim-composer'

Plugin 'sjl/gundo.vim'

Plugin 'jiangmiao/auto-pairs'

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

"Plugin 'Valloric/YouCompleteMe'

Plugin 'shawncplus/phpcomplete.vim'

Plugin 'benmills/vimux'

Plugin 'joonty/vdebug'

Plugin 'vimwiki/vimwiki'

Plugin 'lambdatoast/elm.vim'

" Plugin 'swekaj/php-foldexpr.vim'
Plugin 'rayburgemeestre/phpfolding.vim'

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

Plugin 'honza/vim-snippets'

Plugin 'SirVer/ultisnips'

"Plugin 'joonty/vim-phpqa.git'

Plugin 'w0rp/ale'

"Plugin 'neomake/neomake'



let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1

" These lines are here for phpcd

let g:ale_lint_delay = 1000 
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
"let g:neomake_php_enabled_makers = ['php', 'phpmd', 'phpcs']

"let g:neomake_verbose=3

"let g:neomake_list_height = 1


"autocmd! BufWritePost,BufEnter  * Neomake

let g:vdebug_options = {}
let g:vdebug_options["path_map"] = {
            \"/home/colin/code/heyorca/heyorca/laravel-webapp": "/var/www/heyorca/laravel-webapp"
            \}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["break_on_open"] = 0

let g:tagcommands = {}
let g:tagcommands["javascript"] = {"tagfile":".js.tags", "cmd": "ctags","args":"-R --exclude=.git --exclude=node_modules --exclude=vendor"} 

let g:taggatron_verbose = 0

let test#strategy = "dispatch"

"let g:ycm_auto_trigger = 1


autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>e"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsSnippetsDir = $HOME . "/.vim/snippets/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME . '/.vim/snippets/UltiSnips']
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Keep Plugin commands between vundle#begin/end.
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on


"Plugin config


let g:ctrlp_max_files=30001 
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'wr'
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_lazy_update = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_root_markers =  ['composer.json', '.gitignore']

if executable('ag')
    " use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP
    let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden 
                \ --ignore .git
                \ --ignore .svn
                \ --ignore .hg
                \ --ignore .DS_Store
                \ -g ""'

    "
    let g:ctrlp_use_caching = 1
endif

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = 2

let NERDTreeShowLineNumbers = 1
""""""""""""""""""""""
"My mappings
"
""""""""""""""""""""""
" let mapleader = "\<space>"
let mapleader = ","

" Create/edit snippets

nnoremap <leader>u :UltiSnipsEdit<CR>
"move line up
nnoremap <s-j> ddj<s-p>
nnoremap <s-k> ddk<s-p>

nmap <C-_> gcc
vmap <C-_> gc


" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : deoplete#mappings#manual_complete()
" Fold Toggle
nnoremap <space> zazt

" Tagbar Toggle
nnoremap <leader>f :TagbarToggle<CR>

" Toggen nerdtree
map <C-n> :NERDTreeToggle<CR>

" put in quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" save
nnoremap <leader>w :w<cr>

nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>

" make a split and switch to it
nnoremap <leader>s :vnew<cr>

" Movement
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

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
"noremap <leader>vv :vsplit $MYVIMRC<cr>
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
nnoremap j j
nnoremap k k
nnoremap <leader>p "0p



" Config
" Settings

set exrc " project based vimrc

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

"_________________
"'"'"'"''""""'"""'
"\__/\__/^-/\_____
" Folding

set foldenable

set foldlevelstart=0

set foldnestmax=1

set foldmethod=syntax

let javaScript_fold = 1

highlight Folded ctermbg=black ctermfg=white


augroup jsFolds
    autocmd!
    autocmd FileType javascript,typescript,json syntax region braceFold start="{" end="}" transparent fold
    autocmd FileType javascript,typescript,json syntax region bracketFold start="\[" end="\]" transparent fold
    autocmd FileType javascript,typescript,json syntax sync fromstart
    autocmd FileType javascript,typescript,json set foldmethod=syntax
augroup end

autocmd! BufEnter webpack.mix.js set foldtext=MyWebpackMixFolds()

function! MyWebpackMixFolds()

    let text = join(getline(v:foldstart, v:foldend))
    let option = ''

    let path = matchstr(text , 'public/bundle/[-._/a-zA-Z]\+')

    let start = substitute(getline(v:foldstart), 'mix.\|([', '', 'g')
    let libCount = v:foldend - v:foldstart - 1

    let usedIn = split(system("grep -rwl './resources/views/' -e '" . substitute(path, 'public', '', 'g') . "'"), "\n")


    echom usedIn[1]



    return  path . "    " . join(usedIn, ' ')

endfunction

" Color 

let base16colorspace=256

colorscheme darcula

au FocusLost * :wa

command! W w !sudo tee % > /dev/null

command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | vnew | setlocal bt=nofile | put! a

"autocmd
autocmd InsertEnter * :normal! mi
autocmd InsertLeave * :normal! mo`iv`o"iy`o

autocmd! bufwritepost init.vim source ~/.config/nvim/init.vim
autocmd! bufLeave init.vim g:toggle_config=0
autocmd! bufLeave init.vim source ~/.config/nvim/init.vim

autocmd! bufLeave *.snippets silent! wall
autocmd! bufLeave *.snippets :bdelete

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

augroup startup
    autocmd!
    autocmd VimEnter * badd $MYVIMRC 
augroup END

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END



function! PhpSettings()
    let g:phpcomplete_search_tags_for_variables = 1
    let g:phpcomplete_parse_docblock_comments = 1
    let g:phpcomplete_relax_static_constraint = 1
    let g:phpcomplete_enchance_jump_to_definition = 1
    let g:phpcomplete_mapping = {
     \ 'jump_to_def_vsplit': ',g' 
     \}

    let g:ale_php_phpcs_standard='PSR2'
    let g:ale_linters = {
    \    'php': ['php','phpcs', 'phpmd', 'phpstan']
    \}

    let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
    let g:deoplete#ignore_sources.php = ['omni']

    let g:tagcommands["php"] = {"tagfile":".php.tags", "cmd": "ctags","args":"-R --exclude=.git --exclude=node_modules --exclude=vendor"}

    let b:phpfold_use = 1
    let b:phpfold_group_args = 0
    let b:phpfold_docblocks = 1
    let b:phpfold_group_iftry = 0
    let b:phpfold_text_right_lines = 0
endfunction

augroup php
    autocmd!
    autocmd FileType php call PhpSettings()
    autocmd FileType php set omnifunc=phpcd#CompletePHP
augroup END

function! PublicPrivateToggle()
    let line = getline('.')
    if (line =~ 'mappingpublic')
        s/public/private/
    elseif (line =~ 'private')
        s/private/public/
    endif
endfunction

nnoremap <leader>t :call PublicPrivateToggle()<cr>

let g:location_is_open = 0
function! LocationListToggle()
   if g:location_is_open
       lcl
       let g:location_is_open = 0
       execute g:location_return_to_window . "wincmd w"
   else
       let g:location_return_to_window = winnr()
       lop
       let g:location_is_open = 1
   endif
endfunction

nnoremap <leader>l :call LocationListToggle()<cr>

let g:quick_fix_is_open = 0
function! QuickFixToggle()
   if g:quick_fix_is_open
       cclose
       let g:quick_fix_is_open = 0
       execute g:quick_fix_return_to_window . "wincmd w"
   else
       let g:quick_fix_return_to_window = winnr()
       copen 
       let g:quick_fix_is_open = 1
   endif
endfunction

nnoremap <leader>q :call QuickFixToggle()<cr>

function! UltiDispatcher()
    echo g:makingFunction
    if(g:makingFunction)
        call GoBack()
    endif
endfunction

function! GoBack()
    let g:makingFunction = 0
    execute "normal! 'u"
endfunction

let g:makingFunction = 0
function! MakeFunction()

    let g:makingFunction = 1
    execute "normal! mugg/# funcs\<CR>no\<bs>\<bs>\<cr>pub "
    call UltiSnips#ExpandSnippetOrJump()
endfunction

nnoremap <leader>m :call MakeFunction()<cr>

autocmd! User UltiSnipsExitLastSnippet call UltiDispatcher()

nnoremap <leader>vv :call toggle#Config()<cr>

set secure "recommended to be placed at the bottom of the file
