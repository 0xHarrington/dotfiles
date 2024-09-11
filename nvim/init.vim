" ==========================================================================
" File:   (NEO) Vim Config File
" Author: Matt Harrington
" Focus:  Python and Jupyter Notebook Development
" ==========================================================================

" ----------------------------------------------------------
" Plugin Management (vim-plug)
" ----------------------------------------------------------
call plug#begin()

" Appearance
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Editing and Navigation
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Python-specific
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'jupyter-vim/jupyter-vim'

" Jupyter Notebook support
Plug 'goerz/jupytext.vim'

call plug#end()

" ----------------------------------------------------------
" General Settings
" ----------------------------------------------------------
set history=500
set autoread
let mapleader = ","
let maplocalleader = ",,"
set gdefault
set mouse=a
set spelllang=en_us

" ----------------------------------------------------------
" UI and Visual Settings
" ----------------------------------------------------------
set number
set numberwidth=3
set relativenumber
set so=10
set ruler
set showcmd
set incsearch
set laststatus=2
set showmatch
set hlsearch
set lazyredraw
set magic
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«

" Remove GUI elements
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colors and Fonts
if has("unix")
  set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
  set gfn=Monospace\ 11
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set colorscheme
try
  colorscheme gruvbox
  let g:gruvbox_italic=1
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
  let g:gruvbox_contrast_dark='medium'
  let g:gruvbox_improved_strings=1
catch /.*/
  echo "Caught error when loading Gruvbox" . v:exception
  colorscheme default
endtry

set bg=dark

" ----------------------------------------------------------
" Editing and Indentation
" ----------------------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set completeopt=noinsert,menuone,noselect

" ----------------------------------------------------------
" Key Mappings
" ----------------------------------------------------------
" Search
map <space> /
map <c-space> ?
cnoremap <c-n> <CR>n/<c-p>
map <leader><space> :noh<CR>

" Saving and closing
nmap <leader>w :w!<cr>
nmap <silent> <leader>s :set spell!<CR>
map <leader>i mmgg=G`m<CR>

" Window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffer management
map <leader>bd :bdelete<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>

" Tab management
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Disable arrow keys
noremap <Up>    :echo "No up for you!"<CR>
noremap <Down>  :echo "No down for you!"<CR>
noremap <Left>  :echo "No left for you!"<CR>
noremap <Right> :echo "No right for you!"<CR>

" ----------------------------------------------------------
" Plugin Configurations
" ----------------------------------------------------------
" Airline
let g:airline_theme='gruvbox'
let g:airline#extensions#branch#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" NERDTree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Rainbow Parentheses
let g:rainbow_active = 1

" COC
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <leader>cr :CocRestart<CR>

" Python Syntax
let g:python_highlight_all = 1

" Semshi (Python semantic highlighter)
let g:semshi#mark_selected_nodes = 0
let g:semshi#simplify_markup = v:true
let g:semshi#error_sign = v:false

" Jupyter-vim
let g:jupyter_mapkeys = 0
nnoremap <buffer> <silent> <localleader>r :JupyterRunFile<CR>
nnoremap <buffer> <silent> <localleader>I :JupyterImportThisFile<CR>
nnoremap <buffer> <silent> <localleader>e :JupyterSendCell<CR>
nnoremap <buffer> <silent> <localleader>E :JupyterSendRange<CR>
nmap     <buffer> <silent> <localleader>d <Plug>JupyterRunTextObj
vmap     <buffer> <silent> <localleader>d <Plug>JupyterRunVisual

" Jupytext
let g:jupytext_fmt = 'py:percent'
let g:jupytext_style = 'hydrogen'

" ----------------------------------------------------------
" Auto Commands
" ----------------------------------------------------------
" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Automatic folding
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

" Python-specific settings
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal textwidth=88  " Match Black formatter's line length
autocmd FileType python setlocal colorcolumn=88
autocmd FileType python setlocal completeopt-=preview  " Disable preview window for completions

" Jupyter Notebook settings
autocmd BufNewFile,BufRead *.ipynb set filetype=jupyter
autocmd FileType jupyter setlocal commentstring=# %s
