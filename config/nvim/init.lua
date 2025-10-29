vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.pack.add({
  "https://github.com/sainnhe/gruvbox-material",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mhinz/vim-signify",
  "https://github.com/junegunn/fzf",
  "https://github.com/junegunn/fzf.vim",
})

vim.cmd.colorscheme("gruvbox-material")

vim.lsp.enable({
  "clangd",
  "rust_analyzer"
})

vim.diagnostic.config({ virtual_text = true })
