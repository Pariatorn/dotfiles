local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation with shift
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Enhanced buffer management
map("n", "<leader>bc", ":bd<CR>", { desc = "Close current buffer" })
map("n", "<leader>bC", ":bd!<CR>", { desc = "Force close current buffer" })
map("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })
map("n", "<leader>ba", ":%bd|e#<CR>", { desc = "Close all buffers except current" })
map("n", "<leader>bl", ":Telescope buffers<CR>", { desc = "List all buffers" })