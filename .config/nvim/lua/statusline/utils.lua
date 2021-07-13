local has = vim.fn.has
local system = vim.fn.system
local executable = vim.fn.executable

M = {}

function is_darwin()
  if has('macunix') then
    return true
  elseif not has('unix') then
    return false
  elseif string.find(system('uname -a'), 'Darwin') then
    return true
  end
end

function get_distro_icon()
  if not executable('lsb_release -i') then
    return ''
  end

  local lsb = system('lsb_release -i')

  if string.find(lsb, 'Arch') then
    return ''
  elseif string.find(lsb, 'Gentoo') then
    return ''
  elseif string.find(lsb, 'Ubuntu') then
    return ''
  elseif string.find(lsb, 'Cent') then
    return ''
  elseif string.find(lsb, 'Debian') then
    return ''
  elseif string.find(lsb, 'Dock') then
    return ''
  else
    return ''
  end
end

function M.get_file_format_icon(fileformat)
  if fileformat == 'dos' then
    return ''
  elseif fileformat == 'unix' then
    if is_darwin() then
      return ''
    else
      return get_distro_icon()
    end
  elseif fileformat == 'mac' then
    return ''
  end
end

return M
