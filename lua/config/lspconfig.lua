local lspconfig = vim.lsp.config
-- Lua
vim.lsp.enable('stylua')

-- Python (using pyright)
vim.lsp.config('pyright', {})
vim.lsp.enable('pyright')

-- R (using R_language_server)
vim.lsp.config('r_language_server', {})
vim.lsp.enable('r_language_server')

-- Register nvim-cmp lsp capabilities
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- lspconfig.util.default_config.capabilities = capabilities
