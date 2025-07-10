return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("diffview").setup({
			file_panel = {
				listing_style = "list",
				win_config = {
					width = 50, -- default is ~35
				},
			},
		})

		local keymap = vim.keymap

		-- Open / Close Diffview
		keymap.set("n", "<leader>gg", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
		keymap.set("n", "<leader>gq", "<cmd>tabdo DiffviewClose<CR>", { desc = "Close all Diffviews" })
		-- Toggle file panel
		keymap.set("n", "<leader>gc", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle Diffview files" })
		-- File history
		keymap.set("n", "<leader>gb", "<cmd>DiffviewFileHistory %<CR>", { desc = "Current file history" })
	end,
}
