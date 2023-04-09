function ApplyColours()
	require("onedark").setup({
		style = "cool",
		transparent = true,
	})
	require("onedark").load()

	vim.cmd("highlight LineNrabove ctermfg=darkgray")
	vim.cmd("highlight LineNrbelow ctermfg=darkgray")
	vim.cmd("highlight LineNr guifg=#4dbdcb")
end

function opaque()
	vim.api.nvim_set_hl(0, "Normal", { bg = "#21202f" })
end

ApplyColours()
vim.cmd("command! Opaque lua opaque()")
