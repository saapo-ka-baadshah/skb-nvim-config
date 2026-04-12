---	Module for the OpenCode Nvim plugin
---		OpenCode plugin would allow us to add OpenCode neovim commands and windows.

return {
	{
		"nickjvandyke/opencode.nvim",
		version = "*",                     -- lock to latest stable
		dependencies = {
			-- Beautiful input/picker/terminal handling
			{
				"folke/snacks.nvim",
				optional = true,
				opts = {
					input = {},
					picker = {
						actions = {
							opencode_send = function( ... )
								return require("opencode").snacks_picker_send(...)
							end
						},
					},
				},
			},
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				events = {
					permissions = {
						edits = {
							enabled = false,
						},
					},
				},
			}

			-- IMPORTANT: required for automatic buffer reloading after AI edits
			vim.o.autoread = true

			-- Recommended keymaps (you can change these of course)
			vim.keymap.set(
				{ "n", "x" }, "<C-a>",
				function()
					require("opencode").ask("@this: ", { submit = true })
				end,
				{ desc = "Ask OpenCode about selection/buffer" }
			)

			vim.keymap.set(
				{ "n", "x" }, "<C-x>",
				function()
					require("opencode").select()
				end,
				{ desc = "OpenCode picker (prompts, actions...)" }
			)

			--- Create a user command for the vim interface
			vim.api.nvim_create_user_command(
				"OpenCodeToggle",
				function()
					local ok, opencode = pcall(require, "opencode")

					if not ok then
						vim.notify("opencode.nvim not loaded", vim.log.levels.ERROR)
						return
					end

					local opts = require("opencode.config").opts
					if opts.server and opts.server.toggle then
						opts.server.toggle()
					else
						--- fallback: start opencode if no toggle is configured
						opencode.start()
					end
				end,
				{}
			)

			vim.keymap.set(
				{"n", "t"},
				"<leader>oc",
				"<cmd>OpenCodeToggle<CR>",
				{ desc = "Toggle OpenCode window" }
			)

			-- Operator mode (very Lua/NeoVim idiomatic)
			vim.keymap.set(
				{ "n", "x" }, "go",
				function()
					return require("opencode").operator("@this ")
				end,
				{ expr = true, desc = "Send range to OpenCode" }
			)

			-- Bonus: scroll in the OpenCode terminal
			vim.keymap.set(
				"n", "<S-C-u>",
				function()
					require("opencode").command("session.half.page.up")
				end
			)
			vim.keymap.set(
				"n", "<S-C-d>",
				function()
				require("opencode").command("session.half.page.down")
				end
			)
		end,
	},
}
