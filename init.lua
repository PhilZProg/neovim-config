----------------------------------------------------------------------
--Checking wether Lazy package manager is installed
--and install it if it is not
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
----------------------------------------------------------------------

--variable required for Lazy setup function
local opts = {}

--Start lazy
require("vim-options")
require("lazy").setup("plugins")

