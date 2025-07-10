return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "purple" })
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "purple", bg = "purple" })
		vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "purple" })

		-- New header
		dashboard.section.header.val = {
			[[     █  █     ]],
			[[     ██ ██     ]],
			[[     █████     ]],
			[[     ██ ███     ]],
			[[     █  █     ]],
			[[]],
			--[[  o  q  q  z  n  ]]
			--,
		}
		dashboard.section.header.opts.hl = {
			{ { "NeovimDashboardLogo1", 6, 8 }, { "NeovimDashboardLogo3", 9, 22 } },
			{
				{ "NeovimDashboardLogo1", 6, 8 },
				{ "NeovimDashboardLogo2", 9, 11 },
				{ "NeovimDashboardLogo3", 12, 24 },
			},
			{ { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 26 } },
			{ { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 24 } },
			{ { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 22 } },
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "   > New File", "<cmd>ene<CR>"),
			dashboard.button(":Lazy", "   > Lazy", "<cmd>Lazy<CR>"),
			dashboard.button(":Mason", "   > Mason", "<cmd>Mason<CR>"),
			dashboard.button("LDR ee", "   > File tree", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("LDR ff", "   > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("LDR fr", "   > Find Recent", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("LDR fs", "   > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("LDR oq", "   > Obsidian search", "<cmd>ObsidianQuickSwitch<cr>"),
			dashboard.button("q", "   > Quit", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
