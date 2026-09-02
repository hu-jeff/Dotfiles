set belloff=all
set mouse=a
set incsearch
set number
set smarttab
set noshowmode
set hidden
set formatoptions-=cro
set guicursor=
set laststatus=1

autocmd VimEnter * highlight clear Conceal

colorscheme onedark

lua vim.lsp.enable({ 'rust_analyzer', 'clangd', 'pyright' })

lua << EOF
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  end,
})
EOF
