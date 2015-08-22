set nocompatible

if (has("win32") || has("win64") || has("win16"))
  set guifont=Inconsolata\ for\ Powerline:h12
else
  set guifont=Inconsolata\ for\ Powerline\ Medium\ 12
endif

execute pathogen#infect()
execute pathogen#helptags()

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set backupcopy=yes
set complete-=i
set completeopt=menu
set confirm
set directory-=.
set expandtab
set hidden
set mouse=a
set number
set smarttab
set shiftwidth=4
set ignorecase
set smartcase
set softtabstop=4
set tabstop=4
set t_vb=
set visualbell

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set nofoldenable

if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

set hlsearch
set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> ;nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu
set wildignore+=log/**,node_modules/**,target/**,tmp/*
set wildignore+=*.o,*.rbc,*.pyc,*.so,*.swp
set wildmode=longest,list,full

map Y y$
nmap <leader><space> ;call whitespace#strip_trailing()<CR>

"====[ Mappings ]================================================
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"====[ CTRL-P Mappings ]=========================================
nmap <leader>p ;CtrlPBuffer<CR>
nmap <leader>t ;CtrlP<CR>
nmap <leader>T ;CtrlPClearCache<CR>;CtrlP<CR>
let g:ctrlp_working_path_mode='r'

"====[ NERDTree Mappings ]=======================================
nmap <leader>n ;NERDTreeToggle<CR>
nmap <leader>f ;NERDTreeFind<CR>

"====[ GitGutter Mappings ]======================================
nmap <leader>g ;GitGutterToggle<CR>

"====[ PyMode Settings ]=========================================
let g:pymode = 1

"====[ Airline Settings ]========================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN> DVB_Drag('down')
vmap <expr> <UP> DVB_Drag('up')

nmap ;l ;call ListTrans_toggle_format()<CR>
vmap ;l ;call ListTrans_toggle_format('visual')<CR>

autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd VimResized * ;wincmd =

let NERDTreeIgnore = ['\.pyc$','\.obj$']
let g:NERDSpaceDelims = 1

let g:ctrlp_match_window = 'order:ttb,max:20'

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
endif
set list

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

if (has("win32") || has("win64") || has("win16"))
  set shell=$COMSPEC
else
  set shell=/bin/bash
endif

set autoread
set fileformats+=mac

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.

set background=dark
if (&t_Co == 256 || has('gui_running'))
  colorscheme solarized
  call togglebg#map('<F5')
endif

if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

highlight ColorColumn ctermbg=magenta guibg=purple
exec matchadd('ColorColumn', '\%81v', 100)

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

autocmd FileType go set noexpandtab
autocmd FileType html set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2
