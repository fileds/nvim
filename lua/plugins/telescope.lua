return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>pg", "<cmd>Telescope git_files<cr>",  desc = "Git Files" },
		-- { "<leader>ps", "<cmd>Telescope git_files<cr>",  desc = "Grep string" },
	},
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Grep String" })
	end,
}
