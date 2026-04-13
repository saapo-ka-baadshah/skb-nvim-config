--	NeoVim Setup
--
--	Created by 
--		saapo-ka-baadshah

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local pluginpath = vim.fn.stdpath("config") .. "/plugins/"

-- Disable netrw (important)
vim.g.loaded_netrw		=	1
vim.g.loaded_netrwPlugin	=	1

-- Let the lualine show the mode, do not show the mode otherwise
vim.opt.showmode		=	false

--- A global fix for terminal mode
--- 	By default, NeoVim does not exit the terminal mode on <Esc>.
--- 	To fix that, keep following line in the config
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = 0 })

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
		---	0. Floating terminal
		{ import = "floatterminal" },	
		---	1. Markdown Preview
		{ import = "markdown-preview" },	

		--	Additional plugins
		-- { dir = "~/my_plugins/my_cool_plugin" },   -- for plugins you're developing
		{
			dir = pluginpath .. "default_editor_plugin.nvim",
			config = true,
		},   -- for plugins you're developing
		--	Intellisense
		{ import = "intellisense" },
		--	Nvim file explorer as Tree
		{ import = "nvimtree" },
		-- 	Splash screen as the welcome page and a standard tool box
		{ import = "splash" },
		--	OpenCode as the AI client
		{ import = "ai-client" },
		--	LuaLine for a more detailed indicator status line
		{ import = "lualine-wrapper" },
	},
	{
		ui = {
			border = "rounded",
		}
	}
)

