return {
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	branch = 'master',
	-- 	lazy = false,
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	opts = {}
	-- },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			toggle = true,
			use_libuv_file_watcher = true,
			follow_current_file = {
				enabled = true
			},
			close_if_last_window = true,
		},
	}
}
