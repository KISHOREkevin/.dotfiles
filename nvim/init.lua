require("config.lazy")
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
    ["+"] = "greenclip print | head -n 1",
    ["*"] = "greenclip print | head -n 1",
  },
  cache_enabled = 1,
}
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.smartcase = true 
vim.opt.smartindent = true
vim.opt.updatetime = 300
vim.opt.scrolloff = 8
vim.o.wildmode="longest,list,full"

