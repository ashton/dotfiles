return function ()
  local navic = require("nvim-navic")
	if not navic.is_available() then return "" end
	return navic.get_location()
end
