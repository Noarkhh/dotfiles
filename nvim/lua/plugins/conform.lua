return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
      },
      formatters = {
        clang_format = {
          prepend_args = { "--style=file:/Users/noarkhh/.clang-format" },
        },
      },
    },
  },
}
