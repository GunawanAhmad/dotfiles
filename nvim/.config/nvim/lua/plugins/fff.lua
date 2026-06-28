vim.pack.add {
  'https://github.com/dmtrKovalenko/fff.nvim',
}

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then
        vim.cmd.packadd 'fff.nvim'
      end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
  keymaps = {
    move_up = { '<C-k>', '<Up>' },
    move_down = { '<C-j>', '<Down>' },
    preview_scroll_up = '<C-b>',
    preview_scroll_down = 'C-f>',
    cycle_forward_query = '<C-u>',
  },
  debug = {
    enabled = true,
    show_scores = false,
  },
  title = 'Find files',
  prompt = ' ',
  layout = {
    width = 0.8,
  },
  preview = {
    enabled = true,
    show_file_info = true,
  },
}

vim.keymap.set('n', 'ff', function()
  require('fff').find_files()
end, { desc = 'FFFind files' })
vim.keymap.set('n', 'fg', function()
  require('fff').live_grep()
end, { desc = 'FFFind grep' })
