vim.keymap.set("n", "<S-Right>", ":vertical resize +5<CR>",
  { desc = "resize window vertically +5", silent = true })
vim.keymap.set("n", "<S-Left>", ":vertical resize -5<CR>",
  { desc = "resize window vertically -5", silent = true })
vim.keymap.set("n", "<S-Up>", ":resize +5<CR>",
  { desc = "resize window horizontally +5", silent = true })
vim.keymap.set("n", "<S-Down>", ":resize -5<CR>",
  { desc = "resize window horizontally -5", silent = true })

return {
  ["<leader>"] = {
    w = {
      name = "+windows",
      d = { "<C-W>q", "delete window" },
      h = { "<C-W><C-H>", "go to window at left" },
      j = { "<C-W><C-J>", "go to window below" },
      k = { "<C-W><C-K>", "go to window above" },
      l = { "<C-W><C-L>", "go to window at right" },
      p = { function() require "nvim-window".pick() end, "pick window" },
      s = { "<C-W><C-S>", "split window below" },
      v = { "<C-W><C-V>", "split window right" }
    }
  }
}
