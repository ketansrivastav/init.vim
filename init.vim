call plug#begin('~/.config/nvim/plugged')
set termguicolors

set background=dark

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'retorillo/airline-tablemode.vim'
Plug 'ryanoasis/vim-webdevicons'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-commentary' 
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()
let g:ale_linters = {
\   'javascript': ['eslint','standard'],
\}

let g:deoplete#enable_at_startup = 1

" Use a slightly slimmer error pointer
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F
let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_fixers = ['standard']

colorscheme nova    
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#tab_nr_type= 2
"let g:airline#extensions#tabline#show_tab_type = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
tnoremap <Esc> <C-\><C-n>
map <C-n> :NERDTreeToggle<CR>
