local nvimtree_glyphs = {}

local installed, circles = pcall(require, 'circles')
if installed then
  circles.setup({ icons = { empty = '', filled = '', lsp_prefix = '' } })
  nvimtree_glyphs = circles.get_nvimtree_glyphs()
end

require('nvim-tree').setup({
    view = {
        width = 30,
        side = 'left',
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    },
    renderer = {
        group_empty = true,
        highlight_opened_files = 'all',
        root_folder_modifier = ':p:~',
        icons = {
            glyphs = nvimtree_glyphs,
        }
    },
    filters = {
        dotfiles = true,
    }
})
