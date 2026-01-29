return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },

				c = { "clang-format" },

				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				graphql = { "prettier" },

				lua = { "stylua" },
				python = { "isort", "black" },
			},

			format_on_save = function(bufnr)
				local name = vim.api.nvim_buf_get_name(bufnr)
				local base = vim.fn.fnamemodify(name, ":t")

				-- never auto-format formatter / tool config files
				if base == ".clang-tidy" or base == ".clang-format" then
					return
				end

				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 5000,
				}
			end,
		})
	end,
}
