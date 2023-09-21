return 	{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "rust", "go", "typescript", "css", "javascript", "html" },
			sync_install = false,
			highlight = { enable = true },
			auto_install = true,
			indent = { enable = true },
		})
	end
}

