set number
set rnu
colorscheme elflord

" *Basic Settings* "
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set showcmd
set cursorline
set hlsearch
set incsearch

" *Key Binds* "
inoremap " ""<left>
inoremap ' ''<left>
"inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>
nnoremap <C-i> :ls<CR>
nnoremap <C-p> :Ex<CR>

" *Colors* "
highlight Pmenu ctermfg=white ctermbg=black
highlight PmenuSel ctermfg=white ctermbg=gray
highlight CursorLine ctermfg=none ctermbg=black cterm=none
highlight YcmErrorSection ctermfg=red
highlight MatchParen cterm=bold ctermfg=cyan ctermbg=none

set path+=**
set wildmenu

" *Plugins* "
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

let g:netrw_liststyle=3
