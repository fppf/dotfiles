"""
""" plugins:
"""   - https://github.com/vim-airline/vim-airline
"""   - https://github.com/dense-analysis/ale
"""

set nocp
set ff=unix
set ffs=unix,dos
set number
set ignorecase
set ruler

set ts=2 sw=2 expandtab
set belloff=all
set signcolumn=yes

set foldmethod=marker
set foldmarker={{{,}}}

set guicursor=i:block

syntax on
set noai

nnoremap j gj
nnoremap k gk

filetype indent on
filetype plugin on

if has('mouse')
  set mouse=a
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also https://sunaku.github.io/vim-256color-bce.html
  set t_ut=
endif

let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'rust': ['rustfmt'],
\  'haskell': ['ormolu'],
\  'ocaml': ['ocamlformat']
\}
let g:ale_linters = {
\  'rust': ['analyzer'],
\  'haskell': ['hls', 'hlint'],
\  'ocaml': ['ocamllsp']
\}
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_extensions = []
let g:ale_floating_preview = 1

highlight ALEInfo ctermfg=109 cterm=italic
highlight ALEWarning ctermfg=214 cterm=italic
highlight ALEError ctermfg=167 cterm=italic

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme gruvbox
set bg=dark
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
