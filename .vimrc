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
Plugin 'arcticicestudio/nord-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'arzg/vim-colors-xcode'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'tomtom/tcomment_vim'
Plugin 'mileszs/ack.vim'
Plugin 'posva/vim-vue'
Plugin 'rafi/awesome-vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jlanzarotta/bufexplorer'

" End Vundle configuration.
call vundle#end()         
filetype plugin indent on

" NERDTree configuration.
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
nmap <F5> :NERDTreeToggle<CR>

" Configuration for the Vue.js package.
let g:vue_pre_processors = ['scss']

" Open the tree-view when VIM is launched.
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Configuration for color-column.
:set colorcolumn=81

" Do not wrap lines.
set nowrap
set formatoptions-=t

map <C-/> :TComment

" Convert tabs to spaces.
:set expandtab

" Enable syntax highlighting.
syntax enable

" Enable 256 terminal colors.
let g:solarized_termcolors=256

" A dark, colorful theme with lots of Purples and Blues.
" colorscheme afterglow

colorscheme nord

" A very dim, Woodland/Earth theme.
" colorscheme alduin

" Colorscheme for the Xcode theme.
" colorscheme xcodedark

" Light theme.
" set background=light

" Dark theme (disable the 256 solarized-termcolors for this to work). 
set background=dark

" Solarized syntax theme.
" colorscheme solarized

" Keymapping for ctrlp.vim (fuzzy file search).
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=50
let g:ctrlp_match_window='min:4,max:999'
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files']

" General setup and configuration for VIM.
set number 
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
set statusline+=%F
