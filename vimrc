se nocp
se ff=unix
se ffs=unix,dos
se nu
se ic
se ru
se ts=2 sw=2 expandtab
se belloff=all
"se colorcolum=81

sy on
se noai

nnoremap j gj
nnoremap k gk

"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
"Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
call plug#end()

colo base16-dracula
filetype indent off

