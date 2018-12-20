set termguicolors
set background=dark
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'retorillo/airline-tablemode.vim'
Plug 'ryanoasis/vim-webdevicons'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-commentary' 
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'haya14busa/incsearch.vim'
"    Plug 'jeffkreeftmeijer/vim-numbertoggle'
" LanguageClient plugin
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" Plug 'mxw/vim-jsx'
Plug 'kien/ctrlp.vim'
"clojure plugins
Plug 'tpope/vim-fireplace' 
Plug 'luochen1990/rainbow'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:LanguageClient_autoStart = 1
let g:ctrlp_working_path_mode = 0
let g:ale_linters = {
\   'javascript': ['eslint','standard'],
\}

let g:ale_fixers = ['standard']
let g:rainbow_active = 1

colorscheme nova   
"set background=light
"colorscheme PaperColor
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#tab_nr_type= 2

" Use a slightly slimmer error pointer
let g:ale_sign_error = '✖'
hi! ALEErrorSign guifg=#DF8C8C ctermfg=167
let g:ale_sign_warning = '⚠'
hi! ALEWarningSign guifg=#F2C38F ctermfg=221
let g:ale_echo_msg_format = '%linter% : %s'


" folding
set foldmethod=syntax
set foldcolumn=0
let javascript_fold=1
set foldlevelstart=99

set number
"set numberwidth=5
" Highlight search matches
set hlsearch
"let g:airline#extensions#tabline#show_tab_type = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
tnoremap <Esc> <C-\><C-n>
map <C-n> :NERDTreeToggle<CR>

" Automatically start language servers.
" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  set hidden

  let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
    \ }

else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
