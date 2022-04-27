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
    use {"wbthomason/packer.nvim", opt = true}
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
    use "kyazdani42/nvim-web-devicons"
    -- just in case
    use "ryanoasis/vim-devicons"

    -- Fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
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
      "neovim/nvim-lspconfig",
      "williamboman/nvim-lsp-installer"
    }
    use "nvim-lua/lsp-status.nvim" -- for statusline
    -- use {"RishabhRD/nvim-lsputils", requires = {"RishabhRD/popfix"}} -- better lsp actions
    use {"tami5/lspsaga.nvim", branch = "nvim6.0"}
    use "onsails/lspkind-nvim" -- completion symbols like vscode
    -- use "ray-x/lsp_signature.nvim" -- function signature help
    use "folke/lsp-colors.nvim" -- colorful diagnostic messages
    -- use 'jubnzv/virtual-types.nvim'
    -- until lsp_install supports it:
    use "rescript-lang/vim-rescript"
    use {
      "rmagatti/goto-preview",
      config = function()
        require 'plugins/goto-preview'.setup()
      end
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }

    -- Status and Tab lines
    use "romgrk/barbar.nvim"
    use 'feline-nvim/feline.nvim'
    use "nvim-lualine/lualine.nvim"

    -- File tree
    use {"kyazdani42/nvim-tree.lua", requires = {"kyazdani42/nvim-web-devicons"}}

    -- Git
    use {"TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim"}

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
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}

    -- colorschemes
    use "Shatur/neovim-ayu"
  end
)
