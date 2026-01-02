return {
  'nvim-telescope/telescope.nvim', tag = '0.1.x',
  -- or tag = '0.1.1' (latest stable release)
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  -- Optional: FZF native extension for performance
  build = 'cmake -B build -S .',
  'nvim-telescope/telescope-fzf-native.nvim',
}
