function ApplyColours()
	require('onedark').setup {
		style = 'cool',
    transparent = true,
	}
	require('onedark').load()

  vim.cmd('highlight LineNrabove ctermfg=darkgray')
  vim.cmd('highlight LineNrbelow ctermfg=darkgray')
  vim.cmd('highlight LineNr guifg=#4dbdcb')

end

ApplyColours()

