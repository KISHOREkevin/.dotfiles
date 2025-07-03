return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {

    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        ---@type snacks.dashboard.Item[]

        -- Used by the `header` section
        header = [[______          __                  _______           __
|      .-----.--|  .-----.--.--.    |   _   .----.----|  |--.
|   ---|  _  |  _  |  -__|_   _|    |       |   _|  __|     |
|______|_____|_____|_____|__.__|    |___|___|__| |____|__|__|]],
      },
      sections = {
        { section = "header" },

        {
          icon = " ",
          title = "Recent Files",
          section = "recent_files",
          limit = 10,
          indent = 2,
          padding = 1
        },
        { section = "startup" },
      },
    },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      hidden = true,
      sources = {
        files = {
          finder = "files",
          format = "file",
          hidden = true,
          follow = true,
          layout = { preset = "default" },
          exclude = { "Games" }
        },
        lines = {
          finder = "lines",
          format = "lines",
          layout = {
            preset = "default",
          }
        }
      }
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = false },
    image = { enabled = true },
    toggle = {
      map = vim.keymap.set, -- keymap.set function to use
      which_key = true,     -- integrate with which-key to show enabled/disabled icons and colors
      notify = true,        -- show a notification when toggling
      -- icons for enabled/disabled states
      icon = {
        enabled = " ",
        disabled = " ",
      },
      -- colors for enabled/disabled states
      color = {
        enabled = "green",
        disabled = "yellow",
      },
      wk_desc = {
        enabled = "Disable ",
        disabled = "Enable ",
      },
    }
  },
}
