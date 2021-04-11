set nocompatible
set backspace=indent,eol,start

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
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

set encoding=utf-8

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

set mouse=a

set number                     " Show current line number
set relativenumber             " Show relative line numbers

" cursor shape
" https://www.iterm2.com/documentation-escape-codes.html
" ^[]1337;CursorShape=N^G
" where N=0, 1, or 2.
" 0: Block
" 1: Vertical bar
" 2: Underline
let &t_SI = "\<Esc>]1337;CursorShape=2\x7"
let &t_EI = "\<Esc>]1337;CursorShape=0\x7"

" buffer management
set hidden
nnoremap gb :ls<CR>:b
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

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

let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

" deoplete settings:
" <TAB>: completion. :-/
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" TernJS settings:
let g:deoplete#sources#ternjs#docs = 1

let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1

