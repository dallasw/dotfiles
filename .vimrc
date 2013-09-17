" Vundle needs this off, but if it's already off, calling filetype off causes a
" bad exit status, so turn it on first.
filetype on
filetype off        " Required for Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" GitHub repos for Vundle to manage
Bundle 'nanotech/jellybeans.vim'
Bundle 'mileszs/ack.vim'

" General
filetype plugin indent on
syntax on
set nocompatible    " Turn off Vi compatibily mode
set nowrap          " Don't wrap lines
set autoindent      " Copy indent from current line when starting new one
set number          " Show line number in front of each line
set ruler           " Show line and column number
set laststatus=2    " Always display status line
set showmatch       " Show matching parens/brackets/quotes
set cursorline      " Highlight current line
colorscheme jellybeans " Make the colors prettier. <3 jellybeans
" Allow backspacing over autoindent, line breaks, & start of insert action
set backspace=indent,eol,start

" Tabs
set tabstop=4       " Number of spaces representing a tab
set shiftwidth=4    " Number of spaces to auto-indent
set softtabstop=4   " Number of spaces to move back/forward when 'tabs' are removed
set expandtab       " Use appropriate number of spaces when tab key is pressed

" Searching
set ignorecase      " Ignore case when searching
set smartcase       " Override 'ignorecase' option if search contains uppercase
set hlsearch        " Highlight search matches
" End current search highlight when enter is pressed twice.
nnoremap <CR><CR> :noh<CR><CR>

" Remap split controls to remove the 'w' key
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Autocommands
if !exists("autocommands_loaded")
    let autocommands_loaded = 1

    " Highlight trailing whitespace in normal mode
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
endif

