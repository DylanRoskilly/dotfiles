return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({buffer = bufnr})
		end)

		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "gopls", "pyright", "ltex" },
		  	handlers = {
				lsp_zero.default_setup,
		  	}
		})

		local cmp = require('cmp')
		local cmp_format = lsp_zero.cmp_format()

		cmp.setup({
		 	formatting = cmp_format,
			mapping = {
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<Tab>'] = cmp.mapping.confirm({ select = true }),
			}
		})

	end
}
