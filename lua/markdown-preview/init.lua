---	Markdown preview module
---		Uses mrjones2014/mdpreview.nvim

return {
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
	}
}
