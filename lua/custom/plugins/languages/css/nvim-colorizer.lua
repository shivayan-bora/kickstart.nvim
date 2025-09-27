return {
  'norcalli/nvim-colorizer.lua',
  lazy = false,
  opts = {},
  config = function()
    require('colorizer').setup()
  end,
}
