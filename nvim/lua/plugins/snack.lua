return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
   
    bigfile = { enabled = true },
    dashboard = {
      preset = { 
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
               ---@type snacks.dashboard.Item[]
        
        -- Used by the `header` section
        header = [[
 ______          __                  _______           __
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
    explorer = { enabled = true },
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
          layout = { preset = "bottom" },
          exclude = { "Games" }
        },
        explorer = {
          finder = "explorer",
          hidden = true,
          sort = { fields = { "sort" } },
          supports_live = true,
          tree = true,
          watch = true,
          diagnostics = true,
          diagnostics_open = true,
          git_status = true,
          git_status_open = false,
          git_untracked = true,
          follow_file = true,
          focus = "list",
          jump = { close = false },
          -- to show the explorer to the right, add the below to
          -- your config under `opts.picker.sources.explorer`
          -- layout = { layout = { position = "right" } },
          formatters = {
            file = { filename_only = true },
            severity = { pos = "right" },
          },
          matcher = { sort_empty = false, fuzzy = true },
          config = function(opts)
            return require("snacks.picker.source.explorer").setup(opts)
          end,

          layout = { preset = "sidebar",preview=false, cycle = false,layout={width=25} },
          auto_close = false,
          win = {
            list = {
              keys = {
                ["<BS>"] = "explorer_up",
                ["l"] = "confirm",
                ["h"] = "explorer_close", -- close directory
                ["a"] = "explorer_add",
                ["d"] = "explorer_del",
                ["r"] = "explorer_rename",
                ["c"] = "explorer_copy",
                ["m"] = "explorer_move",
                ["o"] = "explorer_open", -- open with system application
                ["P"] = "toggle_preview",
                ["y"] = { "explorer_yank", mode = { "n", "x" } },
                ["p"] = "explorer_paste",
                ["u"] = "explorer_update",
                ["<c-c>"] = "tcd",
                ["<leader>/"] = "picker_grep",
                ["<c-t>"] = "terminal",
                ["."] = "explorer_focus",
                ["I"] = "toggle_ignored",
                ["H"] = "toggle_hidden",
                ["Z"] = "explorer_close_all",
                ["]g"] = "explorer_git_next",
                ["[g"] = "explorer_git_prev",
                ["]d"] = "explorer_diagnostic_next",
                ["[d"] = "explorer_diagnostic_prev",
                ["]w"] = "explorer_warn_next",
                ["[w"] = "explorer_warn_prev",
                ["]e"] = "explorer_error_next",
                ["[e"] = "explorer_error_prev",
              },
            },
          },

        }
      }
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = false },
    image = { enabled = true }
  },
}
