return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_transparent_background = 2
    vim.cmd.colorscheme 'gruvbox-material'
    vim.api.nvim_command 'hi NormalFloat ctermbg=NONE guibg=NONE'
  end,
}
