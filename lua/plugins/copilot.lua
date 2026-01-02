return {
	{ 
		"zbirenbaum/copilot.lua",
		branch = 'master',
		dependencies = { "copilotlsp-nvim/copilot-lsp" }, -- (optional) for NES functionality
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			-- See Configuration section for options
		},
	},
}
