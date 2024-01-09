return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = { -- only load the plugin on these keymaps
    { "<C-n>",      "<CMD>Neotree filesystem toggle<CR>" },
    { "<leader>bf", "<CMD>Neotree buffers reveal float<CR>" },
  },
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        window = {
          mappings = {
            ["O"] = "open",
          },
        },
      },
    })
    --Map Neo-tree
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    -- vim.keymap.set("n", "<C-s>", ":Neotree git_status<CR>", {})
  end,
}
