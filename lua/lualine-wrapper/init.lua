---	Lualine plugin for detailed status information.

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		opts = function()
			local lazy_status = require("lazy.status")  -- For update indicator

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				},

				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff" },
					lualine_c = {
					  {
					    "filename",
					    path = 1,                    -- Show relative path
					    symbols = { modified = "●", readonly = "" },
					    color = { bg = "#8ac6d0", fg = "#36213e" }
					  },
					},
					lualine_x = {
					  {
					    lazy_status.updates,
					    cond = lazy_status.has_updates,
					    color = { fg = "#36213e" }
					  },
					  { "diagnostics", color = { bg = "#8ac6d0", fg = "#36213e" } },                 -- Shows LSP errors/warnings
					  { "encoding", color = { bg = "#8ac6d0", fg = "#36213e" } },
					  { "fileformat", color = { bg = "#8ac6d0", fg = "#36213e" } },
					  { "filetype", color = { bg = "#8ac6d0", fg = "#36213e" } },
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			}
		end,
	}
}
