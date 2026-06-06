return {
  { 'nvim-telescope/telescope.nvim', enabled = false },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = { enabled = true },
      notifier = { enabled = true },
      dashboard = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },

  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
    enabled = false,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = false,
  },
  {
    "akinsho/toggleterm.nvim", version = "*",
    lazy = false,
  },
{
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  opts = {
    open_mapping = [[<c-\>]],
    direction = "float",
    float_opts = {
      border = "curved",
      width = function()
        return math.ceil(vim.o.columns * 0.85)
      end,
      height = function()
        return math.ceil(vim.o.lines * 0.8)
      end,
      winblend = 3,
    },
  },
},
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty
  },
  {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.g.compile_mode = {
        input_word_completion = true,

        -- to add ANSI escape code support, add:
        -- baleia_setup = true,

        -- to make `:Compile` replace special characters (e.g. `%`) in
        -- the command (and behave more like `:!`), add:
        -- bang_expansion = true,
      }
    end
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "c"
      },
    },
  },
}
