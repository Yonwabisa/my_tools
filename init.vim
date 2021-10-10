set relativenumber
set number
set incsearch
set nowrap
set nowrapscan
set termguicolors
let mapleader = " "
let g:lightline = { 'colorscheme': 'nightfly' }
let g:nightflyCursorColor = 1
let g:nightflyTransparent = 1
let g:nightflyUnderlineMatchParen = 1
let g:nightflyVertSplits = 0
let g:colorizer_auto_color = 1
nnoremap <C-h> <C-w>h<CR>
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>
nnoremap <C-l> <C-w>l<CR>
nnoremap <leader>u <cmd>source ~/.config/nvim/init.vim<cr>
nnoremap <leader>I <cmd>CocInstall -sync<cr>
" Turn off highlighting (Best used after a search)
nnoremap <leader>/ <cmd>noh<cr>

call plug#begin('~/.config/nvim/plugged')

" --------------------------COC-----------------------------------
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" ---------------------------------------------------------------

" A File explorer
Plug 'preservim/nerdtree'

" A parenthesis pair highlighter
Plug 'tpope/vim-surround'

" Airline info footer
Plug 'bling/vim-airline'

" A theme based on the vsCode nightOwl
Plug 'bluz71/vim-nightfly-guicolors'

" A floating terminal
Plug 'voldikss/vim-floaterm'

" A xolor code highlighter
Plug 'chrisbra/Colorizer'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(1) } }

call plug#end()

" ===========================Functions====================================

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Open a new floating terminal | teminal running lf
nnoremap <leader>t :FloatermNew<CR>
nnoremap <leader>l :FloatermNew lf<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

colorscheme nightfly
