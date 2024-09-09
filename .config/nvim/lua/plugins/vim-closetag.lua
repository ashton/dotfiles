local function setup(opts)
  for opt, value in pairs(opts) do
    if type(value) == "boolean" then
      value = value and 1 or 0
    end
    vim.g["closetag_" .. opt] = value
  end
end

setup {
  shortcut = ">",
  close_shortcut = "<leader>>",
  filenames = "*.html,*.xhtml,*.phtml",
  xhtml_filenames = "*.xhtml,*.jsx,*.res",
  filetypes = "html,xhtml,phtml",
  xhtml_filetypes = "xhtml,jsx,rescript",
  emptyTags_caseSensitive = true
}
