-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
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
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

-- lsp config
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"typescript",
		"scss",
		"svelte",
		"pug",
		"typescriptreact",
		"vue",
	},
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})
-- keymaps for telescope--
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find,{})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- keymaps for buffers
 
vim.keymap.set('n','<M-Tab>',":bn<CR>")
vim.keymap.set('n','<M-d>',':bdelete!<CR>:bn<CR>')
-- config for whichkey --
local wk = require("which-key")
wk.add({
  { "<leader>f", group = "file" }, -- group
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>",desc= "find buffers",mode = "n" },
  { "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>",desc="search word",mode="n"},
  {"<M-Tab>",desc="buffer next"},
  {"<M-d>",desc="buffer delete"},
      { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
  { "<leader>b", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
})
-- Neo tree keybind ---
vim.keymap.set("n","<leader>e",":Neotree reveal left  toggle  <CR>")
vim.keymap.set("n","<C-b>",":Neotree focus <CR>")
vim.lsp.set_log_level("debug")
------
-- vim.api.nvim_set_keymap("n", "p", ":!greenclip print | head -n 1<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "p", ":!greenclip print | head -n 1<CR>", { noremap = true, silent = true })

-- Code format
vim.keymap.set("n","<S-i>",":LspZeroFormat <CR>")

-- Undotree keybind
local undotree = require("undotree")
vim.keymap.set("n","<leader>u", undotree.toggle,{} )

-- my config --
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
vim.o.cmdheight=0
