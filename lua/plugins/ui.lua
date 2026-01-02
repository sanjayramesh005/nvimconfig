-- ~/.config/nvim/lua/plugins/ui.lua

return {
	-- Theme
	{
		"folke/tokyonight.nvim",
		lazy = false, -- Load immediately
		priority = 1000, -- Load before other plugins
		opts = {
			style = "storm", transparent = false,
			term_colors = true,
			styles = {
				comments = { italic = false },
				keywords = { bold = true, italic = false },
				functions = { bold = true, italic = false },
				variables = { bold = false, italic = false },
				-- sidebars = "transparent",
			},
			sidebars = { "qf", "vista_kind", "terminal", "toggleterm" },
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = true,
			lualine_bold = false,
		},
	},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "catppuccin-latte",
				-- theme = "auto",
				-- theme = "tokyonight",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_last_session = true,
				globalstatus = false, refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 2 } },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 2 } },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			-- inactive_sections = {
			-- 	lualine_a = {},
			-- 	lualine_b = {},
			-- 	lualine_c = { { "filename", path = 1 } },
			-- 	lualine_x = { "location" },
			-- 	lualine_y = {},
			-- 	lualine_z = {},
			-- },
			tabline = {
				lualine_a = {
					{
						"tabs",
						mode = 2,
						max_length = vim.o.columns,
						tabs_color = {
							active = "lualine_a_normal",
							inactive = "lualine_c_inactive",
						},
						separator = { left = "", right = "" },
						fmt = function(name, context)
							local buflist = vim.fn.tabpagebuflist(context.tabnr)
							local winnr = vim.fn.tabpagewinnr(context.tabnr)
							local bufnr = buflist[winnr]
							local wincount = vim.fn.tabpagewinnr(context.tabnr, '$')
							return ": " .. name .. " [" .. wincount .. "]"
						end,
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
}
