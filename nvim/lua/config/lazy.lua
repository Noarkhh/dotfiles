local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
vim.lsp.config("dexter", {
  cmd = { "dexter", "lsp" },
  root_markers = { ".dexter.db", ".git", "mix.exs" },
  filetypes = { "elixir", "eelixir", "heex" },
  init_options = {
    followDelegates = true, -- jump through defdelegate to the target function
    -- stdlibPath = "",      -- override Elixir stdlib path (auto-detected)
    -- debug = false,        -- verbose logging to stderr (view with :LspLog)
  },
})
vim.lsp.config("clangd", {
  root_markers = {
    "compile_flags.txt",
    ".git",
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "configure.ac", -- AutoTools
  },
})
vim.lsp.enable({ "clangd", "pyright", "metals" })
-- vim.lsp.enable({ "clangd", "pyright", "metals", "expert", "dexter" })
