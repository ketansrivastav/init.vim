set termguicolors
set background=dark
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'joshdick/onedark.vim'
Plug  'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'retorillo/airline-tablemode.vim'
Plug 'ryanoasis/vim-webdevicons'
Plug 'scrooloose/nerdtree'
" Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-commentary' 
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'haya14busa/incsearch.vim'
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'kien/ctrlp.vim'
"clojure plugins
Plug 'tpope/vim-fireplace' 
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
" Markdown"
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'NLKNguyen/papercolor-theme'
" -- -- Plug 'vim-scripts/paredit.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
call plug#end()
  set statusline+=%-10.3n\  
" let g:deoplete#enable_at_startup = 1
" let g:LanguageClient_autoStart = 1
let g:ctrlp_working_path_mode = 0
let g:NERDTreeGitStatusWithFlags = 1

let g:rainbow_active = 1

"colorscheme gruvbox 
""set background=light
""colorscheme PaperColor
set t_Co=256   " This is may or may not needed.

set background=light
colorscheme PaperColor
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

let g:loaded_floater = 1
let g:floater_buf = -1

function! Exec(command, close_on_open) abort
    let znew_buf=v:false
    if bufexists(g:floater_buf) == v:false
        let znew_buf=v:true
        let g:floater_buf = nvim_create_buf(v:false, v:true)
        call setbufvar(g:floater_buf, '&signcolumn', 'no')
        call setbufvar(g:floater_buf, '&number', '0')
        call setbufvar(g:floater_buf, '&buflisted', '0')
    endif

    let width = &columns - 4
    let height = (&lines / 2) + 10
    "let offset = 1
    let offset = (&lines / 2) - 20

    let opts = {
                \ 'relative': "editor",
                \ 'row' : offset,
                \ 'col' : 2,
                \ 'width': width,
                \ 'height': height
                \}

    call nvim_open_win(g:floater_buf, v:true, opts)
    if znew_buf == v:true
        call termopen(a:command)
        if a:close_on_open == v:true
            silent! exec 'bd'
        endif
    endif
endfunction

let g:toggleVar = "true"
function! Toggle()
    " if bufwinid(g:floater_buf) == -1
    if g:toggleVar == "true"
        call Exec(&shell, v:false)
        let g:toggleVar = "false"
    else
        let g:toggleVar = "true"
        silent! exec 'q'
    endif
endfunction

command! -nargs=0 FloaterOpen call Exec(&shell, v:false)

command! -nargs=0 FloaterToggle call Toggle()
 
" " sync open file with NERDTree
" " " Check if NERDTree is open or active
" function! IsNERDTreeOpen()        
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" " Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" ================
" returns true iff is NERDTree open/active
" ================


"autocmd BufEnter * silent! if bufname('%') !~# 'NERD_tree_' | cd %:p:h | NERDTreeCWD | wincmd p | endif

call coc#config('coc.preferences', {
  \   'diagnostic.errorSign'  : '✖',
  \   'diagnostic.warningSign': '⚠',
  \ 'diagnostic.infoSign'   : 'i',
  \   'diagnostic.hintSign'   : 'ﯦ',
  \})
let g:coc_global_extensions = [
  \ 'coc-eslint', 
  \ 'coc-json', 
  \ 'coc-tsserver'
  \ ]
" when running at every change you may want to disable quickfix
" let g:prettier#quickfix_enabled = 0

" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction


fu! SaveSess()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()
" coc mapping"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fd  <Plug>(coc-format-selected)
nmap <leader>fd  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,javascript setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

noremap <silent> <c-j> :call <SID>swap_up()<CR>
noremap <silent> <c-k> :call <SID>swap_down()<CR>
" ,TextChanged,InsertLeave 
:imap jk <Esc>
" nnoremap <C-c> :bp\|bd #<CR>
:command! W w
nnoremap <space> :call Toggle()<CR>
nmap <Leader>b :CtrlPBuffer<CR>
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
nmap <C-n> :NERDTreeToggle<CR>
