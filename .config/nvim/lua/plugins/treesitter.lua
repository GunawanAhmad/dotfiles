return{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitterConfig = require("nvim-treesitter.configs")
		treesitterConfig.setup({
			auto_install = true,
			ensure_installed = { "lua", "javascript", "c", "html", "css" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
