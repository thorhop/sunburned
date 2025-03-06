function ShakeMyTree()
  require('neo-tree.command').execute({
    action = 'show',          -- OPTIONAL, this is the default value
    reveal_file = reveal_file, -- path to file or folder to reveal
    reveal_force_cwd = true,   -- change cwd without asking if needed
    hide_hidden = false,
  })
end
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    --'3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
    'ryanmsnyder/toggleterm-manager.nvim',
  },
  config = function()
    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define('DiagnosticSignError',
      {text = ' ', texthl = 'DiagnosticSignError'})
    vim.fn.sign_define('DiagnosticSignWarn',
      {text = ' ', texthl = 'DiagnosticSignWarn'})
    vim.fn.sign_define('DiagnosticSignInfo',
      {text = ' ', texthl = 'DiagnosticSignInfo'})
    vim.fn.sign_define('DiagnosticSignHint',
      {text = '󰌵', texthl = 'DiagnosticSignHint'})
    local neotree = require('neo-tree')
    neotree.setup {
      enable_git_status = true,
      enable_diagnostics = true,
      auto_clean_after_session_restore = false,
      open_files_in_last_window = false,
      source_selector = {
        winbar = true,
        statusline = true,
        highlight_tab = "nil",
        highlight_tab_active = "nil",
        highlight_background = "nil",
        highlight_separator = "nil",
        highlight_separator_active = "nil",
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "document_symbols" },
          { source = "git_Status" },
        },
        tabslayout = "center",
      },
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      default_component_configs = {
        container = {
          enable_character_fade = true
        },
        indent = {
          indent_size = 2,
          padding = 1, -- extra padding on left hand side
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "theme.colors.fg_main",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
          -- then these will never be used.
          default = "*",
          highlight = "NeoTreeFileIcon"
        },
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            -- Change type
            added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted   = "✖",-- this can only be used in the git_status source
            renamed   = "󰁕",-- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        },
        -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
        file_size = {
          enabled = true,
          required_width = 64, -- min width of window required to show this column
        },
        type = {
          enabled = true,
          required_width = 122, -- min width of window required to show this column
        },
        last_modified = {
          enabled = true,
          required_width = 88, -- min width of window required to show this column
        },
        created = {
          enabled = true,
          required_width = 110, -- min width of window required to show this column
        },
        symlink_target = {
          enabled = false,
        },
      },
      filesystem = {
        use_libuv_file_watcher=false,
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all 'hide' just mean 'dimmed out'
          hide_dotfiles = false,
          hide_gitignored = true,
          follow_current_file = {enabled = true},
        },
        mappings = {
          ["<cr>"] = function(state)
            -- Open the file, but don't change the focus
            local node = state.tree:get_node()
            if node.type == "directory" then
              require('neo-tree.sources.filesystem').toggle_directory(state, node)
            else
              require('neo-tree.ui.renderer').focus_node(state, node)
              local cmd = string.format("%s %s", state.open_command, node.path)
              vim.cmd(cmd)
              vim.cmd("wincmd p") -- Switch back to the Neo-tree window
            end
          end,
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
      window = {
        width = 40,
        position = 'right',

      },
      git_status = {
        window = {
          mappings = {
            ["A"]  = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
            ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
            ["oc"] = { "order_by_created", nowait = false },
            ["od"] = { "order_by_diagnostics", nowait = false },
            ["om"] = { "order_by_modified", nowait = false },
            ["on"] = { "order_by_name", nowait = false },
            ["os"] = { "order_by_size", nowait = false },
            ["ot"] = { "order_by_type", nowait = false },
          }
        }
      },
      vim.keymap.set('n', '<leader>fe', function()
        require("neo-tree.command").execute({ source = "filesystem", toggle = true })
      end),
      vim.keymap.set('n', '<leader>fb', function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true })
      end),
      vim.keymap.set('n', '<leader>fg', function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end),
    }
    --ShakeMyTree()
  end,
}
