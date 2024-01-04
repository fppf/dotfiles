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
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'arthurxavierx/vim-unicoder'
call plug#end()

colo nord
filetype indent off

if has('mouse')
  se mouse=a
endif

se foldmethod=marker
se foldmarker={{{,}}}

