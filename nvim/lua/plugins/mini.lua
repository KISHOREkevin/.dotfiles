return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
   -- require('mini.statusline').setup()
    require('mini.map').setup({
      integrations={  require('mini.map').gen_integration.builtin_search(),
        require('mini.map').gen_integration.diagnostic()}
    })
    require('mini.splitjoin').setup()
    require('mini.comment').setup()
    require('mini.pairs').setup()
    require('mini.surround').setup()

  end
}
