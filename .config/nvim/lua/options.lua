local options = {
  -- gui
  termguicolors = true,
  background = "dark",
  -- tab spacing
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smarttab = true,
  -- ui
  showmatch = true,
  laststatus = 2,  -- always
  showtabline = 2, -- always
  shortmess = "filnxtToOFc",
  cmdheight = 2,
  showmode = false,
  wildmenu = true,
  updatetime = 300,
  timeoutlen = 500,
  signcolumn = "auto",
  --splits
  splitbelow = true,
  splitright = true,
  -- search
  incsearch = true,
  hlsearch = true,
  ignorecase = true,
  smartcase = true,
  -- backupfiles
  directory = "/tmp",
  backup = false,
  writebackup = false,
  hidden = true,
  mouse = "a"
}

local window_options = {
  -- ui
  number = true,
  relativenumber = false,
  cursorline = true,
  foldlevel = 99,
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()"
}

local buffer_options = {
  -- tab spacing
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true
}

local globals = {
  loaded_netrw = 1,
  loaded_netrwPlugin = 1
}

local opts_vim_table = {
  { globals,        vim.g },
  { options,        vim.o },
  { window_options, vim.wo },
  { buffer_options, vim.bo }
}

for _, element in pairs(opts_vim_table) do
  local config = element[1]
  local vim_table = element[2]
  for config_name, config_value in pairs(config) do
    vim_table[config_name] = config_value
  end
end
