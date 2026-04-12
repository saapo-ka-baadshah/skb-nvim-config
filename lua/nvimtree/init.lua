---	Loads the tree view modules

local specs =	{}

-- Enables the general keymaps for the `nvimtree` plugin.
local function enableKeymaps()
	-- Toggle file explorer
	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

	-- Focus on current file in the tree
	vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Find current file in NvimTree" })
end

-- Adds specs from the named `nvimtree` submodule into the module-level `specs` list.
-- Expects the required module to return a list-like table of specs which are appended to `specs`.
-- @param submodule The submodule name under `nvimtree` to require (e.g. "ui", "cmp", "lsp").
local function add(submodule)
	local mod_specs = require("nvimtree." .. submodule)
	vim.list_extend(specs, mod_specs)
end

---	Import the tree view
add("tree")
enableKeymaps()

return specs
