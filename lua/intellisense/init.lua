---	Intellisense plugin setup
---		Intellisense is an intelligent code completion and suggestion engine.
---		It uses three major components,
---			a language support server (LSP),
---			a code completion engine (CMP),
---			a UI
---
---	Our mapping will handle in these three import sections
---	$PWD
---		/lsp.lua	(for language support server)
---		/cmp.lua	(for code completion engine)
---		/ui.lua		(for the user interface)
---
---	Also, this module should be `Lazy` compliant

local specs = {}

-- Adds specs from the named `intellisense` submodule into the module-level `specs` list.
-- Expects the required module to return a list-like table of specs which are appended to `specs`.
-- @param submodule The submodule name under `intellisense` to require (e.g. "ui", "cmp", "lsp").
local function add(submodule)
	local mod_specs = require("intellisense." .. submodule)
	vim.list_extend(specs, mod_specs)
end

--- Import lsp, cmp and ui
add("ui")
add("cmp")
add("lsp")

return specs

