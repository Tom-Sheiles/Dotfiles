set number			" Numero
syntax on			" Powered by techicolor
set shiftwidth=4	" size of your tabs
set tabstop=4		" Number of spaces a tab counts for
set smartindent		" tab after newline
set mouse=a			" Let the mouse control select

set path+=** 		" Wow Magic !!
set wildmenu 		" tab complete menu
set laststatus=2 	" Turn on status line

" Bracket autocomplete
inoremap { {}<left>
inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O

" Swap buffers with shortcuts
map <S-j> :bp!<CR>
map <S-k> :bn!<CR>

" Plugins
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

" enable buffer names
let g:airline#extensions#tabline#enabled = 1

colorscheme duskfox
let g:airline_theme="zenburn"
