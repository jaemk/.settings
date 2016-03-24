" " Vim settings
" 
" " Vundle/YouCompleteMe setup
" "   in ~/.vim/bundle/Vundle.vim
" "      git clone https://github.com/VundleVim/Vundle.vim.git
" "   
" "   start vim -> :PluginInstall
" "   
" "   go to ~/.vim/bundle/YouCompleteMe
" "       ./install.py

"" Optional Vundle Plugins
set nocompatible
filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'
" "" YouCompleteMe requires building some extra stuff
" "" Plugin 'https://github.com/Valloric/YouCompleteMe.git'
" Plugin 'https://github.com/tpope/vim-fireplace.git'
" Plugin 'https://github.com/tpope/vim-classpath.git'
" Plugin 'https://github.com/guns/vim-clojure-static.git'
" Plugin 'https://github.com/guns/vim-clojure-highlight.git'
" Plugin 'https://github.com/kien/rainbow_parentheses.vim.git'
" Plugin 'https://github.com/altercation/vim-colors-solarized.git'
" call vundle#end()

"" If you install vim-colors-solarized
" let g:solarized_termcolors=256
" colorscheme solarized

" Regular settings
filetype plugin indent on
syntax on
set nocp
set t_Co=256         " Set colors for dark background
set background=dark
set tabstop=4        " Make all tabs 4 spaces and make 4 spaces feel like tabs
set shiftwidth=4
set softtabstop=4
set expandtab
set spell spelllang=en_us   " Turn on spellcheck
hi clear SpellBad
hi SpellBad cterm=underline

set esckeys       " better handling of arrow keys and such... keep vim from popping into command mode.
set ruler         " Shows percentage through file and cursor position
set showcmd       " Shows uncompleted vim commands next to the ruler
set incsearch     " Shows matches to searches before pattern is complete
set showmatch     " Show the matching thing for parens and braces (when closing is typed, cursor flashes over to the opening.)
set modeline      " Make vim look for a modeline when it loads a file up.  So I don't go bezerk thinking I had it in there incorrectly
set nohls         " No highlighting for searches
set noerrorbells  " Quiet!
set visualbell    " Less obnoxious to others, but you still know something went wrong.
set smartindent   " Make vim format code indention correctly

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


" Cool function to keep vim's smart indenter from messing up pasted in text
" Paste Mode On/Off - Use F12 to toggle it.
map <F12> :call Paste_on_off()<CR>
set pastetoggle=<F12>
let paste_mode = 0 " 0 = normal, 1 = paste
    func! Paste_on_off()
        if g:paste_mode == 0
            set paste
            let g:paste_mode = 1
        else
            set nopaste
            let g:paste_mode = 0
        endif
        return
endfunc
