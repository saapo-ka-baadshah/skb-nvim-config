--	NeoVim Setup
--
--	Created by 
--		saapo-ka-baadshah

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local pluginpath = vim.fn.stdpath("config") .. "/plugins/"
local configpath = vim.fn.stdpath("config")
package.path = package.path .. ";" .. configpath .. "/plugins/?.nvim/lua"

-- 	Checks if lazy.nvim is already installed
if not vim.loop.fs_stat(lazypath) then
	--	if lazy vim is not installed then NeoVim should install the plugin
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", 		-- 	use the latest stable branch
		lazypath			--	use the lazy path as installation path
	})
end

--	Should preprend the lazyvim installation path into the runtime path to check presense of all the plugins and modules
vim.opt.rtp:prepend(lazypath)

--	######################### Plugins
--	Plugin setup section
require ("lazy").setup(
	{
		--	Tree sitter and lua baseline edits
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{ "nvim-lualine/lualine.nvim" },

		---	0. Floating terminal
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
		},
		
		---	1. Markdown Preview
		{
			"mrjones2014/mdpreview.nvim",
			ft = "markdown",
			config = true,
			dependencies = {
				{ "norcalli/nvim-terminal.lua", config = true }
			},
			keys = {
				{ "<leader>md", "<cmd>Mdpreview<CR>", desc = "Toggle markdown preview" }
			},
		},

		--	Additional plugins
		-- { dir = "~/my_plugins/my_cool_plugin" },   -- for plugins you're developing
		{
			dir = pluginpath .. "default_editor_plugin.nvim",
			config = true,
		},   -- for plugins you're developing
		--	Intellisense
		spec = {
			dir = pluginpath .. "intellisense.nvim"
		}
	},
	{
		ui = {
			border = "rounded",
		}
	}
)

