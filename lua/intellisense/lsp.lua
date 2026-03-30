---	Language support server (LSP)
---		This provides a language support mechanism for your 
---		autocompletions and mason ui

return {
	"neovim/nvim-lspconfig",
	config = function ()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = {
			--- Clang for C / C++
			clangd = {
				filetypes = { "c", "cpp", "objc", "objcpp" },
			},

			

			--- C# (.NET)
			csharp_ls = {
				filetypes = { "cs" },
			},

			--- TypeScript / JavaScript (Node)
			ts_ls = {
				filetypes = {
					"ts", "tsx",
					"js", "jsx",
					"typescript",
					"javascript",
					"typescriptreact",
					"javascriptreact"
				},
			},

			--- Python
			pyright = {
			  filetypes = { "py", "python" },
			},

			--- Lua
			lua_ls = {
			  filetypes = { "lua" },
			  settings = {
			    Lua = {
			      runtime = { version = "LuaJIT" },
			      diagnostics = { globals = { "vim" } },
			      workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			      },
			      telemetry = { enable = false },
			    },
			  },
			},

			--- Bash / Shell
			bashls = {
				filetypes = { "sh", "bash" },
				settings = {
					bash = {
						enable = true,          -- enables shellcheck integration
					},
				},
			},
		}

		--- Install all servers and configure it for mason
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			automatic_installation = true,
		})

		--- Common on_attach keymaps
		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)
		end

		--- setup each server from hashmap table
		for server_name, config in pairs(servers) do
			require(lspconfig)[server_name].setup({
				capabilities	= capabilities,
				on_attach	= on_attach,
				filetypes	= config.filetypes,
				settings	= config.settings,
			})
		end
	end

}
