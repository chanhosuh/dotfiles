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
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab

set encoding=utf-8

set autoread

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

" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,javascript,scala,solidity let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" buffer management
set hidden
nnoremap gb :ls<CR>:b
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" python3 installed by brew as a vim dependency
let g:python3_host_prog = '/usr/local/bin/python3'

" NERDTree
nmap <F1> :NERDTreeToggle<CR>
" nnoremap \d :bp<cr>:bd #<cr>
nnoremap <Leader>d :Bdelete<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" coc.nvim
if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" navigate completion list with tab/shift-tab (deoplete or coc)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" default: 4000 ms
set updatetime=300

" ALE
nmap <F3> :ALEGoToDefinition<CR>
nmap <F2> :ALERename<CR>

" vim-prettier
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1
let g:prettier#quickfix_enabled=0
autocmd BufWritePre *.sol Prettier

" Command T
set wildignore+=node_modules

