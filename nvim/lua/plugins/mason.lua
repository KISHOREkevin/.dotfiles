return{
    "williamboman/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
          automatic_enable = true,
          ensure_installed = { "lua_ls", "ts_ls","bashls","tailwindcss" },
        }
    end
}
