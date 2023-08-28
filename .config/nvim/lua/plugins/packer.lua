local fn = vim.fn

-- ensure packer is installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd "packadd packer.nvim"

local packer = require "packer"
local util = require "packer/util"

packer.init(
  {
    package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
  }
)

-- startup and add configure plugins
packer.startup(
  function(use)
    -- basic plugins
    use { "wbthomason/packer.nvim", opt = true }
    use "mhartington/oceanic-next"
    use "tpope/vim-surround"
    use "tpope/vim-commentary"
    use "tpope/vim-repeat"
    use "norcalli/nvim_utils"

    -- motions
    use "ggandor/lightspeed.nvim"

    -- formatting
    use "mhartington/formatter.nvim"

    -- test files
    use "vim-test/vim-test"

    -- icons
    use "nvim-tree/nvim-web-devicons"
    -- just in case
    use "ryanoasis/vim-devicons"

    -- Fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } }
    }

    use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        local options = require("plugins/trouble")
        require("trouble").setup(options)
      end
    }

    -- completion
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/nvim-cmp"

    -- LSP
    use {
      "williamboman/mason.nvim",
      run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }

    use "williamboman/mason-lspconfig.nvim"

    use {
      "neovim/nvim-lspconfig"
    }
    use "nvim-lua/lsp-status.nvim" -- for statusline
    use {
      "folke/noice.nvim",
      config = function()
        local options = require("plugins/noice")
        require("noice").setup(options)
      end,
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify"
      }
    }
    use {
      "j-hui/fidget.nvim",
      tag = "legacy",
      config = function()
        require("fidget").setup {}
      end
    }
    use "lukas-reineke/lsp-format.nvim"
    use "folke/lsp-colors.nvim" -- colorful diagnostic messages
    -- until lsp_install supports it:
    use "rescript-lang/vim-rescript"

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }

    use "nkrkv/nvim-treesitter-rescript"

    -- Status and Tab lines
    use "romgrk/barbar.nvim"
    use "feline-nvim/feline.nvim"
    use "nvim-lualine/lualine.nvim"

    -- File tree
    use { "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }

    -- Git
    use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }

    use {
      "lewis6991/gitsigns.nvim",
      tag = "release",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }

    -- Auto Pairs
    use "windwp/nvim-autopairs"
    use "andymass/vim-matchup"
    use "alvan/vim-closetag"

    -- Scratchpads
    use "metakirby5/codi.vim"

    -- Snippets
    use "dcampos/nvim-snippy"
    use "honza/vim-snippets"
    use "dcampos/cmp-snippy"

    -- Whichkey
    use "folke/which-key.nvim"

    -- TODO and such for exploring
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {}
      end
    }

    -- Colorizer
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require "colorizer".setup()
      end
    }

    -- debugging
    use "mfussenegger/nvim-dap"
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- colorschemes
    use "Luxed/ayu-vim"
    use "luisiacc/gruvbox-baby"
    use "rebelot/kanagawa.nvim"
    use "rmehri01/onenord.nvim"
    use "glepnir/zephyr-nvim"
  end
)
