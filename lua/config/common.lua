vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = false
vim.cmd('filetype plugin indent on')

vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard = "unnamedplus"

vim.opt.statusline = "%F %m%r%h%w%= %y [%l,%c] %p%%"

vim.opt.termguicolors = true
vim.cmd('colorscheme tokyonight')

-- require('fzf-lua').setup({
--   files = {
--     debug = true, -- Set to true to see debug info for the 'files' picker
--     -- other options
-- 
--     -- find_opts = "--hidden --follow -type f \\! -not -path '*/.git/*'",
--     -- rg_opts = "--files --hidden --follow -g '!.git'",
--   },
--   live_grep = {
--     debug = true, -- Set to true for live_grep picker
--   },
--   -- other pickers or global options
-- })
-- 
-- require("neo-tree").setup({
--     close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
--     -- other settings...
-- })


vim.api.nvim_set_hl(0, "@type", { bold = true, fg = "#1c99f3" })
vim.api.nvim_set_hl(0, "@type.builtin", { bold = true, fg = "#29a4bd" })
vim.api.nvim_set_hl(0, "PreProc", { bold = true, fg = "#7dcfff" })
vim.api.nvim_set_hl(0, "@variable", { fg = "#ffffff" })

vim.opt.winhighlight = "StatusLineNC:StatusLine"
