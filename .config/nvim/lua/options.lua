local global_options = {
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
  laststatus = 2, -- always
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

for name, value in pairs(global_options) do
  vim.o[name] = value
end

for name, value in pairs(window_options) do
  vim.wo[name] = value
end

for name, value in pairs(buffer_options) do
  vim.bo[name] = value
end

-- used to load the buffer with all folders opened
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "*",
  command = "silent! :%foldopen!"
})

