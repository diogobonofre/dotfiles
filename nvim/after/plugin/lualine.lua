require('lualine').setup {
	options = {
        theme = 'auto',
        section_separators = { left = ' 私 ', right = ' 很 ' },
        component_separators = { left = ' 私 ', right = ' 很 ' }
    },
    sections = {
        lualine_a = {
            'buffers',
        }
    }
}
