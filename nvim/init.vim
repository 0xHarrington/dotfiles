" ==========================================================================
" File:   (NEO) Vim Config File
" Author: Matt Harrington
" ==========================================================================


" ----------------------------------------------------------
" General
" ----------------------------------------------------------

" How many edits Vim has to remember
set history=500

" Auto-updates if file is changed from outside this buffer
set autoread

" Map <leader> to the comma key
let mapleader = ","
let maplocalleader = ",,"

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" CNTRL-n jumps to next term being searched for
cnoremap <c-n> <CR>n/<c-p>

" <leader><space> maps to un-highlighting everything
map <leader><space> :noh<CR>

" Fast saving, buffer/window closing
nmap <leader>w :w!<cr>

" Configure spell checking
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

" Hotkey for fixing indentation in the file
map <leader>i mmgg=G`m<CR>

" 'gdefault' applies substitutions globally on lines.
" For example, instead of :%s/foo/bar/g you just type :%s/foo/bar/
set gdefault


" ----------------------------------------------------------
" Moving around the editor
" ----------------------------------------------------------

" Disable arrow keys in normal mode
noremap <Up>    :echo "No up for you!"<CR>
noremap <Down>  :echo "No down for you!"<CR>
noremap <Left>  :echo "No left for you!"<CR>
noremap <Right> :echo "No right for you!"<CR>

" Display relative numbers, with current number highlighted
set number
set numberwidth=3
set relativenumber

" Force X lines above/below cursor when scrolling with j/k
set so=10

" Enable mouse clicking support
set mouse=a

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ----- Useful Buffer Manipulations -----

" Close the current buffer
map <leader>bd :bdelete<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Switch between buffers quickly
" map <leader>l :bnext<cr>
" map <leader>h :bprevious<cr>


" ----- Useful mappings for managing tabs -----
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ----------------------------------------------------------
" GUI-Related Configuration
" ----------------------------------------------------------

" ----- Terminal Mode (entered with ':terminal') -----
" 'i' puts the user in typical bash mode,
" '<C-\><C-n>' quits bash mode and puts you in Normal mode
if has('nvim')

  " Helpful shortcuts
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>

  " ':T' now opens a split with the terminal below
  command! -nargs=* T split | terminal <args>
endif

" General GUI stuff
set ruler            " show the cursor position all the time
set showcmd          " display incomplete commands
set incsearch        " Shows the match as you're typing
set laststatus=2     " Always display the status line
set autowrite        " Automatically :write before running commands
set formatoptions-=t " Don't auto-break long lines (re-enable this for prose)

" Disable scrollbars (real hackers don't use scroll bars!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" indentation indicators
" Display unprintable characters f12 - switches (displays symbol for spaces)
set list
" Unprintable chars mapping syntax
set listchars=tab:•\ ,trail:•,extends:»,precedes:«

" Show matching brackets when the cursor is over one
set showmatch

" When searching try to be smart about cases·
set smartcase

" Highlight search results
set hlsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Global tab width.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Customize completion menu
set completeopt=noinsert,menuone,noselect

" ----------------------------------------------------------
" Plugin-Related
" ----------------------------------------------------------

" ----- Vim-Plug Installation -----
call plug#begin()

" Syntax highlighting and colorschemes
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'

"Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Editing features
Plug 'scrooloose/nerdcommenter' " see extra configs below
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" GUI additions and navigation
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'roman/golden-ratio'

" Dash.app Documentation integration
Plug 'rizzatti/dash.vim'

" ----- Language-specific: -----
Plug 'leafoftree/vim-vue-plugin'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'tomlion/vim-solidity'

call plug#end() " call 'PlugInstall' to install new plugins

" Python configuration
let g:loaded_python_provider = 0

" ---- Plugin Configuration -----

" vim-pandoc syntax highlighting
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" vim-solidity syntax highlighting
au BufNewFile,BufRead *.sol setf solidity

" do not close the markdown preview tab when switching to other buffers
let g:mkdp_auto_close = 0

" go-to definition
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>
" note Ctr-^ takes you to the file you were last inside

" Vim-Vue highlighting for SCSS and PUG
let g:vue_pre_processors = ['pug', 'scss']
autocmd BufRead,BufNewFile *.vue setf vue
syntax sync fromstart

" Vim-Airline, status bar configuration
let g:airline_theme='gruvbox'
let g:airline#extensions#branch#enabled = 1
let g:airline_skip_empty_sections = 1

" Custom Airline theming
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" Ultisnippets configuration
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-tab>"
let g:UltiSnipsSnippetsDir = $HOME."/.config/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.config/UltiSnips']
let g:UltiSnipsEnableSnipMate = 0

" Easy MarkdownPreview
autocmd FileType md nnoremap <c-m> :MarkdownPreview<CR>


" ----- Nerd Tree -----
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>

" from medium post on how to make nerd tree better
autocmd StdinReadPre * let s:std_in=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" From github issue linked in the Nerd Tree Readme
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" openning nerdtree when starting nvim with no file args
let g:nerdtree_tabs_open_on_gui_startup=0


" ------------ NERD Commenter ------------
"  Some default mappings:
"  [count]<leader>c<space>  |NERDCommenterToggle|
"  [count]<leader>cs        |NERDCommenterSexy|

" dd spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" ----------------------------------------------------------
" colorscheme-related
" ----------------------------------------------------------

if has("unix")
  set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
  set gfn=Monospace\ 11
endif

" Set true colors for terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" color schemes
try
  colorscheme gruvbox
  let g:gruvbox_italic=1
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
  let g:gruvbox_contrast_dark='medium'
  let g:gruvbox_improved_strings=1
catch /.*/
  echo "Caught error when loading Gruvbox" . v:exception
  echo "Switching to One Half colorscheme"
  colorscheme onehalfdark
endtry

"Sets colorscheme dark mode"
set bg=dark


" ----------------------------------------------------------
" Code snippets / hotkeys
" ----------------------------------------------------------

" ----- Universal -----

" ----------------------------------------------------------
" Automatic File-level Folding Control
" ----------------------------------------------------------

" Auto-folding all functions/content inside syntax-relevant delimeters
" Filetypes may want to have their tailored folding style. For instance,
" python may have a 'setl foldmethod=indent'
setl foldmethod=indent
" You can close all folds with zM.
" Use 'zm' if you have nested folds and you want to fold level by level.
" To open folds use zR (all) and zr (level by level).

" The below is stolen from vi.stackexchange. Should allow for fold recognition
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

autocmd FileType python   compiler pylint
autocmd Filetype python   setlocal foldmethod=indent
autocmd FileType html     setlocal foldmethod=syntax
autocmd FileType json     setlocal foldmethod=syntax
autocmd Filetype vim      setlocal foldmethod=indent
autocmd FileType jsx      setlocal foldmethod=syntax
autocmd FileType js       setlocal foldmethod=syntax
autocmd BufNewFile,BufRead *.vue set syntax
