-- Global keymaps.
-- LaTeX (<leader>l) and Typst (<leader>t) maps are buffer-local, see core/autocmds.lua.
-- Neovim defaults that are relied upon (not redefined here):
--   gc/gcc comment · K hover · grn rename · gra code action · grr references
--   gri implementation · gO document symbols · ]d/[d diagnostics · an/in (visual) TS selection
local map = vim.keymap.set

-- Move by visual line when no count is given
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Windows
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffers
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bc", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>bC", "<cmd>bd!<CR>", { desc = "Force close buffer" })
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer" })
map("n", "<leader>ba", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all other buffers" })

-- Files
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force quit" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File explorer" })

-- Find (Telescope)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find file" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

-- Code
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>cf", function() vim.lsp.buf.format() end, { desc = "Format document" })
map("n", "<leader>cl", "<cmd>Lint<CR>", { desc = "Lint file" })
map("n", "<leader>cd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>cj", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
map("n", "<leader>ck", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
map("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

-- Spelling
map("n", "<leader>st", "<cmd>setlocal spell!<CR>", { desc = "Toggle spell check" })
map("n", "<leader>se", "<cmd>setlocal spelllang=en_us<CR>", { desc = "English (US)" })
map("n", "<leader>sb", "<cmd>setlocal spelllang=en_gb<CR>", { desc = "English (GB)" })
map("n", "<leader>sd", "<cmd>setlocal spelllang=de_de<CR>", { desc = "German" })
map("n", "<leader>sf", "<cmd>setlocal spelllang=fr<CR>", { desc = "French" })
map("n", "<leader>sm", "<cmd>setlocal spelllang=en_us,de_de<CR>", { desc = "Multi (EN+DE)" })
map("n", "<leader>sn", "<cmd>normal! 1z=<CR>", { desc = "First suggestion" })
map("n", "<leader>ss", "<cmd>Telescope spell_suggest<CR>", { desc = "Suggestions" })
map("n", "<leader>sp", "<cmd>normal! ]s<CR>", { desc = "Next misspelled" })
map("n", "<leader>sP", "<cmd>normal! [s<CR>", { desc = "Previous misspelled" })
map("n", "<leader>sa", "<cmd>SpellAdd<CR>", { desc = "Add word to dictionary" })
