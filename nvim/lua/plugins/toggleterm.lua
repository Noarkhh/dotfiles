return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-,>]],
      direction = "vertical",
      size = vim.o.columns * 0.3,
      on_open = function(_)
        vim.cmd("stopinsert")
        vim.defer_fn(function()
          vim.cmd("startinsert")
        end, 20)
      end,
    })
    vim.schedule(function()
      vim.cmd("ToggleTerm")
      vim.cmd("wincmd p")
      vim.defer_fn(function()
        vim.cmd("stopinsert")
      end, 20)
    end)
  end,
}
