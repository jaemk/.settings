" Vim settings

" Vundle/YouCompleteMe setup
"   in ~/.vim/bundle/Vundle.vim
"      git clone https://github.com/VundleVim/Vundle.vim.git
"   
"   start vim -> :PluginInstall
"   
"   go to ~/.vim/bundle/YouCompleteMe
"       ./install.py

" Vundle Settings
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"" Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/tpope/vim-fireplace.git'
Plugin 'https://github.com/tpope/vim-classpath.git'
Plugin 'https://github.com/guns/vim-clojure-static.git'
Plugin 'https://github.com/guns/vim-clojure-highlight.git'
Plugin 'https://github.com/kien/rainbow_parentheses.vim.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
call vundle#end()

" Regular settings
filetype plugin indent on
syntax on
let g:solarized_termcolors=256
set t_Co=256 
set background=dark
colorscheme solarized
set tabstop=4
set shiftwidth=4
set expandtab
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
