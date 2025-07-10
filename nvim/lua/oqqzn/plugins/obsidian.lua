return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	--	lazy = true,
	--	ft = "markdown",
	dependencies = {
		-- Required dependencies.
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		-- Add any optional dependencies as needed.
	},
	config = function()
		-- Import required modules for key mapping.
		local obsidian = require("obsidian")

		-- Setup Obsidian with your preferred options.
		obsidian.setup({
			workspaces = {
				{
					name = "master-00",
					path = "~/Documents/master-00",
				},
			},
		})
		-- Define key mappings.
		local keymap = vim.keymap.set -- for conciseness
		keymap("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Create new note" })
		keymap("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search Obsidian" })
		keymap("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick switch" })
	end,
}
