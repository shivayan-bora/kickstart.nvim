-- This plugin is used to show the diff of the current file in the gutter.
return {
  'echasnovski/mini.diff',
  config = function()
    local diff = require 'mini.diff'
    diff.setup {
      -- Disabled by default
      source = diff.gen_source.none(),
    }
  end,
}
