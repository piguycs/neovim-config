local util = require("formatter.util")
local defaults = require("formatter.defaults")

require("formatter").setup({
	filetype = {
		rust = {
			require("formatter.filetypes.rust").rustfmt,
			function()
				return {
					exe = "rustfmt",
					args = {},
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
		["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
		},
	},
})
