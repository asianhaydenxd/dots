filetype indent plugin on   " disallow auto-indenting depending on file type
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set autoindent              " indent a new line the same amount as the line just typed
set relativenumber          " add line numbers
set number
set wildmode=longest,list   " get bash-like tab completions
"set cc=100                  " set a 100 column border for good coding style
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin('~/.vim/plugged')
 " Plugin Section
  Plug 'chriskempson/base16-vim'
  Plug 'xiyaowong/nvim-transparent'
  Plug 'jiangmiao/auto-pairs'
  Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'pocco81/auto-save.nvim'
call plug#end()

lua require("nvim-tree").setup()

lua require("indent_blankline").setup()

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" color schemes
if (has("termguicolors"))
 set termguicolors
endif
syntax enable

" colorscheme evening
colorscheme base16-default-dark

" open new split panes to right and below
set splitright
set splitbelow

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"let g:nerdtree_tabs_open_on_console_startup=1

"autocmd TextChanged,TextChangedI <buffer> silent write

"autocmd VimEnter * NERDTree

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-left> :m '>+1<CR>gv=gv
vnoremap <A-right> :m '<-2<CR>gv=gv

" Move between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" map <C-down> <C-w>j
" map <C-up> <C-w>k
" map <C-left> <C-w>h
" map <C-right> <C-w>l

" Move windows
" map <A-j> <C-w>J
" map <A-k> <C-w>K
" map <A-h> <C-w>H
" map <A-l> <C-w>L
 
" map <A-down> <C-w>J
" map <A-up> <C-w>K
" map <A-left> <C-w>H
" map <A-right> <C-w>L

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-left> :m '>+1<CR>gv=gv
vnoremap <A-right> :m '<-2<CR>gv=gv

" Press i to enter insert mode, and ii to exit insert mode.
inoremap ii <Esc>
" inoremap jk <Esc>
" inoremap kj <Esc>
" vnoremap jk <Esc>
" vnoremap kj <Esc>

" Live reload
"nnoremap <leader>sv :source $MYVIMRC<CR>

"let g:neoterm_default_mod='belowright' " open terminal in bottom split
"let g:neoterm_size=16 " terminal split size
"let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
"nnoremap <leader><cr> :TREPLSendLine<cr>j " send current line and move down
"vnoremap <leader><cr> :TREPLSendSelection<cr> " send current selection

tnoremap <Esc> <C-\><C-n><C-W>k

map t :NvimTreeToggle<CR>

