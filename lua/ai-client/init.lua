---	OpenCode plugin setup
---	This should use following modules as part of the spec:
---		1.	"aiclient"

local specs = {}

---Loads and merges specs from an ai-client submodule into the main specs table.
-- Loads specs from the `ai-client.<submodule>` module and appends them to the module-level `specs` table.
-- @param submodule string The submodule name to load (for example `"aiclient"`); its `mod_specs` will be merged into `specs`.
local function add(submodule)
	local mod_specs = require("ai-client." .. submodule)
	vim.list_extend(specs, mod_specs)
end

add("aiclient")

return specs
