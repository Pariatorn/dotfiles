-- Core configuration (leader must be set before lazy loads plugins)
require("core.options")
require("core.autocmds")
require("core.keymaps")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Every lua/plugins/<name>/init.lua is imported automatically
require("lazy").setup({
  spec = { { import = "plugins" } },
  install = { colorscheme = { "tokyonight" } },
  change_detection = { notify = false },
})
