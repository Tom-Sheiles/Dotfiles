set number
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a

set completeopt=longest,menuone "makes autocomplete not select first item

" makes autocomplete narrow down possible
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-m> pumvisible() ? "<C-y>" : "\<C-g>u\<CR>"

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()

" enable buffer name on the top of the window
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

noremap <S-k> :bn<CR>
noremap <S-j> :bp<CR>
