return {
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      local api = require('nvim-tree.api')

      require('nvim-tree').setup({
        on_attach = function(bufnr)
          -- Key mappings
          local opts = { noremap = true, silent = true, nowait = true, buffer = bufnr }

          vim.keymap.set('n', 'a', api.fs.create, opts)
          vim.keymap.set('n', 'r', api.fs.rename, opts)
          vim.keymap.set('n', 'd', api.fs.remove, opts)

          vim.keymap.set('n', '<CR>', function()
            local node = api.tree.get_node_under_cursor()
            if node.type == 'directory' then
              -- Toggle folder if it's a directory
              api.node.open.edit() -- Open or close the directory
            else
              -- Open file if it's not a directory
              api.node.open.edit()
            end
          end, opts)
        end,
      })

      -- Toggle nvim-tree with <leader>e
      vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end
  }
}
