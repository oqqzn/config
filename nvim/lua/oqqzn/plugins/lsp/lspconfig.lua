return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- import cmp-nvim-lsp
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "<leader>lK", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)

			opts.desc = "Show LSP references"
			keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
		end

		-- capabilities for completion
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- signs in the gutter
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "E",
					[vim.diagnostic.severity.WARN] = "W",
					[vim.diagnostic.severity.HINT] = "H",
					[vim.diagnostic.severity.INFO] = "I",
				},
			},
		})

		-- 1) Set global defaults merged into every server
		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- 2) Per-server config overrides (only when you need them)
		vim.lsp.config("html", {
			-- Use your preferred html LS binary; many use "vscode-html-language-server"
			cmd = { "html-languageserver", "--stdio" },
		})

		vim.lsp.config("ts_ls", {})
		vim.lsp.config("cssls", {})
		vim.lsp.config("tailwindcss", {})

		vim.lsp.config("svelte", {
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		vim.lsp.config("prismals", {})
		vim.lsp.config("graphql", {
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		vim.lsp.config("clangd", {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = {
				"/opt/homebrew/opt/llvm/bin/clangd",
				"--background-index",
				"--suggest-missing-includes",
				"--clang-tidy",
				"--compile-commands-dir=build",
			},
			filetypes = { "c", "cpp", "objc", "objcpp" },
		})

		vim.lsp.config("emmet_ls", {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		vim.lsp.config("pyright", {})
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- 3) Enable all the servers you want running
		vim.lsp.enable({
			"html",
			"ts_ls",
			"cssls",
			"tailwindcss",
			"svelte",
			"prismals",
			"graphql",
			"clangd",
			"emmet_ls",
			"pyright",
			"lua_ls",
		})
	end,
}
