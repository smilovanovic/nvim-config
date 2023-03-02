return {
  "lukas-reineke/indent-blankline.nvim",
  event = 'VeryLazy',
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = 'VeryLazy',
    config = function()
      require("mini.indentscope").setup({
        draw = {
          animation = require("mini.indentscope").gen_animation.none(),
        },
        symbol = "",
      })
    end,
  },
}
