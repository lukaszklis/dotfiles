-- Minimal Neovim config for VS Code/Cursor extension
-- This config is optimized for use within the editor extension
-- and avoids plugins/settings that conflict with editor features

-- General
vim.opt.encoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- Fix for Cursor/VSCode Neovim extension: handle focus events when switching tabs
if vim.fn.exists("##FocusGained") == 1 then
  vim.api.nvim_create_autocmd("FocusGained", {
    pattern = "*",
    callback = function()
      if vim.fn.mode() ~= "n" then
        vim.cmd("stopinsert")
      end
    end,
  })
end
vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "n" then
      vim.cmd("stopinsert")
    end
  end,
})

-- Disable features that conflict with VS Code/Cursor
vim.opt.showmode = false -- VS Code/Cursor shows mode in status bar
vim.opt.ruler = false -- VS Code/Cursor has its own ruler
vim.opt.showcmd = false -- VS Code/Cursor handles command display

-- Backups
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e", -- strip trailing whitespace
})
vim.opt.backspace = "indent,eol,start"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.colorcolumn = "120"

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Minimal plugins - only essential ones that work well with extension
vim.cmd("call plug#begin('~/.local/share/nvim/plugged')")

-- Essential plugins that don't conflict with VS Code/Cursor
vim.cmd("Plug 'tpope/vim-commentary'")
vim.cmd("Plug 'tpope/vim-surround'")
vim.cmd("Plug 'tpope/vim-fugitive'")

vim.cmd("call plug#end()")

-- Remaps
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("v", ";", ":", { noremap = true })
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Disable statusline since VS Code/Cursor has its own
vim.opt.laststatus = 0

-- Extension-specific optimizations
-- Disable lazyredraw in extension context (ttyfast not available in Neovim)
vim.opt.lazyredraw = false

-- Ensure proper filetype detection
vim.cmd("filetype plugin indent on")

