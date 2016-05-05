" " Vim settings
" "
" " Vundle setup
" "   in ~/.vim/bundle
" "      git clone https://github.com/VundleVim/Vundle.vim.git
" "   start vim -> :PluginInstall
" "
" " For YouCompleteMe
" "   go to ~/.vim/bundle/YouCompleteMe
" "       ./install.py
" "
" " Optional Vundle Plugins
set nocompatible
filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'
" "" YouCompleteMe requires building some extra stuff
" "" Plugin 'https://github.com/Valloric/YouCompleteMe.git'
" Plugin 'https://github.com/tpope/vim-fireplace.git'
" Plugin 'https://github.com/tpope/vim-classpath.git'
" Plugin 'https://github.com/tpope/vim-surround.git'
" Plugin 'https://github.com/guns/vim-clojure-static.git'
" Plugin 'https://github.com/guns/vim-clojure-highlight.git'
" Plugin 'https://github.com/vim-scripts/paredit.vim.git'
" Plugin 'https://github.com/kien/rainbow_parentheses.vim.git'
" Plugin 'https://github.com/altercation/vim-colors-solarized.git'
" Plugin 'mileszs/ack.vim'
" Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'rust-lang/rust.vim'
" Plugin 'scrooloose/nerdTree'
" call vundle#end()

"" If you install vim-colors-solarized
" let g:solarized_termcolors=256
" colorscheme solarized

" Regular settings
filetype plugin indent on
syntax on
au BufNewFile,BufRead *.hy set filetype=clojure  " Use clj syntax for .hy files
set nocp
set t_Co=256         " Set colors for dark background
set background=dark
set tabstop=4        " Make all tabs 4 spaces and make 4 spaces feel like tabs
set shiftwidth=4
set softtabstop=4
set expandtab
set spell spelllang=en_us   " Turn on spellcheck
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
hi clear SpellBad
hi SpellBad cterm=underline

set cursorline  " Set cursor line highlighting
hi CursorLine cterm=NONE ctermbg=24 guibg=darkred

set esckeys       " better handling of arrow keys and such... keep vim from popping into command mode.
set ruler         " Shows percentage through file and cursor position
set showcmd       " Shows uncompleted vim commands next to the ruler
set incsearch     " Shows matches to searches before pattern is complete
set showmatch     " Show the matching thing for parens and braces (when closing is typed, cursor flashes over to the opening.)
set modeline      " Make vim look for a modeline (command in first line comment) when it loads a file up.
"set nohls         " No highlighting for searches
set noerrorbells  " Quiet!
set visualbell    " Less obnoxious to others, but you still know something went wrong.
set wildmenu      " Better command-line completion

"set smartindent   " Smart indent messes up indented lines starting with '#'
set cindent        " Make vim format code indention correctly
set cinkeys-=0#
set indentkeys-=0#
set autoindent

" Ignore case in searches unless search has uppercase
set ignorecase
set smartcase

" Setting list makes you see the list chars (lcs) This is good for makefiles and Python code, but little else
set lcs=tab:»*
set lcs+=trail:*
set listchars+=precedes:<,extends:>

" These next two lines set up file location history in my .viminfo, so when I
" exit a file and come back, I come back in at the last place I was.
set viminfo='50,\"100,:100,%,n~/.viminfo
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Set defaults for window splits
set splitbelow
set splitright

" Map ctrl+J/K/L/H to change between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set <Leader>
let mapleader=","

" Map // to search current file for visually selected text
vnoremap // y/<C-R>"<CR>

" Map f/ to ack for visually selected text
vnoremap f/ y:Ack <C-R>"<CR>

" Map d/ to ack for function definition (python)
vnoremap d/ y:Ack "def <C-R>""<CR>

" Map c/ to ack for class definition (python)
vnoremap c/ y:Ack "class <C-R>""<CR>

" NERDTree sidebar toggle (Requires NERDTree plugin) (lower-case L)
map <Leader>l :NERDTreeToggle<CR>

" Paste Mode On/Off
set pastetoggle=<Leader>p

" Toggle line numbers!
map <C-n> :call Toggle_numbers()<CR>
let num_tog = 0
func! Toggle_numbers()
    if g:num_tog == 0
        set number
        let g:num_tog = 1
    else
        set nonumber
        let g:num_tog = 0
    endif
    return
endfunc

