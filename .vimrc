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
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
call vundle#end()

" Regular settings
filetype plugin indent on
colo desert
syntax on
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
