return function ()
  local function is_new_file()
    local filename = vim.fn.expand('%')
    return filename ~= '' and vim.bo.buftype == '' and vim.fn.filereadable(filename) == 0
  end

  local result = vim.fn.expand("%:~:h")
  local home = os.getenv("HOME")

  if home and vim.startswith(result, home) then
    result = "~" .. result:sub(home:len() + 1)
  end

  if is_new_file() then
    result = result .. " "
  elseif vim.bo.modified then
    result = result .. " 󰷫"
  elseif vim.bo.readonly then
    result = result .. " 󰌾"
  end

  return result
end
