local util = require("formatter.util")
local defaults = require("formatter.defaults")

require("formatter").setup({
	filetype = {
		xml = {
			function()
				return {
					exe = "xmlformat",
					args = {
						util.escape_path(util.get_current_buffer_file_path())
					},
					stdin = true,
				}
			end,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
			function()
				return {
					exe = "rustfmt",
					args = {
						"--edition 2021",
					},
					stdin = true,
				}
			end,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,

			function()
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		typescript = {
			function()
				return {
					exe = "deno",
					args = { "fmt", "-" },
					stdin = true,
				}
			end,
		},
		astro = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
					},
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
