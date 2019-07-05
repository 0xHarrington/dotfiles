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
set so=5

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ----- Useful Buffer Manipulations ----- 

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Switch between buffers quickly
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Tab between buffers
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>



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

" ----- Terminal Mode (entered with ':temrinal') ----- 
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
set incsearch        " do incremental searching
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

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases·
set smartcase

" Highlight search results
set hlsearch

" Shows the match as you're typing
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Fast scrolling/quicker inputs
set ttyfast

" Global tab width.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Customize completion menu
set completeopt=noinsert,menuone,noselect

" Auto-folding all functions/content inside syntax-relevant delimeters
" Filetypes may want to have their tailored folding style. For instance,
" python may have a 'setl foldmethod=indent'
setl foldmethod=syntax
" You can close all folds with zM. 
" Use 'zm' if you have nested folds and you want to fold level by level.
" To open folds use zR (all) and zr (level by level).


" ----------------------------------------------------------
" Plugin-Related 
" ----------------------------------------------------------

" ----- Vim-Plug Installation ----- 
call plug#begin()

" Syntax highlighting and colorschemes
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-surround'

Plug 'w0rp/ale'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'roman/golden-ratio'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ----- Language-specific: ----- 
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

Plug 'tpope/vim-markdown'

call plug#end() " call 'PlugInstall' to install new plugins


" ---- Plugin Configuration -----
" Vimtex 
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname = 'nvr'

" https://medium.com/rahasak/vim-as-my-latex-editor-f0c5d60c66fa
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'
" Use ':LLPStartPreview' to update the preview instantaneously


" Deoplete 
let g:deoplete#enable_at_startup = 1


" Vim-Airline, status bar configuration
let g:airline_theme='gruvbox'


" Ultisnippets configuration
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-tab>"
let g:UltiSnipsSnippetsDir = $HOME."/.config/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.config/UltiSnips']
let g:UltiSnipsEnableSnipMate = 0



" ----- Nerd Tree (when it eventually works) -----  
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>

" from medium post on how to make nerd tree better
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
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

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" ----------------------------------------------------------
" colorscheme-related 
" ----------------------------------------------------------

if has("linux")
  set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
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

" fzf - terminal fuzzy finding - colorscheme (made to match gruvbox)
let g:fzf_colors = {
      \ 'fg':      ['fg', 'GruvboxGray'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'GruvboxRed'],
      \ 'fg+':     ['fg', 'GruvboxGreen'],
      \ 'bg+':     ['bg', 'GruvboxBg1'],
      \ 'hl+':     ['fg', 'GruvboxRed'],
      \ 'info':    ['fg', 'GruvboxOrange'],
      \ 'prompt':  ['fg', 'GruvboxBlue'],
      \ 'header':  ['fg', 'GruvboxBlue'],
      \ 'pointer': ['fg', 'Error'],
      \ 'marker':  ['fg', 'Error'],
      \ 'spinner': ['fg', 'Statement'],
      \ }


" ----------------------------------------------------------
" Code snippets / hotkeys
" ----------------------------------------------------------

" ----- Universal ----- 

" Navigating with Luke Smith's guide character
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l<Paste>

autocmd Filetype vim setl foldmethod=syntax


" ----- LANGAUGE ----- 

augroup lang_settings
  autocmd!
  "   autocmd BufNewFile,BufRead *.xxx set tw=20
augroup END


" ----- LANGAUGE ----- 

augroup lang_settings
  autocmd!
  "   autocmd BufNewFile,BufRead *.xxx set tw=20
augroup END



" ----------------------------------------------------------
" SECTION TITLE
" ----------------------------------------------------------
