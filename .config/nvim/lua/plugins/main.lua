return {
  -- basic plugins
  "tpope/vim-surround",
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },

  "norcalli/nvim_utils",
  "norcalli/nvim-colorizer.lua",

  -- text objects / operators
  { 'echasnovski/mini.ai',      version = '*' },


  -- colorschemes
  { "mhartington/oceanic-next", lazy = true },
  {
    "Luxed/ayu-vim",
    lazy = false,
    priority = 1000,
    init = function(_)
      vim.g.ayucolor = "mirage"
    end,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme ayu]])
      vim.fn["ayu#get_color"]("ui_bg")
    end,
  },
  { "luisiacc/gruvbox-baby", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "rmehri01/onenord.nvim", lazy = true },
  { "glepnir/zephyr-nvim",   lazy = true },

  -- motion plugins
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      local leap = require "leap"
      leap.opts.special_keys = {
        next_target = "<tab>",
        prev_target = "<s-tab>",
        next_group = "<space>",
        prev_group = "<tab>"
      }

      leap.add_default_mappings()
    end
  },

  -- buffers/window plugins
  "yorickpeterse/nvim-window",
  "sindrets/winshift.nvim",
  { 'echasnovski/mini.bufremove', version = '*' },

  -- formatting
  { "mhartington/formatter.nvim", opts = require "plugins/formatter" },

  -- testing tools
  "antoinemadec/FixCursorHold.nvim",
  {
    "ashton/neotest",
    config = require "plugins/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "marilari88/neotest-vitest",
      "jfpedroza/neotest-elixir",
      "rouge8/neotest-rust"
    }
  },

  -- icons
  "nvim-tree/nvim-web-devicons",
  "ryanoasis/vim-devicons", -- just in case

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require "plugins/telescope"
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require("plugins/trouble")
  },

  -- completion and LSP plugins
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      { "williamboman/mason.nvim" },           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { { "VonHeikemen/lsp-zero.nvim" } },
  },
  -- LSP specific plugins
  "nvim-lua/lsp-status.nvim", -- for statusline
  "onsails/lspkind.nvim",
  {
    "lukas-reineke/lsp-format.nvim",
    config = function(plugin, opts)
      require('lsp-format').setup(opts)
    end
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",                                 opts = require "plugins/treesitter" },
  { "nkrkv/nvim-treesitter-rescript",  dependencies = { "nvim-treesitter/nvim-treesitter" } },
  { "SmiteshP/nvim-navic",             dependencies = { "neovim/nvim-lspconfig" },          opts = require "plugins/navic" },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = require "plugins/lsp_signature",
    dependencies = { "VonHeikemen/lsp-zero.nvim" },
  },

  -- debugging
  "mfussenegger/nvim-dap",
  "mfussenegger/nvim-lint",
  { "rcarriga/nvim-dap-ui",               requires = { "mfussenegger/nvim-dap" } },


  -- UI
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require "plugins/noice",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = require "plugins/which-key"
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require "plugins/todo_comments"
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  },
  -- status bar and tabline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local config = require "plugins/lualine"
      require "lualine".setup(config)
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = require "plugins/nvim-tree"
  },

  {
    "ahmedkhalf/project.nvim",
    config = require "plugins/project".config
  },

  -- Git
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
    },
    opts = require "plugins/neogit",
    config = true
  },

  "lewis6991/gitsigns.nvim",

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    config = require "plugins/autopairs".config,
    event = "InsertEnter",
  },
  {
    "andymass/vim-matchup",
    init = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }
}
