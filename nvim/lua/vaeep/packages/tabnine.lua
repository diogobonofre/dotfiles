return {
	'codota/tabnine-nvim',
	config = function()
		require('tabnine').setup({
			disable_auto_comment = true,
			accept_keymap = "<M-CR>",
			debounce_ms = 800,
			suggestion_color = { gui = "#444444", cterm = 244 },
			exclude_filetypes = { "TelescopePrompt", "NvimTree" },
			log_file_path = nil, -- absolute path to Tabnine log file
		})
	end
}
