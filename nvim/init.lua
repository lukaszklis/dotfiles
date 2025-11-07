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
vim.cmd("Plug 'neovim/nvim-lspconfig'")
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

  -- LSP integration with telescope
  vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
  vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
  vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })

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

-- LSP Configuration
local lspconfig = vim.lsp.config

-- LSP keymaps
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

-- Configure language servers

-- TypeScript/JavaScript (requires: npm install -g typescript typescript-language-server)
lspconfig.tsserver.setup({
  on_attach = on_attach,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})

-- Python (requires: pip install pyright or npm install -g pyright)
lspconfig.pyright.setup({
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoImportCompletions = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

-- Lua (for Neovim config)
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Show diagnostics in a floating window
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Diagnostics list" })

