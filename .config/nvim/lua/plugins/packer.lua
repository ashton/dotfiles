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
    use "hrsh7th/nvim-compe"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "nvim-lua/lsp-status.nvim" -- for statusline
    use "glepnir/lspsaga.nvim"
    use "RishabhRD/popfix"
    use "RishabhRD/nvim-lsputils" -- better lsp actions
    use "onsails/lspkind-nvim" -- completion symbols like vscode
    use "ray-x/lsp_signature.nvim" -- function signature help
    use "folke/lsp-colors.nvim" -- colorful diagnostic messages
    -- use 'jubnzv/virtual-types.nvim'
    -- until lsp_install supports it:
    use "rescript-lang/vim-rescript"

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }

    -- Status and Tab lines
    use "romgrk/barbar.nvim"
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      config = function()
        require "statusline"
      end,
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    -- File tree
    use {"kyazdani42/nvim-tree.lua", requires = {"kyazdani42/nvim-web-devicons"}}

    -- Git
    use {"TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim"}
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

    -- Auto Pairs
    use "windwp/nvim-autopairs"
    use "andymass/vim-matchup"

    -- Scratchpads
    use "metakirby5/codi.vim"

    -- Snippets

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
  end
)
