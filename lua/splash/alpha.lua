---	Alpha Module
---		This module would allow us to write custom welcome messages and instructions on the screen.

return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",          -- load only when Neovim starts
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- ==================== YOUR CUSTOM ASCII ART HERE ====================
			local header = {
				" ",
				"    █████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"   ██╔══██╗██║   ██║██║████╗ ████║ ",
				"   ███████║██║   ██║██║██╔████╔██║ ",
				"   ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"   ██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"   ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				" ",
				"	Welcome back to your AVIM (Amey's NeoVim)!	",
				" ",
				"	---------	",
				"	If one drop was enough to bring you to this world,	",
				"	One vim config should be enough!	",
				"	---------	",
				" ",
			}

			local footer = {
				" ",
				" ",
				" ",
				"Created by:	@saapo-ka-baadshah (https://github.com/saapo-ka-baadshah)	",
				" ",
				"Neovim loaded in " .. vim.fn.printf("%.2f", vim.fn.reltimefloat(vim.fn.reltime())) .. "s",
				" ",
			}

			-- You can replace the lines above with any ASCII art you like.
			-- Just make sure each line is inside "" and the whole thing is a table.

			dashboard.section.header.val = header
			dashboard.section.header.opts.hl = "AlphaHeader"   -- you can change the highlight later

			-- Optional: nice buttons below your art
			dashboard.section.buttons.val = {
				dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("\\e", "Toggle file tree view", ":NvimTreeToggle <CR>"),
				dashboard.button("\\oc", "Toggle AI Client (OpenCode)", "<cmd>OpenCodeToggle<CR>"),
				dashboard.button("q", "Quit", ":qa<CR>"),
			}

			-- Optional footer (you can put version, date, fortune, etc.)
			dashboard.section.footer.val = footer

			alpha.setup(dashboard.opts)

			-- Disable folding on the alpha buffer
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
			end,
	},
}
