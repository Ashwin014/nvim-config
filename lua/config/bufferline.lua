require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left", separator = true },
    },
    show_buffer_close_icons = false,
    show_close_icon = false,
    close_icon = "",
    max_name_length = 24,
    max_prefix_length = 15,
    truncate_names = false,
    tab_size = 22,
    color_icons = true,
  },
})
