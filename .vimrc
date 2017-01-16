set nocompatible 

set nowrap
set number             " Show line numbers
set numberwidth=5
set showmatch          " Highlight matching [{()}]
set history=1000       " Store lots of :cmdline history
set visualbell         " No sounds

set hlsearch           " Highlight matches
set incsearch          " Search as characters are entered
set ignorecase         " Ignore case when searching
set smartcase          "   ... unless we type a capital

set showcmd            " Show command in bottom bar
set cursorline         " Highlight current line
set wildmenu           " Visual autocomplete for command menu
set lazyredraw         " Redraw only when needed

set tabstop=8          " Number of visual spaces per TAB
set softtabstop=8     " Number of spaces in tab when editing
set expandtab         " expand tabs to spaces
set shiftwidth=2

set noswapfile
set nobackup
set nowb
set scrolloff=4
set sidescrolloff=10
set sidescroll=1
set mouse=a
" vim: ts=8:noexpandtab:shiftwidth=8:cindent
" vi:  ts=8:noexpandtab:shiftwidth=8:cindent

let mapleader=","      " Leader is a comma

syntax enable
filetype on
au BufNewFile,BufRead *.sv set filetype=verilog


color mustang

syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

nnoremap <silent><F2> :set cursorcolumn!<CR>
nnoremap <silent><F3> :ToggleBufExplorer<CR>
nnoremap <silent><F4> :NERDTreeToggle<CR>
nnoremap <silent><F5> :NERDTreeToggle %<CR>
nnoremap <silent><F6> :grep --color <C-R><C-W> *<CR>
nnoremap <silent><F7> :grep <C-R><C-W> -r *<CR>:copen<CR>
nnoremap <silent><F8> :TagbarToggle<CR>
nnoremap <silent><F9> :! p4 edit %<CR>
nnoremap <silent><F10> :color mustang<CR>
nnoremap <silent><F12> :color PaperColor<CR>

let g:NERDTreeMapPreview="<F7>"


map <C-J> <C-W>j<C-W><CR>
map <C-K> <C-W>k<C-W><CR>
map <C-H> <C-W>h<C-W><CR>
map <C-L> <C-W>l<C-W><CR>
map <C-\> <C-]>                  " used for ctags
map <C-j> <C-w>j


"Highlight columns greater than 100
"let &colorcolumn=join(range(100,999),",")
hi ColorColumn guibg=black ctermbg=236

set tags=tags;/ 
let g:easytags_dynamic_files = 1
let g:easytags_async = 1

" get syntax highlighting
au BufRead,BufNewFile *.sv set filetype=verilog
let verilog = "~/.vim/verilog.vim"


" Only display filename in tab label
set guitablabel=%t


" Disable visual bell
set t_vb=

set guifont=Monospace\ 11

"set statusline=%f
"
execute pathogen#infect()
filetype plugin indent on
set path=.,**

autocmd FileType python setlocal shiftwidth=4 tabstop=4

"let g:airline_theme='distinguished'
let g:airline_theme='powerlineish'
"let g:airline_powerline_fonts = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_full_redraws=1

let g:NERDTreeWinSize = 40

function! BuffersList()
  let all = range(0, bufnr('$'))
  let res = []
  for b in all
    if buflisted(b)
      call add(res, bufname(b))
    endif
  endfor
  return res
endfunction

function! GrepBuffers (expression)
  exec 'vimgrep/'.a:expression.'/ '.join(BuffersList())
endfunction

command! -nargs=+ GrepBufs call GrepBuffers(q-args>)
nnoremap <leader>z :call GrepBuffers("<C-R><C-W>")<CR>:copen<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
"xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap ga <Plug>(EasyAlign)
