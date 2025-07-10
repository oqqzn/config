return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				-- Add this block to customize the find_files picker
				find_files = {
					hidden = true, -- This will include dotfiles in find_files searches
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Files PWD" })
		keymap.set("n", "<leader>fa", function()
			require("telescope.builtin").find_files({
                cwd = vim.loop.os_homedir(), -- Start searching from the home
				hidden = true, -- Include hidden files in the search
			})
		end, { desc = "Files ~" })
		--[[
		keymap.set("n", "<leader>fg", function()
			require("telescope.builtin").find_files({
				cwd = "/", -- Start searching from the home
				hidden = true, -- Include hidden files in the search
				file_ignore_patterns = { "/home/.ecryptfs/" },
			})
		end, { desc = "Files /" })
        ]]
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
		keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Grep Search" })
		keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "String under cursor PWD" })
	end,
}
