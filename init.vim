" `~/.config/nvim/init.vim`

" Base setup.
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*,*/node_modules/*
filetype plugin indent on

" Begin Vundle configuration.
call vundle#begin()

" Plugins.
Plugin 'gmarik/Vundle.vim'
Plugin 'f-person/git-blame.nvim'
Plugin 'scrooloose/nerdtree'        
Plugin 'skammer/vim-css-color'
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
Plugin 'dracula/vim', { 'name': 'dracula' }
Bundle 'jlanzarotta/bufexplorer'

" End Vundle configuration.
call vundle#end()         

" NERDTree configuration.
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:gitblame_message_template = '<author> • <date> • <summary>'
let g:gitblame_message_when_not_committed = ''
let NERDTreeShowHidden=1
nmap <F5> :NERDTreeToggle<CR>

" Configuration for the Vue.js package.
let g:vue_pre_processors = ['scss', 'typescript']

" Various definitions.
:set colorcolumn=81
set nowrap
set formatoptions-=t
map ;; :TComment<CR>
:set expandtab
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
set termguicolors
set undolevels=1000 
set backspace=indent,eol,start  
set mouse=a
set guifont=Menlo\ Regular:h14
set statusline+=%F

" Enable syntax highlighting.
syntax enable

" Dracula syntax theme.
colorscheme dracula

" Keymapping for ctrlp.vim (fuzzy file search).
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=50
let g:ctrlp_match_window='min:4,max:999'
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files']

" Mapped shortcuts for switching tabs and panes.
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Italicize comments in the editor.
highlight Comment cterm=italic gui=italic

" Allow copy-to-clipboard.
set clipboard=unnamed
map <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

" Auto-correct Ruby files with Rubocop.
:autocmd BufWritePost *.rb silent! !rubocop -a <afile>
