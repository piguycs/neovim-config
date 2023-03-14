vim.g.mapleader = " "

-- Open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Cycle tabs
vim.keymap.set("n", "<C-]>", vim.cmd.tabn)
vim.keymap.set("n", "<C-[>", vim.cmd.tabp)

-- Move blocks of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps cursor where it should be
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over a piece of text, without it getting in your buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Space + y will copy into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Space + s to replace the word I am currently on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Space + x to make curent file into an executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Source the current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- Auto close brackets
vim.api.nvim_set_keymap("i", "(", "()<Esc>i", { noremap = true })
-- vim.api.nvim_set_keymap("i", "{", "{}<Esc>i", { noremap = true })
vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<Esc>O", { noremap = true })
vim.api.nvim_set_keymap("i", "[", "[]<Esc>i", { noremap = true })
vim.api.nvim_set_keymap("i", "<", "<><Esc>i", { noremap = true })
vim.api.nvim_set_keymap("i", "'", "''<Esc>i", { noremap = true })
vim.api.nvim_set_keymap("i", "\"", "\"\"<Esc>i", { noremap = true })

-- Formatter
vim.keymap.set("n", "=", vim.cmd.Format)

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
