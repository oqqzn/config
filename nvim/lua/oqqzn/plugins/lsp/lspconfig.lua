return {
	"neovim/nvim-lspconfig",
	lazy = false,
	--event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- completion capabilities
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Diagnostics UI (signs in gutter)
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

		-- Keymaps: force them on every LSP attach
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local keymap = vim.keymap
				local opts = { noremap = true, silent = true, buffer = bufnr }

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
				keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", opts)

				opts.desc = "Show LSP references"
				keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
			end,
		})

		-- 1) Global defaults for all servers
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- 2) Per-server overrides

		vim.lsp.config("html", {
			filetypes = { "html", "htmldjango" },
		})

		vim.lsp.config("cssls", {})
		vim.lsp.config("ts_ls", {})

		vim.lsp.config("clangd", {
			cmd = {
				"/opt/homebrew/opt/llvm/bin/clangd",
				"--background-index",
				"--suggest-missing-includes",
				"--clang-tidy",
				"--compile-commands-dir=build",
			},
			filetypes = { "c", "cpp", "objc", "objcpp" },
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

		-- 3) Enable servers (minimal web + your existing python/cpp/lua)
		vim.lsp.enable({
			"html",
			"cssls",
			"ts_ls",
			"clangd",
			"pyright",
			"lua_ls",
		})
	end,
}
