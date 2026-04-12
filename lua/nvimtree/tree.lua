---	NeoVim Tree Module
---		Allows viewing the files and their plugin operations on the side of the view 

return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",					-- pin to latest stable
		lazy = false,					-- load immediately
		dependencies = {
			"nvim-tree/nvim-web-devicons",		-- required for nice icons
		},
		config = function()
			-- Disable netrw (important)
			vim.g.loaded_netrw		=	1
			vim.g.loaded_netrwPlugin	=	1

			require("nvim-tree").setup({
				-- General settings
				sort_by = "case_sensitive",
				sync_root_with_cwd = true,          -- changes root when you change directory
				respect_buf_cwd = true,
				view = {
					width = 35,                       -- sidebar width
					side = "left",                    -- or "right" if you prefer
					-- number = true,                 -- uncomment to show line numbers
				},
				renderer = {
					group_empty = true,               -- show empty folders as one
					highlight_git = true,
					highlight_diagnostics = true,
					icons = {
						glyphs = {
							default = "-",
							symlink = "L",
							folder = {
								arrow_closed = ">",
								arrow_open = "v",
								default = "[D]",
								open = "[O]",
								empty = "[E]",
								empty_open = "[ ]",
							},
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "U",
								renamed = "➜",
								untracked = "★",
								deleted = "D",
								ignored = "◌",
							},
						},
					},
				},
				filters = {
					dotfiles = false,                 -- set true to hide .files by default
					git_ignored = false,
				},
				actions = {
					open_file = {
						quit_on_open = false,     -- keep tree open after opening a file
						window_picker = {
							enable = true,
						},
					},
				},
				git = {
					enable = true,
					ignore = false,
				},
			})
		end,
	}	
}
