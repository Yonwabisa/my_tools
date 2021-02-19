syntax on

set noerrorbells
set relativenumber
set number
set tabstop=4 softtabstop=4         " tabstop sets tab to 4 spaces, softtab sets tabs to spaces
set shiftwidth=4                    " sets the >> and << to move text by 4 spaces
set expandtab                       " covnert tabs to spaces
set smartindent                     " auto indentation
set nowrap
set incsearch                       " highlights text as you search
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile                        " create files to store your undo history
set colorcolumn=80                  " setting a ruler at 80 characters
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'                              " a colorscheme
Plug 'sonph/onehalf'                                " a colorscheme
Plug 'jremmen/vim-ripgrep'                          " a fast grep
Plug 'vim-utils/vim-man'
"Plug 'git@github.com:kien/ctrlp.vim.git'            " a file finder
Plug 'https://github.com/kien/ctrlp.vim.git'            " a file finder
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
"let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0
