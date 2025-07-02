return{
	'akinsho/bufferline.nvim', 
	version = "*", 
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function() -- start
		vim.opt.termguicolors = true
		require("bufferline").setup{
      options = {
      offsets = {
        {
          filetype = 'snacks_layout_box',
          text = 'Explorer',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },-- setup start
		} 
	end 

}
