return{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
	  -- Lua
	require('lualine').setup {
  	options = {
    -- ... your lualine config
    		theme = 'tokyonight-night'
    -- ... your lualine config
  		}
  	}
	vim.cmd.colorscheme("tokyonight-night");
  end
 }
