-- All general function keybinds. Any plugin specific keybinds are in their
-- Respective files --

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove ZZ
vim.keymap.set("n", "ZZ", "<Nop>", { noremap = true })

-- Remove shift up and down
vim.keymap.set({ "i", "n" }, "<S-Down>", "<Nop>", { noremap = true })
vim.keymap.set("n", "<S-Up>", "<Nop>", { noremap = true })

-- Highlighted text can be moved up and down
vim.keymap.set("v", "J", ":m  '>+1<CR>gv=gv", { desc = "Move highlighted text down" })
vim.keymap.set("v", "K", ":m  '<-2<CR>gv=gv", { desc = "Move highlighted text up" })

-- Searching next and previous terms keeps the word in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- jk for escape
vim.keymap.set("i", "jk", "<Esc>", { noremap = true }, { desc = "Escape" })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true })

-- New file
vim.keymap.set("n", "<leader>nn", "<cmd>enew<cr>", { desc = "New file" })

-- Save file regardless of vim mode
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- ww to :w
--vim.keymap.set("n", "<leader>ww", ":w<CR>", { noremap = true }, { desc = "Write" })

-- qq for :qa
--vim.keymap.set("n", "<leader>qq", ":q!<CR>", { noremap = true }, { desc = "Quit!" })

-- wq to :Wq
--vim.keymap.set("n", "<leader>wq", ":wq<CR>", { noremap = true }, { desc = "Write Quit" })

-- Terminal
vim.keymap.set("n", "!/", "<cmd>terminal<CR>i", { desc = "Vim buffer directory" }, { noremap = true })
vim.keymap.set("n", "!.", ":lcd %:p:h<CR>:terminal<CR>i", { desc = "Files PWD", noremap = true })
vim.keymap.set("n", "!!", ":cd ~<CR>:terminal<CR>i", { desc = "Home Directory", noremap = true })

-- Removes f1 from help menu, changes to f8
--vim.keymap.set("n", "<F8>", ":help<CR>", { noremap = true })
vim.keymap.set("n", "<F1>", "<Nop>", { noremap = true })

-- Define key mapping for toggling folding (za functionality)
vim.keymap.set("n", "\\", "za", { noremap = true, silent = true, desc = "Toggle folding" })

-- MyPy
vim.keymap.set("n", "<F5>", ":!mypy %<CR>", { noremap = true, silent = true })

-- Increment/decrement numbers
--vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
--vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Move to window using the <Ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <Ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Tab managmenet
vim.keymap.set("n", "<leader><tab>t", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader><tab>x", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><tab>h", "<cmd>tabp<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader><tab>1", "<cmd>tabnext 1<CR>", { desc = "Tab 1" })
vim.keymap.set("n", "<leader><tab>2", "<cmd>tabnext 2<CR>", { desc = "Tab 2" })
vim.keymap.set("n", "<leader><tab>3", "<cmd>tabnext 3<CR>", { desc = "Tab 3" })
vim.keymap.set("n", "<leader><tab>4", "<cmd>tabnext 4<CR>", { desc = "Tab 4" })
vim.keymap.set("n", "<leader><tab>b", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
-- Rearrange tabs with leader key + left and right arrow keys
vim.keymap.set("n", "<leader><tab><Left>", "<cmd>tabmove -1<CR>", { desc = "Move current tab left" })
vim.keymap.set("n", "<leader><tab><Right>", "<cmd>tabmove +1<CR>", { desc = "Move current tab right" })

-- Toggle buffers
vim.api.nvim_set_keymap(
	"n",
	"<leader><leader>",
	"<cmd>Telescope buffers<CR>",
	{ desc = "Toggle buffers", noremap = true, silent = true }
)
