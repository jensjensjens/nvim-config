vim.filetype.add({
  pattern = {
    ['.*%.yaml'] = {
      function(path, bufnr)
        -- Read first 50 lines to check for CloudFormation marker
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 50, false)
        for _, line in ipairs(lines) do
          if line:match('AWSTemplateFormatVersion') then
            return 'yaml.cloudformation'
          end
        end
        return 'yaml'
      end,
    },
  },
})
