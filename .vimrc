" BUNDLE INIT
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
" Plugin 'preservim/nerdcommenter'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'github/copilot.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'kristijanhusak/vim-js-file-import'
Plugin 'Yggdroot/LeaderF'
Plugin 'tpope/vim-fugitive'
Plugin 'tomasiser/vim-code-dark'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'bounceme/restclient.vim'
Plugin 'ayu-theme/ayu-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" let g:NERDCompactSexyComs = 1
" let g:NERDCommentEmptyLines = 1
" let g:NERDToggleCheckAllLines = 1



" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" BUNDLE END
" GENERAL CONFIG:
"highlight Search guibg='Purple' guifg='NONE'
set relativenumber
set number
set termguicolors
set smartindent
set background=dark
set ignorecase

set t_Co=256            " iTerm2 supports 256 color mode. 
set ai                  " auto indenting
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
syntax on               " syntax highlighting
"filetype plugin on      " use the file type plugins

" colorscheme dracula
let ayucolor="mirage"   " for dark version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme default
" let g:airline_theme = 'codedark'
let g:airline_theme = 'dracula'



set showmode                    " always show what mode we're currently editing in

set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set noexpandtab                 " don't expand tabs to spaces by default
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting

set showmatch                   " set show matching parenthesis
"set smarttab                    " insert tabs on the start of a line according to
"    shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling

set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type

" white space characters
set nolist
set listchars=eol:$,tab:.\ ,trail:.,extends:>,precedes:<,nbsp:_
highlight SpecialKey term=standout ctermfg=darkgray guifg=darkgray
" display white space characters with F3
nnoremap <F3> :set list! list?<CR>

" no indent on paste
set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"set mouse=a                     " enable using the mouse if terminal emulator supports it
" turned off - it kills copy/paste

" Editor layout {{{
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
"    if there is only one window
set cmdheight=1                 " use a status bar that is 1 rows high

" Vim behaviour {{{
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
	set undofile                " keep a persistent backup file
	set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
"    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
" store swap files in one of these directories
"    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
"    than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
"    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
"set visualbell                  " don't beep
"set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
"    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
			\ if ! exists("g:leave_my_cursor_position_alone") |
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\ exe "normal g'\"" |
			\ endif |
			\ endif

""Abreviaciones
iab _comentario //---------Comentario------------//
iab _chtml <!--comentario-->
iab _micorreo danielnc43@gmail.com
iab _minombre Pablo Daniel Can Aké
iab _r print_r();
iab _clog console.log();
iab _dum var_dump();


execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" easymotion launch
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
let mapleader=" "
let g:EasyMotion_use_smartsign_us = 1 
nmap <Leader>s <Plug>(easymotion-overwin-w)
nmap <Leader>S <Plug>(easymotion-overwin-f2)
" nmap <Leader>s <Plug>(easymotion-s2)

" nerdtree lauch
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

noremap <leader>/ :Commentary<cr>

" gutentags ignoring node_modules, amplify and vendor, git, etc
" let g:gutentags_project_root = ['.root', '.git', '.svn', '.hg', '.project', '.vim']
" let g:gutentags_ctags_exclude = ['node_modules', 'vendor', 'amplify', 'tmp', 'log', 'logs', 'cache', 'public', 'assets', 'uploads', 'storage', 'dist', 'build', 'compiled', 'compiled_templates', 'compiled_templates', 'compiled_templates']


let g:gutentags_ctags_exclude = ['.git/**', 'node_modules/**', 'vendor/**', 'amplify/**', 'tmp/**', 'log/**', 'logs/**', 'cache/**', 'public/**', 'assets/**', 'uploads/**', 'storage/**', 'dist/**', 'build/**', 'compiled/**', 'compiled_templates/**', 'compiled_templates/**', 'compiled_templates/**']

" autocmd VimEnter,VimLeave * silent !tmux set status  
" Hide tmux status bar when entering Vim and show it when leaving Vim. Only in the current pane.
" autocmd VimEnter,VimLeave * silent !tmux set status | redraw

