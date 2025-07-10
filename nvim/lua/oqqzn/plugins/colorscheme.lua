return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- Can delete the background changes if want --
			vim.cmd([[colorscheme catppuccin]])

			vim.cmd([[highlight Normal guibg=#171421]]) -- Makes background same color as terminal
			vim.cmd([[highlight NormalNC guibg=#171421]]) -- Set background for inactive windows to same color as terminal
			vim.cmd([[highlight CursorLineNr guifg=#B366B3]])
			vim.cmd([[highlight LineNr guifg=#FFFF00]])
			--NvimTree specific backgrounds
			vim.cmd([[highlight NvimTreeNormal guibg=#171421]]) -- Set nvim-tree background to same color as terminal
			vim.cmd([[highlight NvimTreeEndOfBuffer guibg=#171421]]) -- End of buffer background
			vim.cmd([[highlight NvimTreeVertSplit guibg=#171421]]) -- Vertical split line background
		end,
	},
}
