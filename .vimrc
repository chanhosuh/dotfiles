set nocompatible
set number
set hlsearch

set shiftwidth=4
set softtabstop=4
set expandtab

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

"test hard link
