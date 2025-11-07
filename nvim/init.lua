-- General
vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.encoding = "utf-8"
vim.opt.ruler = true
vim.opt.clipboard = "unnamedplus" -- Neovim uses unnamedplus for system clipboard
vim.opt.termguicolors = true -- Enable true color support for colorschemes
vim.cmd("filetype plugin indent on") -- Neovim handles filetype better

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
vim.opt.wildignore = "*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.orig,*.DS_Store,*/.sass-cache/,*/.vagrant/,*/tmp/*,*.pdf,*/node_modules/*,*/dist/*,*/bower_components/*"
vim.opt.hlsearch = true

-- Plugins (using vim-plug)
vim.cmd("call plug#begin('~/.local/share/nvim/plugged')")

vim.cmd("Plug 'Townk/vim-autoclose'")
vim.cmd("Plug 'airblade/vim-gitgutter'")
-- Removed 'kien/ctrlp.vim' - Use built-in :find or consider telescope.nvim for modern fuzzy finding
vim.cmd("Plug 'kien/rainbow_parentheses.vim'")
vim.cmd("Plug 'mattn/emmet-vim'")
vim.cmd("Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }")
vim.cmd("Plug 'terryma/vim-multiple-cursors'")
vim.cmd("Plug 'tpope/vim-commentary'")
vim.cmd("Plug 'tpope/vim-fugitive'")
vim.cmd("Plug 'tpope/vim-surround'")
vim.cmd("Plug 'catppuccin/nvim', { 'as': 'catppuccin' }")
vim.cmd("Plug 'nvim-lua/plenary.nvim'")
vim.cmd("Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }")

vim.cmd("call plug#end()")

-- Color scheme
vim.cmd("syntax on")
-- Setup catppuccin (will only work after plugins are installed)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local status_ok, catppuccin = pcall(require, "catppuccin")
    if status_ok then
      catppuccin.setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
      })
      vim.cmd.colorscheme("catppuccin")
    end
  end,
})
-- Try to load immediately if plugin is already available
local status_ok, catppuccin = pcall(require, "catppuccin")
if status_ok then
  catppuccin.setup({
    flavour = "mocha",
  })
  vim.cmd.colorscheme("catppuccin")
end

-- Set leader key to space (must be set before keymaps)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope Configuration
local telescope_status_ok, telescope = pcall(require, "telescope")
if telescope_status_ok then
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        find_command = { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },
      },
    },
  })

  -- Telescope keymaps
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
  vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
  vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
  vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
  vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })

  -- Git integration (if fugitive is available)
  vim.keymap.set("n", "<leader>fG", builtin.git_files, { desc = "Git files" })
end

-- Emmet
vim.g.user_emmet_expandabbr_key = "<c-e>"

-- Multiple cursors
vim.g.multi_cursor_use_default_mapping = 0
vim.g.multi_cursor_next_key = "<C-m>"
vim.g.multi_cursor_prev_key = "<C-n>"
vim.g.multi_cursor_skip_key = "<C-x>"
vim.g.multi_cursor_quit_key = "<Esc>"

-- Statusline config (custom, no airline needed)
vim.opt.statusline = "[%n] %<%f%m%r %{exists('g:loaded_rvm')?rvm#statusline():''}%{fugitive#statusline()}%=%w <%{&fileformat}>%=\\ [%o]\\ %l,%c%V/%L\\ %P"
vim.opt.laststatus = 2

-- Remaps
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("v", ";", ":", { noremap = true })
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Quickfix navigation (using built-in :grep instead of grep.vim)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<cr>", "<cr><c-w><c-p>", { buffer = true, noremap = true })
  end,
})

-- Autoclose
vim.g.AutoClosePairs = {
  ["("] = ")",
  ["{"] = "}",
  ["["] = "]",
  ['"'] = '"',
  ["'"] = "'",
  ["#{"] = "}"
}
vim.g.AutoCloseProtectedRegions = { "Character" }

-- Rainbow
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "RainbowParenthesesToggle",
})
vim.api.nvim_create_autocmd("Syntax", {
  pattern = "*",
  command = "RainbowParenthesesLoadRound",
})
vim.api.nvim_create_autocmd("Syntax", {
  pattern = "*",
  command = "RainbowParenthesesLoadSquare",
})
vim.api.nvim_create_autocmd("Syntax", {
  pattern = "*",
  command = "RainbowParenthesesLoadBraces",
})

