return {
	{
		"hrsh7th/cmp-nvim-lsp", -- LSP-based completions
	},

	{
		"L3MON4D3/LuaSnip", -- Snippet Engine
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer", -- Buffer completions
			"hrsh7th/cmp-path", -- Path completions
			"hrsh7th/cmp-cmdline", -- Command-line completions
			"hrsh7th/cmp-nvim-lua", -- Neovim Lua API completions
			"hrsh7th/cmp-emoji", -- Emoji completions
			"hrsh7th/cmp-nvim-lsp-signature-help", -- Signature help
			"windwp/nvim-autopairs", -- Auto-closing brackets and quotes
			"onsails/lspkind.nvim", -- Icons for completion suggestions
			"petertriho/cmp-git", -- Git completions (commits, branches)
			"f3fora/cmp-spell", -- Spellcheck completions
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			require("nvim-autopairs").setup()

			-- Autopair integration with nvim-cmp
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lsp_signature_help" }, -- Signature help
					{ name = "buffer" },
					{ name = "path" }, -- File path completions
					{ name = "nvim_lua" }, -- Lua API completions
					{ name = "emoji" }, -- Emoji completions
					{ name = "spell" }, -- Spell completions
					{ name = "git" }, -- Git completions
				}),
			})

			-- Git completion source setup
			require("cmp_git").setup()
		end,
	},
}
