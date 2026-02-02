return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- formatters
				"prettier",
				"clang-format", -- c
				"stylua", -- lua
				"isort", -- python
				"black", -- python
				-- linters
				"cpplint", -- c
				"pylint", -- python
				"eslint_d", -- js
				"stylelint", -- css
				"htmlhint", -- html
				-- lsp servers
				"pyright", -- python
				"typescript-language-server", -- js
				"html-lsp", -- html
				"css-lsp", -- css
			},
		})
	end,
}
