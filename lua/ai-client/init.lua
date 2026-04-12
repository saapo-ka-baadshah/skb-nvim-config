---	OpenCode plugin setup
---	This should use following modules as part of the spec:
---		1.	"aiclient"

local specs = {}

---Loads and merges specs from an ai-client submodule into the main specs table.
---@param submodule string The name of the submodule to load specs from (e.g., "aiclient")
local function add(submodule)
	local mod_specs = require("ai-client." .. submodule)
	vim.list_extend(specs, mod_specs)
end

add("aiclient")

return specs
