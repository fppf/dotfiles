se nocp
se ff=unix
se ffs=unix,dos
se nu
se ic
se ru
se ts=2 sw=2 expandtab
se belloff=all

sy on
se noai

if has('mouse')
  se mouse=a
endif

nnoremap j gj
nnoremap k gk

"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/owickstrom/vim-colors-paramount'
call plug#end()

filetype indent off

se foldmethod=marker
se foldmarker={{{,}}}

au BufRead,BufNewFile *.v set filetype=coq

set bg=dark
colo paramount

