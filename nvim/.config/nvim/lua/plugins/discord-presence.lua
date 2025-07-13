return{
  'vyfor/cord.nvim',
  build = ':Cord update',
  opts = {
    display = {
      theme = 'catppuccin',
      swap_icons = true,
    },
    text = {
      workspace = function(workspace)
        if string.find(workspace.workspace_dir, '/work') then
          return 'Work Project'
        else
          return workspace.workspace
        end
      end,
      editing = function(file)
        if string.find(file.workspace_dir, '/work') then
          return ''
        else
          return file.filename
        end
      end,
      viewing = function(file)
        if string.find(file.workspace_dir, '/work') then
          return ''
        else
          return file.filename
        end
      end,
    },
  },
}
