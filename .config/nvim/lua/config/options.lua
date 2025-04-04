vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local options = {
  -- disable netrw
  --loaded_netrw = 1,
  --loaded_netrwPlugin = 1,

  -- sync with system clipboard
  clipboard = "unnamedplus",

  completeopt = { "menu", "menuone", "noselect" },

  -- Hide * markup for bold and italic, but not markers with substitutions
  conceallevel = 2,

  -- Enable highlight of the current line
  cursorline = true,

  -- Use spaces instead of tabs
  expandtab = true,
  fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
  },

  -- Fold options
  foldlevel = 99,
  foldmethod = "expr",
  foldexpr = "v:lua.require'utils.fold'.foldexpr()",
  foldtext = "",

  -- Text format
  formatexpr = "v:lua.vim.lsp.formatexpr({ timeout_ms = 3000 })",
  formatoptions = "jcroqnt",

  -- Grep
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",

  -- Search options
  ignorecase = true,
  smartcase = true,
  incsearch = true,

  inccommand = "nosplit",
  jumpoptions = "view",

  showtabline = 1,  -- only show tabline if there is at least 2 tabpages
  laststatus = 3,   -- global status line
  linebreak = true, -- wrap lines at convenient points
  list = true,      -- show some invisible characters (tabs ...)

  mouse = "a",      -- enable mouse mode

  -- Popup Options
  pumblend = 10,  -- pseudo transparency for popup menu
  pumheight = 10, -- maximum number of entries in a popup

  -- Line number options
  number = true,          -- print line number
  relativenumber = false, -- show absolute line numbers
  ruler = false,
  scrolloff = 8,          -- min # of lines around the cursor
  sidescrolloff = 10,     -- min # of colums

  sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" },

  -- Indentation options
  shiftwidth = 2,    -- indentation size
  shiftround = true, -- round indentation to a multiple of shiftwidth
  smartindent = true,
  smarttab = true,

  shortmess = { l = true, t = true, T = true, o = true, O = true, F = true, W = true, I = true, c = true, C = true },

  showmode = false,
  signcolumn = "yes",

  -- Splits options
  splitbelow = true,
  splitright = true,
  splitkeep = "screen",

  termguicolors = true,
  timeoutlen = 300,
  updatetime = 200,
  virtualedit = "block", -- Allow cursor to move where there is no text in visual block mode
  wildmenu = true,
  wildmode = { "longest:full", "full" },
  winminwidth = 5, -- min win witdth
  wrap = false,    -- Disable line wrap
  smoothscroll = true,

  showmatch = true,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
