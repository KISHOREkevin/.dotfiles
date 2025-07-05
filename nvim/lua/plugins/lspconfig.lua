return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp', "williamboman/mason.nvim" , "williamboman/mason-lspconfig.nvim" },

  -- example using `opts` for defining servers
  opts = {
    servers = {
      lua_ls = {}
    }
  },
  config = function()
    local original_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require('blink.cmp').get_lsp_capabilities(original_capabilities)
    local lspconfig = require('lspconfig')
 
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
          workspace = {
            --This is the crucial part for vim API completion
            library = {
            
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/plugin")] = true,
              -- You can also add your own Lua folders if you have custom utility files
              -- [vim.fn.expand("~/.config/nvim/lua")] = true,
            },
            checkThirdParty = false, -- Set to true if you want to check external Lua libraries
          },
          -- Optional: If you want to enable sumneko_lua specific settings
          -- telemetery = { enable = false },
        }
      }
    }) 
    
    -- Setup emmet-ls in your LSP config
lspconfig.emmet_ls.setup({
  filetypes = { 'html', 'javascriptreact', 'typescriptreact' },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  }
})


    local opts = { noremap = true, silent = true, buffer = bufnr }
        -- Go to Definition
        vim.keymap.set('n', 'gd', function() Snacks.picker.lsp_definitions() end ,{desc = "Goto Definition"})
        -- Go to Declaration (often similar to definition in Lua)
        vim.keymap.set('n', 'gD',function() Snacks.picker.lsp_declarations() end ,{desc = "Goto Declaration"} )
        -- Find References
        vim.keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end ,{nowait = true, desc = "References"})
        -- Go to Implementation (less common in pure Lua, more for interfaces/abstracts)
        vim.keymap.set('n', 'gi', function() Snacks.picker.lsp_implementations() end ,{desc = "Goto Implementation"} )
        -- Go to Type Definition
        vim.keymap.set('n', 'gt', function() Snacks.picker.lsp_type_definitions() end,{desc = "Goto T[y]pe Definition"} )
        -- Hover (show documentation/type info)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- Rename symbol
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        -- Code Action (refactoring, quick fixes)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        -- Format document
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
        -- Signature Help (function arguments info)
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)

        require("ufo").setup()
  end
 -- example calling setup directly for each LSP
  }
