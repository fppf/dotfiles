"set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
autocmd vimenter * ++nested colorscheme gruvbox
lua require('config')
