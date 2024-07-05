return {
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
        groups = {
          all = {
            Function = { fg = "palette.blue" },
          },
        },
      })
      require("config.colorscheme")

      vim.cmd.colorscheme("nightfox")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "terafox",
    },
  },
}
