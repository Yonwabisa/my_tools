set relativenumber
set number
set incsearch
set nowrap
set nowrapscan
let mapleader = " "
let g:airline_theme='onehalfdark'
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

" --------------------------telescope--------------------------

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" -------------------------------------------------------------

" A File explorer
Plug 'preservim/nerdtree'

" A parenthesis pair highlighter
Plug 'tpope/vim-surround'

" Airline info footer
Plug 'bling/vim-airline'

Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Typescript syntax highlighting
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'

" JavaScript syntax highlighting
Plug 'yuezk/vim-js'

" Jsx syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'


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

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

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


colorscheme onehalfdark
