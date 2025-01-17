local indent_blankline = require("indent_blankline")

indent_blankline.setup({
  char = "▏",
  filetype_exclude = {
    "cheat40", "fern", "help", "packer", "text", "txt", "undotree", "yaml"
  },
  buftype_exclude = { "nofile", "terminal" },
  show_first_indent_level = true,
  show_foldtext = false,
  show_trailing_blankline_indent = false,
  use_treesitter = true,
})
