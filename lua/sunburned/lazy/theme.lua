return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000
  },
  -- Auto dark mode plugin
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
    },
    dependencies = { "EdenEast/nightfox.nvim" },
    config = function()
      local auto_dark_mode = require("auto-dark-mode")
      
      auto_dark_mode.setup({
        -- Workaround for GNOME
        fallback = "light",
        update_interval = 1000, -- Update interval in milliseconds
        set_dark_mode = function()
          -- Set the colorscheme to nightfox when system is in dark mode
          vim.cmd("colorscheme carbonfox")
        end,
        set_light_mode = function()
          -- Set the colorscheme to dayfox when system is in light mode
          vim.cmd("colorscheme dayfox")
        end,
      })
      
      -- Start the auto-dark-mode detection
      auto_dark_mode.init()
    end,
  }
}
