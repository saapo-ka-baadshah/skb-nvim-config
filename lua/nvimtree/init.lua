---	Loads the tree view modules

local specs =	{}

-- Register normal-mode keymaps for the NvimTree plugin.
-- Maps <leader>e to toggle the tree and <leader>fe to find the current file in the tree.
local function enableKeymaps()
	-- Toggle file explorer
	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

	-- Focus on current file in the tree
	vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Find current file in NvimTree" })
end

-- Adds specs from the named `nvimtree` submodule into the module-level `specs` list.
-- Expects the required module to return a list-like table of specs which are appended to `specs`.
-- Appends specs exported by a nvimtree submodule into the module-level `specs` table.
-- @param submodule Name of the submodule under "nvimtree" to require (e.g. "ui", "cmp", "lsp"). The required module is expected to return a list-like table of specs which will be appended to `specs`.
local function add(submodule)
	local mod_specs = require("nvimtree." .. submodule)
	vim.list_extend(specs, mod_specs)
end

---	Import the tree view
add("tree")
enableKeymaps()

return specs
