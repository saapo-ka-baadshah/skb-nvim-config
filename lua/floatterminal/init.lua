---	Floating Terminal Module
---		This uses akinsho/toggleterm.nvim as the plugin.

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{ "<leader>ft", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" }
		},
		config = function()
			require("toggleterm").setup({
			    -- Your existing setup options here...
			    open_mapping = [[<leader>ft]], -- optional
			})

			-- Custom function to apply terminal-only keymaps
			function _G.set_terminal_keymaps()
			    local opts = {buffer = 0}
			    -- 1. Map ESC to exit Terminal Mode (use <C-\><C-n>)
			    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
			    
			    -- 2. Map Ctrl+hjkl to switch windows DIRECTLY from terminal mode
			    vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
			    vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
			    vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
			    vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
			end

			-- This autocommand applies the maps every time a terminal opens
			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
		    end,
	}
}
