set nocompatible
set number
set hlsearch
set incsearch

set ignorecase
set smartcase

set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType make setlocal noexpandtab

autocmd Filetype gitcommit setlocal spell textwidth=72

execute pathogen#infect()
syntax on
filetype indent plugin on

set background=dark
"let g:solarized_termcolors=256
colorscheme solarized

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
"Map <C-L> (redraw screen) to also turn off search highlighting
"until the next search
nnoremap <C-L> :nohl<CR><C-L>

nmap <F1> :NERDTreeToggle<CR>

set mouse=a

" cursor shape
" https://www.iterm2.com/documentation-escape-codes.html
" ^[]1337;CursorShape=N^G
" where N=0, 1, or 2.
" 0: Block
" 1: Vertical bar
" 2: Underline
let &t_SI = "\<Esc>]1337;CursorShape=2\x7"
let &t_EI = "\<Esc>]1337;CursorShape=0\x7"


" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['flake8']
