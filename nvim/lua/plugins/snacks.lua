return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      force = true,
      convert = {
        magick = {
          default = { "{src}[0]", "-scale", "3840x2160>" },
        },
      },
    },
  },
}
