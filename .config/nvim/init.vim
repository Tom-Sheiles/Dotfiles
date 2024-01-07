set number				" Numero
syntax on					" Powered by techicolor
set shiftwidth=2	" size of your tabs
set tabstop=2			" Number of spaces a tab counts for
set smartindent		" tab after newline
set mouse=a				" Let the mouse control select

set path+=** 			" Wow Magic !!
set wildmenu 			" tab complete menu
set laststatus=2 	" Turn on status line

" Bracket autocomplete
"inoremap ' ''<left>
"inoremap " ""<left>
"inoremap < <><left>
inoremap { {}<left>
inoremap ( ()<left>
inoremap {<CR> {<CR>}<ESC>O

" Swap buffers with shortcuts
noremap <C-j> J
noremap <C-k> K
noremap <S-j> :bp!<CR>
noremap <S-k> :bn!<CR>

" Plugins
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'

" Colorschemes
Plug 'EdenEast/nightfox.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

" enable buffer names
let g:airline#extensions#tabline#enabled = 1

autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE  " Stop from changing background color
colorscheme catppuccin-mocha
let g:airline_theme="zenburn"

