return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_transparent_background = 2
    vim.g.gruvbox_material_background = 'soft'
    vim.cmd.colorscheme 'gruvbox-material'
    vim.api.nvim_command 'hi NormalFloat ctermbg=NONE guibg=NONE'

    -- Custom diagnostic colors
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#458588' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#fabd2f' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#fb4934' })
  end,
}
