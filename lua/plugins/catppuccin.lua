return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,

	config = function()
		-- Set up Catppuccin
		require("catppuccin").setup({
			flavour = "mocha", -- Choose the flavour: mocha, macchiato, etc.
			background = {
				light = "latte", -- Background for light mode
				dark = "mocha", -- Default for dark mode
			},
		})

		-- Apply the Catppuccin colorscheme
		vim.cmd.colorscheme("catppuccin")
		vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", {})
	end,
}
