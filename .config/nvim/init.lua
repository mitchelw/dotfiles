vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)



vim.opt.termguicolors = true
local set = vim.opt
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.scrolloff = 5
set.spell = true

set.rnu = true

-- (Attempt to) Disable comment character autofilling on enter
vim.opt.formatoptions:remove('c')
vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')
vim.cmd([[
  set formatoptions-=cro
]])
