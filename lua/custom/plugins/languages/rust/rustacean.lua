return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  lazy = false,
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    -- Check if codelldb is available in PATH (installed via Mason)
    local codelldb = vim.fn.exepath 'codelldb'
    if codelldb and codelldb ~= '' then
      -- Determine library extension based on OS
      local codelldb_lib_ext = vim.fn.has 'mac' == 1 and '.dylib' or '.so'
      -- Use Mason's opt directory structure
      local library_path = vim.fn.expand('$MASON/opt/lldb/lib/liblldb' .. codelldb_lib_ext)

      local cfg = require 'rustaceanvim.config'
      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb, library_path),
        },
      }
    else
      vim.notify('codelldb not found in PATH. Please install it via :MasonInstall codelldb', vim.log.levels.WARN)
    end
  end,
}
