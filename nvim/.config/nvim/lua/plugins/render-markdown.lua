vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.pack.add {
      'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    }

    -- Define Gruvbox hex values for markdown components
    local colors = {
      red = '#cc241d',
      yellow = '#d79921',
      green = '#98971a',
      aqua = '#689d6a',
      blue = '#458588',
      purple = '#b16286',
    }

    -- Create the text highlight groups (transparent background styling)
    -- Add a hex string to `bg` if you prefer solid banner highlights
    local highlights = {
      RenderMarkdownH1Bg = { fg = colors.red, bg = 'NONE', bold = true },
      RenderMarkdownH2Bg = { fg = colors.yellow, bg = 'NONE', bold = true },
      RenderMarkdownH3Bg = { fg = colors.green, bg = 'NONE', bold = true },
      RenderMarkdownH4Bg = { fg = colors.aqua, bg = 'NONE', bold = true },
      RenderMarkdownH5Bg = { fg = colors.blue, bg = 'NONE', bold = true },
      RenderMarkdownH6Bg = { fg = colors.purple, bg = 'NONE', bold = true },
    }

    -- Apply the highlight groups to Neovim
    for group, settings in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, settings)
    end

    require('render-markdown.nvim').setup {
      heading = {
        hl_groups = {
          'RenderMarkdownH1Bg',
          'RenderMarkdownH2Bg',
          'RenderMarkdownH3Bg',
          'RenderMarkdownH4Bg',
          'RenderMarkdownH5Bg',
          'RenderMarkdownH6Bg',
        },
      },
    }
  end,
})
