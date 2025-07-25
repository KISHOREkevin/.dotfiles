require("config.lazy")
--vim.o.background = "dark" -- or "light" for light mode

vim.o.cursorline=true
vim.o.number=true
vim.opt.clipboard="unnamedplus"
vim.g.clipboard = {
  name = "greenclip",
  copy = {
    ["+"] = "xclip -selection clipboard -in",
    ["*"] = "xclip -selection clipboard -in",
  },
  paste = {
    ["+"] = "sh -c 'greenclip print|head -n 1'",
    ["*"] = "sh -c 'greenclip print|head -n 1'",
  },
  cache_enabled = 1,
}
--vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.smartcase = true 
vim.opt.smartindent = true
vim.opt.updatetime = 300
vim.opt.scrolloff = 8
-- UFO folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.o.wildmode="longest,list,full"
-- In your init.lua or a dedicated diagnostics config file
vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    -- You can set a min severity if you only want higher-priority errors
    -- severity = { min = 'hint' },
    -- Always show diagnostics, even in visual mode (less likely to be the issue here, but worth being explicit)
    -- This specific option isn't directly 'visual mode' related but ensures virtual text rendering is general
    update_in_insert = false, -- Generally good practice not to show virtual text while typing
  },
  signs = true, -- Enable signs in the sign column
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  underline = true, -- Underline problematic code
})
vim.g.minitrailspace_disable=true
