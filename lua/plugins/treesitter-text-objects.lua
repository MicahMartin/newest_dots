return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  opts = {},
  keys = {
    {
      "af",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end,
      mode = { "x", "o" },
      desc = "@function.outer",
    },
    {
      "if",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end,
      mode = { "x", "o" },
      desc = "@function.inner",
    },
    {
      "ac", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end,
      mode = { "x", "o" }, -- mode obj with 2 strings
      desc = "@class.outer", -- description should be same as the query string (@whatever)
    },

    {
      "ic", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end,
      mode = { "x", "o" }, -- mode obj with 2 strings
      desc = "@class.inner", -- description should be same as the query string (@whatever)
    },

    {
      "as", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
      end,
      mode = { "x", "o" }, -- mode obj with 2 strings
      desc = "@local.scope", -- description should be same as the query string (@whatever)
    },

    --  {
    --    "<leader>a", -- key code

    --    function() -- callback
    --      require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
    --    end,
    --    mode = { "n" }, -- mode obj with 1 string
    --    desc = "@parameter.inner", -- description same as the query string
    --  },

    --  {
    --    "<leader>A", -- key code

    --    function() -- callback
    --      require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
    --    end,
    --    mode = { "n" }, -- mode obj with 1 string
    --    desc = "@parameter.outer", -- description same as the query string
    --  },

    {
      "]m", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
      end,
      mode = { "n", "x", "o" }, -- mode obj with 3 strings
      desc = "@function.outer", -- description same as the query string
    },

    {
      "]]", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "@class.outer",
    },

    {
      "]o", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "@loop.inner, @loop.outer",
    },

    {
      "]s", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
      end,
      mode = { "n", "x", "o" },
      desc = "@local.scope",
    },

    {
      "]z", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
      end,
      mode = { "n", "x", "o" },
      desc = "@fold",
    },

    {
      "]M", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "@function.outer",
    },

    {
      "][", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "@class.outer",
    },

    {
      "[m", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "@function.outer",
    },

    {
      "[[", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "@class.outer",
    },

    {
      "[M", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "@function.outer",
    },

    {
      "[]", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "@class.outer",
    },

    {
      "]d", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "@conditional.outer",
    },

    {
      "[d", -- key code

      function() -- callback
        require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
      end,
      mode = { "n", "x", "o" },
      desc = "@conditional.outer",
    },
  },
}
