-- ~/.config/nvim/lua/keymaps.lua

local map = vim.keymap.set

vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true }) -- Move left
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true }) -- Move down
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true }) -- Move up
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true }) -- Move right


-- telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- Find files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- Live grep (search by content)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- List open buffers
vim.keymap.set('n', '<leader>?', builtin.help_tags, {}) -- Search help documents

map("n", "<leader>ft", function() 
  vim.ui.input({ prompt = "Directory: ", default = vim.fn.expand("%:p:h") }, function(input)
    if input then
      builtin.find_files({ cwd = input })
    end
  end)
end, { desc = "Find files in directory (editable)" })

map("n", "<leader>fw", function()
  local search_term = vim.fn.expand("<cword>")
  if search_term and search_term ~= "" then
    builtin.grep_string({ search = search_term })
  else
    builtin.live_grep()
  end
end, { desc = "Live grep word under cursor (no boundaries)" })

-- visual mode search for selected text
map("x", "<leader>fw", function()
  -- Get the current visual selection
  vim.cmd('noau normal! "vy"')
  local visual_selection = vim.fn.getreg('v')
  
  -- Call live_grep with the selected text as the initial search query
  builtin.grep_string({ search = visual_selection })
end, { desc = "Live grep visual selection" })


-- nvim-tree toggle
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')

map("n", "<leader>e", "<Cmd>Neotree<CR>")
map("n", "|", ":Neotree reveal<cr>")
map("n", "gd", ":Neotree float reveal_file=<c-r><c-p> reveal_force_cwd<cr>")
map("n", "<leader>b", ":Neotree toggle show buffers right<cr>")
map("n", "<leader>s", ":Neotree float git_status<cr>")

-- align mappings
local NS = { noremap = true, silent = true }
-- Aligns to 1 character
vim.keymap.set( 'x', 'aa', function() require'align'.align_to_char({ length = 1, }) end, NS)
-- Aligns to 2 characters with previews
vim.keymap.set( 'x', 'ad', function() require'align'.align_to_char({ preview = true, length = 2, }) end, NS)
-- Aligns to a string with previews
vim.keymap.set( 'x', 'aw', function() require'align'.align_to_string({ preview = true, regex = false, }) end, NS)
-- Aligns to a Vim regex with previews
vim.keymap.set( 'x', 'ar', function() require'align'.align_to_string({ preview = true, regex = true, }) end, NS)
-- Example gawip to align a paragraph to a string with previews
vim.keymap.set( 'n', 'gaw', function() local a = require'align' a.operator( a.align_to_string, { regex = false, preview = true, }) end, NS)
-- Example gaaip to align a paragraph to 1 character
vim.keymap.set( 'n', 'gaa', function() local a = require'align' a.operator(a.align_to_char) end, NS)

-- copilot keymap
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

-- Linediff keymap
vim.keymap.set('v', '<leader>ld', ':Linediff<CR>')

-- Spotdiff keymaps
-- vim.keymap.set('v', '<leader>sd', ':Vdiffthis<CR>')
