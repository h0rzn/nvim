return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function ()
			require("trouble").setup({
				icons = false
			})

			vim.keymap.set("n", "<leader>xx", function ()
				require("trouble").toggle()
			end)

		end,
	},
}
