---	Plugin module for NeoVim default configuration
local M = {}

---	Enables relative line numbering
local function EnableRelativeLineNumbering()
	--	Relative line numbering
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.signcolumn = "number"
end

--- 	Enable default key maps
---	Encapsulated function:
---		1. Allows confirmation for saving and closing
local function __ConfirmSaveAndClose()
	-- 1 = Yes; 2 = No
	local choice = vim.fn.confirm("Save all and close all windows?", "&Yes\n&No", 2)
	
	if choice == 1 then
		vim.cmd("wa")			--	Save all files
		vim.cmd("%bd")			--	Delete all buffers and close the windows
		print("Saved all and closing all")
	elseif choice == 2 then
		print("Action cancelled")
	end
end


local function EnableDefaultKeyMaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

	--- Save all and Close all
	vim.keymap.set('n', '<leader>ca', __ConfirmSaveAndClose,
		{ desc = "Save and close all" }
	)
end

--- 	Enable window split logic
local function EnableWindowSplitLogic()
	vim.opt.splitright = true
end

--- 	LazyNVim setup call.
function M.setup()
	EnableRelativeLineNumbering()
	EnableDefaultKeyMaps()
	EnableWindowSplitLogic()
end

return M
