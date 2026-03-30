---	UI
---		For User Interface, 
---		we use Mason as the plugin

return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		config = function()
			require("mason").setup({
				ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		lazy = true,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = true,
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
	},	
}
