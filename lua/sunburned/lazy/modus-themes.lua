function ColorMyPencils(color)
  color = color or 'modus'
  vim.cmd.colorscheme(color)
  --vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  --vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end
return {
  'miikanissi/modus-themes.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('modus-themes').setup {
      -- Theme comes in two styles `modus_operandi` and `modus_vivendi`
      -- `auto` will automatically set style based on background set with vim.o.background
      style = 'auto',
      variant = 'tinted', -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
      transparent = false, -- Transparent background (as supported by the terminal)
      dim_inactive = false, -- 'non-current' windows are dimmed
      hide_inactive_statusline = true, -- Hide statuslines on inactive windows. Works with the standard **StatusLine**, **LuaLine** and **mini.statusline**
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
      on_colors = function(colors)
      	colors.error = colors.red_faint -- Change error color to the 'faint' variant
      end,
      on_highlights = function(highlight, color)
      	highlight.Boolean = { fg = color.green } -- Change Boolean highlight to use the green color
      end,
    }
    ColorMyPencils('modus')
  end
}
