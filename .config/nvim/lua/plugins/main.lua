return {
  -- basic plugins
  "tpope/vim-surround",
  "tpope/vim-repeat",
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },

  "norcalli/nvim_utils",
  "norcalli/nvim-colorizer.lua",

  -- text objects / operators
  {
    'echasnovski/mini.ai',
    version = '*',
    opts = require("plugins/mini-ai")

  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  },


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
  { "luisiacc/gruvbox-baby",    lazy = true },
  { "rebelot/kanagawa.nvim",    lazy = true },
  { "rmehri01/onenord.nvim",    lazy = true },
  { "glepnir/zephyr-nvim",      lazy = true },

  -- motion plugins
  {
    "ggandor/lightspeed.nvim",
    event = "BufReadPost", -- later or on keypress would prevent saving folds
    keys = {
      {
        "s",
        "<Plug>Lightspeed_s",
        mode = { "n", "x" }
      },
      {
        "S",
        "<Plug>Lightspeed_S",
        mode = { "n", "x" }
      },
      {
        "x",
        "<Plug>Lightspeed_x",
        mode = { "o" }
      },
      {
        "X",
        "<Plug>Lightspeed_X",
        mode = { "o" }
      },
      {
        "z",
        "<Plug>Lightspeed_z",
        mode = { "o" }
      },
      {
        "z",
        "<Plug>Lightspeed_Z",
        mode = { "o" }
      },
      {
        "f",
        "<Plug>Lightspeed_f",
        mode = { "n" }
      },
      {
        "F",
        "<Plug>Lightspeed_F",
        mode = { "n" }
      },
      {
        "t",
        "<Plug>Lightspeed_t",
        mode = { "n" }
      },
      {
        "T",
        "<Plug>Lightspeed_T",
        mode = { "n" }
      }
    },
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
        desc = "end of the subword"
      },
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
        desc = "begin of the next subword"
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
        desc = "begin of the previous subword"
      },
      {
        "ge",
        "<cmd>lua require('spider').motion('ge')<CR>",
        mode = { "n", "o", "x" },
        desc = "end of the previous subword"
      },
    },
  },

  -- code editing plugins
  {
    "gbprod/yanky.nvim",
    dependencies = { { "kkharji/sqlite.lua" } },
    opts = require("plugins/yanky"),
    keys = {
      { "gp", "<Plug>(YankyPutAfter)",   mode = { "n" } },
      { "gP", "<Plug>(YankyPutBefore)",  mode = { "n" } },
      { "p",  "<Plug>(YankyGPutAfter)",  mode = { "n" } },
      { "P",  "<Plug>(YankyGPutBefore)", mode = { "n" } },
      { "y",  "<Plug>(YankyYank)",       mode = { "n", "x" } }
    }
  },
  {
    'Wansmer/treesj',
    keys = { '<space>crs', '<space>crj' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = { use_default_keymaps = false }
  },

  {
    "chrisgrieser/nvim-origami",
    event = "BufReadPost", -- later or on keypress would prevent saving folds
    opts = true,
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
  'mortepau/codicons.nvim',

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require "plugins/telescope".config
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    "benfowler/telescope-luasnip.nvim",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = require("plugins/trouble").config
  },
  {
    "FeiyouG/commander.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" }
  },

  -- completion and LSP plugins
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lsp_config = 0
    end,
  },
  -- LSP Support
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { "L3MON4D3/LuaSnip" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
    },
    config = require("plugins/nvim-cmp").config,
  },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = require('lsp').config
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { { "williamboman/mason.nvim" } }
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  -- LSP specific plugins
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    config = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
  },
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  },
  "nvim-lua/lsp-status.nvim", -- for statusline
  "onsails/lspkind.nvim",
  {
    "lukas-reineke/lsp-format.nvim",
    opts = function()
      return {}
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { { "LiadOz/nvim-dap-repl-highlights" } },
    config = require "plugins/treesitter".config
  },
  {
    "nkrkv/nvim-treesitter-rescript",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = require "plugins/navic"
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = require "plugins/lsp_signature",
    dependencies = { "VonHeikemen/lsp-zero.nvim" },
  },

  -- debugging
  {
    "mfussenegger/nvim-dap",
    config = require "plugins/dap".config
  },
  "mfussenegger/nvim-lint",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" }
  },
  { "LiadOz/nvim-dap-repl-highlights",          opts = {} },
  { "theHamsta/nvim-dap-virtual-text",          opts = { commented = true } },
  {
    "rcarriga/cmp-dap",
    dependencies = { { "nvim-dap" } }
  },

  -- UI
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = require("plugins/ibl")
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require "plugins/noice",
    dependencies = {
      "MunifTanjim/nui.nvim",
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
  },
  {
    "FeiyouG/commander.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = require("plugins/commander").config
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
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }
}
