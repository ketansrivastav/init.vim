set termguicolors
set background=dark
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'joshdick/onedark.vim'
Plug  'cocopon/iceberg.vim'
Plug 'retorillo/airline-tablemode.vim'
Plug 'ryanoasis/vim-webdevicons'
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-commentary' 
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'haya14busa/incsearch.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'kien/ctrlp.vim'
"clojure plugins
Plug 'tpope/vim-fireplace' 
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
call plug#end()
  set statusline+=%-10.3n\  
" let g:deoplete#enable_at_startup = 1
" let g:LanguageClient_autoStart = 1
let g:ctrlp_working_path_mode = 0

let g:rainbow_active = 1

colorscheme nova   
"set background=light
"colorscheme PaperColor
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#tab_nr_type= 2



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
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
tnoremap <Esc> <C-\><C-n>
" map <C-n> :NERDTreeToggle<CR>

set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

nnoremap <leader>] :bn <cr>
nnoremap <leader>[ :bp <cr>
set wildcharm=<Tab>
set wildmenu
set wildmode=full
nnoremap <Tab> :buffer<Space><Tab>

set hidden

call coc#config('coc.preferences', {
  \   'diagnostic.errorSign'  : '✖',
  \   'diagnostic.warningSign': '⚠',
  \ 'diagnostic.infoSign'   : 'i',
  \   'diagnostic.hintSign'   : 'ﯦ',
  \})
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" ,TextChanged,InsertLeave 
:imap jk <Esc>
nnoremap <C-c> :bp\|bd #<CR>
:command! W w
nmap <Leader>b :CtrlPBuffer<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
