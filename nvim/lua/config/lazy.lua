-- Bootstrap lazy.nvim
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
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})



vim.keymap.set('n', '<M-S-i>', function() vim.lsp.buf.format { async = true } end, {})
vim.keymap.set('n', "<leader>ff", function() Snacks.picker.files() end)
vim.keymap.set('n', '<leader>fs', function() Snacks.picker.grep_word() end, {})
vim.keymap.set('n', '<leader>fb', function() Snacks.picker.buffers() end, {})
vim.keymap.set('n', '<leader>fh', function() Snacks.picker.help() end, {})

-- keymaps for buffers

vim.keymap.set('n', '<M-Tab>', function() Snacks.picker.buffers() end)
vim.keymap.set('n', '<M-d>', function() Snacks.bufdelete() end, {})
vim.keymap.set('n', "<M-S-d>", function() Snacks.bufdelete.other() end, {})
vim.keymap.set('n', '//', function()
  local explorer_pickers = Snacks.picker.get({ source = "explorer" })
  if #explorer_pickers == 0 then
    Snacks.picker.explorer()
    -- elseif explorer_pickers[1]:is_focused() then
    -- 	explorer_pickers[1]:close()
  else
    explorer_pickers[1]:focus()
  end
end, {})
-- config for whichkey --
local wk = require("which-key")
wk.add({
  { "<leader>f",  group = "file" }, -- group
  { "<leader>ff", desc = "Find File",          mode = "n" },
  { "<leader>fb", desc = "find buffers",       mode = "n" },
  { "<leader>fs", desc = "search word",        mode = "n" },
  { "<M-Tab>",    desc = "buffer next" },
  { "<M-d>",      desc = "buffer delete" },
  { "<M-S-d>",    desc = "Other buffer delete" },
  { "<leader>w",  proxy = "<c-w>",             group = "windows" }, -- proxy to window mappings
  {
    "<leader>b",
    group = "buffers",
    expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  {
    mode = { "n", "v" },                          -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
})


-- Undotree keybind
local undotree = require("undotree")
vim.keymap.set("n", "<leader>u", undotree.toggle, {})

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
vim.cmd("nnoremap <Down> gj")
vim.cmd("nnoremap <Up> gk")
vim.cmd("inoremap <Down> <C-o>gj")
vim.cmd("inoremap <Up> <C-o>gk")
vim.cmd("vnoremap <Down> gj")
vim.cmd("vnoremap <Up> gk")
vim.cmd(":inoremap <Space> <Space><C-g>u")
vim.o.cmdheight = 0
