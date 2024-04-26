local function ext_encoding()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].bomb then
    return string.format("%s (bom)", vim.bo[bufnr].fileencoding)
  else
    return vim.bo[bufnr].fileencoding
  end
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      icons_enabled = true,
      globalstatus = true,
      theme = "OceanicNext",
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "searchcount", "selectioncount" },
      lualine_x = {
        ext_encoding,
        {
          "fileformat",
          symbols = {
            unix = "lf", -- e712
            dos = "crlf", -- e70f
            mac = "", -- e711
          },
        },
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_c = {
        {
          "filename",
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 1, -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory

          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          -- symbols = {
          --   modified = "[+]",      -- Text to show when the file is modified.
          --   readonly = "[-]",      -- Text to show when the file is non-modifiable or readonly.
          --   unnamed = "[No Name]", -- Text to show for unnamed buffers.
          --   newfile = "[New]",     -- Text to show for newly created file before first write
          -- },
        },
      },
    },
    -- tabline = {
    --   --   lualine_a = { "buffers" },
    --   --   lualine_b = { "branch" },
    --   --   lualine_c = { "filename" },
    --   --   lualine_x = {},
    --   --   lualine_y = {},
    -- },
    winbar = {
      lualine_c = {
        {
          "filename",
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 1, -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory

          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          -- symbols = {
          --   modified = "[+]",      -- Text to show when the file is modified.
          --   readonly = "[-]",      -- Text to show when the file is non-modifiable or readonly.
          --   unnamed = "[No Name]", -- Text to show for unnamed buffers.
          --   newfile = "[New]",     -- Text to show for newly created file before first write
          -- },
        },
      },
      lualine_z = { "tabs" },
    },
  },
}
