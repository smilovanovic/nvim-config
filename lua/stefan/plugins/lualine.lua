return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_c = {},
      lualine_x = { "searchcount", "filetype" },
    },
    tabline = {
      lualine_a = {
        "buffers",
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {
      lualine_a = {},
      lualine_b = {},
      -- lualine_c = { { "filename", path = 1 } },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    options = {
      globalstatus = true,
      section_separators = "",
      component_separators = "",
    },
  }
}
