return {
	{
		"akinsho/bufferline.nvim",
		version = "*", -- Always get the latest version
		dependencies = "nvim-tree/nvim-web-devicons", -- Icons for bufferline
		config = function()
			require("bufferline").setup({
				options = {
					numbers = "ordinal",
					diagnostics = "nvim_lsp",
					show_buffer_close_icons = true,
					show_close_icon = false,
					separator_style = "slant",
					always_show_bufferline = true,
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
							separator = true, -- Adds a separator between Neo-tree and the bufferline
						},
					},
				},
			})

			-- Keybindings for navigating buffers
			vim.keymap.set("n", "<C-Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true }) -- Close current buffer
		end,
	},
}
