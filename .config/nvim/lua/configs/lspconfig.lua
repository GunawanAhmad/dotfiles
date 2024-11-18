-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "ts_ls", "gopls", "rust_analyzer", "volar", "eslint" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.eslint.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}

-- This config to enable TS on vue or volar. Make sure install @vue/typescript-plugin and make sure the location is pointing to the right location
local function get_current_node_version_on_nvm()
  local version = vim.fn.system "bash -c 'source $HOME/.nvm/nvm.sh && nvm current'"
  return vim.trim(version)
end

lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.loop.os_getenv "NVM_DIR"
          .. "/versions/node/"
          .. get_current_node_version_on_nvm()
          .. "/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}
