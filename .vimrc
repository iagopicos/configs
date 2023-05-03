set nocompatible
set nolist
set signcolumn=yes
set rnu

set backspace=indent,eol,start " backspace everywhere in insert mode

set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set cursorline
set showmatch
set sw=2
set relativenumber
set encoding=utf-8

set viminfo='100,<9999,s100
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

set laststatus=2
set noshowmode

set scrolloff=4
set wildmenu
set nohlsearch
"set foldmethod=syntax
autocmd VimEnter * if !argc() | NERDTree | wincmd p | q | endif

call plug#begin('~/.vim/plugged')
" Themes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
" IDE
Plug 'easymotion/vim-easymotion' " Find in files
Plug 'scrooloose/nerdtree' "file system
Plug 'joshdick/onedark.vim'
Plug 'christoomey/vim-tmux-navigator' " Split , and move btw the splits
Plug 'sheerun/vim-polyglot' "Multi language syntaxis(Maybe it will be better use specifics for some languages)
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'sansyrox/vim-python-virtualenv'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
"Status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
"Typing 
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
"Search
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Styled components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
"Git
Plug 'itchyny/vim-gitbranch'
call plug#end()

colorscheme badwolf
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1

let mapleader="/"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch':'gitbranch#name'
      \ },
      \ }

nmap <Leader>ss <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>ff :call CocAction('format')<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

noremap <leader>s :CocSearch 
noremap <leader>f :Files<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"Terminal
noremap <leader>tv :botright vnew <Bar> :terminal<cr>
noremap <leader>th :botright new <Bar> :terminal<cr>
" Terminal exit mapping
:tnoremap <Esc> <C-\><C-n>

"coc.nvima
autocmd FileType scss setl iskeyword+=@-@
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"inoremap <silent><expr> <Tab>
"     \ coc#pum#visible() ? coc#pum#next(1) :
"     \ CheckBackspace() ? "\<Tab>" :
"     \ coc#refresh()
" tabs navigation
map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>
