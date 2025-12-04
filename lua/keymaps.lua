-- ~/.config/nvim/lua/keymaps.lua

local map = vim.keymap.set

vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true }) -- Move left
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true }) -- Move down
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true }) -- Move up
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true }) -- Move right


-- fzf keymaps
local fzf_lua = require('fzf-lua')

-- Normal mode mappings
map("n", "<leader>ff", fzf_lua.files, { desc = "Find files" })
map("n", "<leader>fg", fzf_lua.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", fzf_lua.buffers, { desc = "Find buffers" })
map("n", "<leader>fw", function()			-- normal mode search for the word under the cursor
  local search_term = vim.fn.expand("<cword>")
  if search_term and search_term ~= "" then
    -- Escape the search term to ensure it works correctly with ripgrep
    require('fzf-lua').live_grep({ search = vim.fn.escape(search_term, ' \n') })
  else
    require('fzf-lua').live_grep()
  end
end, { desc = "Live grep word under cursor (no boundaries)" })

-- visual mode search for selected text
map("x", "<leader>fw", function()
  -- Get the current visual selection
  local visual_selection = require('fzf-lua.utils').get_visual_selection()

  -- Escape potential special characters in the search term for ripgrep
  local search_term = vim.fn.escape(visual_selection, ' \n')

  -- Call live_grep with the selected text as the initial search query
  require('fzf-lua').live_grep({ search = search_term })
end, { desc = "Live grep visual selection" })

-- nvim-tree toggle
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')

map("n", "<leader>e", "<Cmd>Neotree<CR>")
map("n", "|", ":Neotree reveal<cr>")
map("n", "gd", ":Neotree float reveal_file=<c-r><c-p> reveal_force_cwd<cr>")
map("n", "<leader>b", ":Neotree toggle show buffers right<cr>")
map("n", "<leader>s", ":Neotree float git_status<cr>")
