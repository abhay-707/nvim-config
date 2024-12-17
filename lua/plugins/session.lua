-- plugins/session.lua
return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- load before reading files
	opts = {
		dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- save sessions here
		options = { "buffers", "curdir", "tabpages", "winsize" }, -- what to save
	},
}
