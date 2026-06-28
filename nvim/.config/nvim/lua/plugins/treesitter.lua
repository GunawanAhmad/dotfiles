vim.pack.add {
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
}

local parsers = {
  'bash',
  'c',
  'python',
  'query',
  'yaml',
  'svelte',
  'typescript',
  'javascript',
  'vue',
  'rust',
  'go',
  'jsx',
  'html',
  'css',
  'json',
}

local function install_parsers(opts)
  opts = opts or {}

  if vim.fn.executable 'tree-sitter' ~= 1 then
    vim.notify('tree-sitter CLI is not installed yet. Run :MasonToolsInstallSync first.', vim.log.levels.WARN)
    return
  end

  local install_task = require('nvim-treesitter').install(parsers)

  if opts.wait and install_task then
    install_task:wait(300000)
  end
end

vim.api.nvim_create_user_command('TSInstallConfigured', function(args)
  install_parsers { wait = args.bang }
end, {
  bang = true,
  desc = 'Install configured Treesitter parsers',
})

install_parsers()

vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsUpdateCompleted',
  callback = function()
    install_parsers()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf, filetype = args.buf, args.match

    local language = vim.treesitter.language.get_lang(filetype)
    if not language then
      return
    end

    if not vim.treesitter.language.add(language) then
      return
    end

    vim.treesitter.start(buf, language)

    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
