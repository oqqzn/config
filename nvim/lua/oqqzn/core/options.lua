-- No temp files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- Color scheme / look
vim.cmd("syntax enable")
vim.opt.cursorline = true
vim.opt.guicursor = ""
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50
vim.opt.laststatus = 3 -- global statusline
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.showmode = false -- Dont show mode since we have a statusline

-- Viewing / experience
vim.opt.nu = true
--vim.opt.rnu = true
vim.opt.scrolloff = 12
vim.opt.linebreak = true
--vim.opt.textwidth = 80
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- Spell check and underline for text and md files
vim.api.nvim_create_augroup("filetype_spellcheck", {})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.txt", "*.md" },
	command = "setlocal spell spelllang=en",
	group = "filetype_spellcheck",
})
-- Location of spell file
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.txt", "*.md" },
	command = "setlocal spellfile=~/.config/nvim/spell/en.utf-8.add",
	group = "filetype_spellcheck",
})

-- For Obsidian
vim.opt.conceallevel = 2

vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
