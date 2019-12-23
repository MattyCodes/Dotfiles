" Base setup.
set nocompatible
filetype off

" Initialization for Vundle.
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*
call vundle#begin()

" Plugins.
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'        
Plugin 'skammer/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jlanzarotta/bufexplorer'

" End Vundle configuration.
call vundle#end()         
filetype plugin indent on

" NERDTree configuration.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
nmap <F5> :NERDTreeToggle<CR>
syntax enable

" Solarized VIM.
let g:solarized_termcolors=256
set background=light
colorscheme solarized

" Keymapping for ctrlp.vim (fuzzy file search).
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" General setup and configuration for plugins.
set number 
set linebreak 
set showbreak=+++ 
set textwidth=100
set showmatch 
set visualbell 
set hlsearch 
set smartcase 
set ignorecase 
set incsearch 
set autoindent 
set shiftwidth=2 
set smartindent 
set smarttab  
set softtabstop=2 
set ruler 
set undolevels=1000 
set backspace=indent,eol,start  
set mouse=a
set guifont=Menlo\ Regular:h14

" Mapped shortcuts for switching tabs and panes.
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Allow copy-to-clipboard.
set clipboard=unnamed
map <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

" Syntastic configuration.
let g:gitgutter_updatetime = 750
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
autocmd FileType javascript let b:syntastic_checkers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['standard']
set statusline+=%F
