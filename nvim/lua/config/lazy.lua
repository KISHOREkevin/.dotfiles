local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = "/"
vim.g.maplocalleader = "\\"


require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
    install = { colorscheme = { "gruvbox" } },
  checker = { enabled = false },
})



vim.keymap.set('n', '<M-S-i>', function() vim.lsp.buf.format { async = true } end, { desc = "Format Code" })
vim.keymap.set('n', "<leader><leader>", function() Snacks.picker.files() end, { desc = "File Picker" })
vim.keymap.set('n', '<leader>s', function() Snacks.picker.lines() end, { desc = "Grep word" })
vim.keymap.set('n', '<leader>h', function() Snacks.picker.help() end, { desc = "Help" })
vim.keymap.set('n','<Tab>',"<cmd>bn<CR>",{desc="buffer next"})
vim.keymap.set('n', '<leader><Tab>', function() Snacks.picker.buffers() end,{desc="List buffers"})
vim.keymap.set('n', '<M-d>', function() Snacks.bufdelete() end, {desc="buffer delete"})
vim.keymap.set('n', "<M-S-d>", function() Snacks.bufdelete.other() end, {desc="delete other buffers"})
vim.keymap.set('n', '<leader>k', function() Snacks.picker.keymaps() end,{desc="List buffers"})



-- Undotree keybind
local undotree = require("undotree")
vim.keymap.set("n", "<leader>u", undotree.toggle, { desc = "Toggle undo tree" })

-- minimap keybind
vim.keymap.set('n', "<leader>mm", function() MiniMap.toggle() end, { desc = "Mini mao Toggle" })
vim.keymap.set("n", "<leader>mf", function() MiniMap.toggle_focus() end, { desc = "Toggle minimap focus" })

-- my config --
vim.g.snacks_animate = true
vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set ttimeoutlen=100")
--vim.cmd("set termguicolors")
vim.cmd("nnoremap <Down> gj")
vim.cmd("nnoremap <Up> gk")
vim.cmd("inoremap <Down> <C-o>gj")
vim.cmd("inoremap <Up> <C-o>gk")
vim.cmd("vnoremap <Down> gj")
vim.cmd("vnoremap <Up> gk")
vim.cmd(":inoremap <Space> <Space><C-g>u")
vim.o.cmdheight = 0
