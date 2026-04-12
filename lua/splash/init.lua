---	Splash plugin allows us to load a splash screen on the NeoVim
---	This should load exactly one module:
---		1.	$PWD/alpha

local specs = {}

-- Adds specs from the named `splash` submodule into the module-level `specs` list.
-- Expects the required module to return a list-like table of specs which are appended to `specs`.
-- Appends all specs from the named `splash` submodule into the module-level `specs` list.
-- @param submodule Name of the submodule under `splash` to require (e.g. "alpha").
local function add(submodule)
	local mod_specs = require("splash." .. submodule)
	vim.list_extend(specs, mod_specs)
end

add("alpha")

return specs

