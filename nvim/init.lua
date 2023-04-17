-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("go").setup()
require("lspconfig.server_configurations.pyright").setup()
