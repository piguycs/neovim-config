require("bufferline").setup({
	options = {
		right_mouse_command = false,
		numbers = "none",
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return " " .. count
		end,
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		hover = {
			enabled = false,
			delay = 0,
			reveal = { "close" },
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = " File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})

-- scope buffers to tabs
require("scope").setup()
