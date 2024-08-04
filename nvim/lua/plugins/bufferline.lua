return{
	'akinsho/bufferline.nvim', 
	version = "*", 
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function() -- start
		vim.opt.termguicolors = true
		require("bufferline").setup{ -- setup start
					} --setup end
				
	end -- end

}
