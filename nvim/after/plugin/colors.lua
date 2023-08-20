function Colorize()
	color = color or "mellifluous"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Colorize()

--vim.api.nvim_create_autocmd(
--    { "BufNewFile", "BufRead" },
--    { pattern = "*.cs", command = ":colorscheme codedark" }
--)
