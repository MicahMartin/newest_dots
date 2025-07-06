return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  ---@type TSTextObjects.UserConfig
  opts = {
    ---@type TSTextObjects.Config.Select
    select = {
      lookahead = true,
      include_surrounding_whitespace = false,
    },
    ---@type TSTextObjects.Config.Move
    move = {
      set_jumps = true,
    },
    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "V", -- linewise
      ["@class.outer"] = "<c-v>", -- blockwise
    },
  },
  config = function()
    local select = require("nvim-treesitter-textobjects.select")
    for _, mode in ipairs({ "x", "o" }) do
      -- Loops
      vim.keymap.set(mode, "al", function()
        select.select_textobject("@loop.outer", "textobjects")
      end, { desc = "Select around loop" })
      vim.keymap.set(mode, "il", function()
        select.select_textobject("@loop.inner", "textobjects")
      end, { desc = "Select inside loop" })
      -- Conditionals
      vim.keymap.set(mode, "aa", function()
        select.select_textobject("@assignment.outer", "textobjects")
      end, { desc = "Select around assignment" })

      vim.keymap.set(mode, "ia", function()
        select.select_textobject("@assignment.inner", "textobjects")
      end, { desc = "Select inside assignment" })

      vim.keymap.set(mode, "la", function()
        select.select_textobject("@assignment.lhs", "textobjects")
      end, { desc = "Select left side of assignment" })

      vim.keymap.set(mode, "ra", function()
        select.select_textobject("@assignment.rhs", "textobjects")
      end, { desc = "Select right side of assignment" })

      vim.keymap.set(mode, "am", function()
        select.select_textobject("@function.outer", "textobjects")
      end, { desc = "Select around function" })

      vim.keymap.set(mode, "im", function()
        select.select_textobject("@function.inner", "textobjects")
      end, { desc = "Select inside function" })

      vim.keymap.set(mode, "al", function()
        select.select_textobject("@class.outer", "textobjects")
      end, { desc = "Select around class" })

      vim.keymap.set(mode, "il", function()
        select.select_textobject("@class.inner", "textobjects")
      end, { desc = "Select inside class" })

      vim.keymap.set(mode, "ad", function()
        select.select_textobject("@conditional.outer", "textobjects")
      end, { desc = "Select around conditional" })

      vim.keymap.set(mode, "id", function()
        select.select_textobject("@conditional.inner", "textobjects")
      end, { desc = "Select inside conditional" })

      vim.keymap.set(mode, "ar", function()
        select.select_textobject("@parameter.outer", "textobjects")
      end, { desc = "Select around parameter" })

      vim.keymap.set(mode, "ir", function()
        select.select_textobject("@parameter.inner", "textobjects")
      end, { desc = "Select inside parameter" })

      vim.keymap.set(mode, "af", function()
        select.select_textobject("@call.outer", "textobjects")
      end, { desc = "Select around function call" })

      vim.keymap.set(mode, "if", function()
        select.select_textobject("@call.inner", "textobjects")
      end, { desc = "Select inside function call" })

      vim.keymap.set(mode, "ac", function()
        select.select_textobject("@comment.outer", "textobjects")
      end, { desc = "Select around comment" })

      vim.keymap.set(mode, "as", function()
        select.select_textobject("@statement.outer", "textobjects")
      end, { desc = "Select around statement" })

      vim.keymap.set(mode, "is", function()
        select.select_textobject("@statement.outer", "textobjects")
      end, { desc = "Select inside statement" })
    end

    -- swap
    local swap = require("nvim-treesitter-textobjects.swap")

    vim.keymap.set("n", ")m", function()
      swap.swap_next("@function.outer")
    end, { desc = "Swap with next function" })

    vim.keymap.set("n", ")c", function()
      swap.swap_next("@comment.outer")
    end, { desc = "Swap with next comment" })

    vim.keymap.set("n", ")r", function()
      swap.swap_next("@parameter.inner")
    end, { desc = "Swap with next parameter" })

    vim.keymap.set("n", ")C", function()
      swap.swap_next("@class.outer")
    end, { desc = "Swap with next class" })

    vim.keymap.set("n", "(m", function()
      swap.swap_previous("@function.outer")
    end, { desc = "Swap with previous function" })

    vim.keymap.set("n", "(c", function()
      swap.swap_previous("@comment.outer")
    end, { desc = "Swap with previous comment" })

    vim.keymap.set("n", "(r", function()
      swap.swap_previous("@parameter.inner")
    end, { desc = "Swap with previous parameter" })

    vim.keymap.set("n", "(C", function()
      swap.swap_previous("@class.outer")
    end, { desc = "Swap with previous class" })

    -- move
    local move = require("nvim-treesitter-textobjects.move")

    vim.keymap.set({ "n", "x", "o" }, "]m", function()
      move.goto_next_start("@function.outer")
    end, { desc = "Go to next function start (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "]f", function()
      move.goto_next_start("@call.outer")
    end, { desc = "Go to next function call start (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "]d", function()
      move.goto_next_start("@conditional.outer")
    end, { desc = "Go to next conditional start (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "]o", function()
      move.goto_next_start("@loop.outer")
    end, { desc = "Go to next loop start (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "]s", function()
      move.goto_next_start("@statement.outer")
    end, { desc = "Go to next statement start (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "]r", function()
      move.goto_next_start("@parameter.outer")
    end, { desc = "Go to next parameter start (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "]c", function()
      move.goto_next_start("@comment.outer")
    end, { desc = "Go to next comment start (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "]l", function()
      move.goto_next_start("@class.outer")
    end, { desc = "Go to next class start (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "]]m", function()
      move.goto_next_start("@function.inner")
    end, { desc = "Go to next function start (inner)" })

    vim.keymap.set({ "n", "x", "o" }, "]]f", function()
      move.goto_next_start("@call.inner")
    end, { desc = "Go to next function call start (inner)" })

    vim.keymap.set({ "n", "x", "o" }, "]]d", function()
      move.goto_next_start("@conditional.inner")
    end, { desc = "Go to next conditional start (inner)" })

    vim.keymap.set({ "n", "x", "o" }, "]]o", function()
      move.goto_next_start("@loop.inner")
    end, { desc = "Go to next loop start (inner)" })

    vim.keymap.set({ "n", "x", "o" }, "]]r", function()
      move.goto_next_start("@parameter.inner")
    end, { desc = "Go to next parameter start (inner)" })

    vim.keymap.set({ "n", "x", "o" }, "]]l", function()
      move.goto_next_start("@class.inner")
    end, { desc = "Go to next class start (inner)" })

    vim.keymap.set({ "n", "x", "o" }, "]M", function()
      move.goto_next_end("@function.outer")
    end, { desc = "Go to next function end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "]F", function()
      move.goto_next_end("@call.outer")
    end, { desc = "Go to next function call end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "]D", function()
      move.goto_next_end("@conditional.outer")
    end, { desc = "Go to next conditional end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "]O", function()
      move.goto_next_end("@loop.outer")
    end, { desc = "Go to next loop end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "]S", function()
      move.goto_next_end("@statement.outer")
    end, { desc = "Go to next statement end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "]R", function()
      move.goto_next_end("@parameter.outer")
    end, { desc = "Go to next parameter end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "]C", function()
      move.goto_next_end("@comment.outer")
    end, { desc = "Go to next comment end (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "]L", function()
      move.goto_next_end("@class.outer")
    end, { desc = "Go to next class end (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "]]M", function()
      move.goto_next_end("@function.inner")
    end, { desc = "Go to next function end (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "]]F", function()
      move.goto_next_end("@call.inner")
    end, { desc = "Go to next function call end (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "]]D", function()
      move.goto_next_end("@conditional.inner")
    end, { desc = "Go to next conditional end (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "]]O", function()
      move.goto_next_end("@loop.inner")
    end, { desc = "Go to next loop end (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "]]R", function()
      move.goto_next_end("@parameter.inner")
    end, { desc = "Go to next parameter end (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "]]B", function()
    --   move.goto_next_end("@block.inner")
    -- end, { desc = "Go to next block end (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "]]L", function()
      move.goto_next_end("@class.inner")
    end, { desc = "Go to next class end (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "]]R", function()
    --   move.goto_next_end("@frame.inner")
    -- end, { desc = "Go to next frame end (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "]]T", function()
    --   move.goto_next_end("@attribute.inner")
    -- end, { desc = "Go to next attribute end (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "]]E", function()
    --   move.goto_next_end("@scopename.inner")
    -- end, { desc = "Go to next scope name end (inner)" })

    vim.keymap.set({ "n", "x", "o" }, "[m", function()
      move.goto_previous_start("@function.outer")
    end, { desc = "Go to previous function start (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[f", function()
      move.goto_previous_start("@call.outer")
    end, { desc = "Go to previous function call start (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[d", function()
      move.goto_previous_start("@conditional.outer")
    end, { desc = "Go to previous conditional start (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[o", function()
      move.goto_previous_start("@loop.outer")
    end, { desc = "Go to previous loop start (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[s", function()
      move.goto_previous_start("@statement.outer")
    end, { desc = "Go to previous statement start (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[r", function()
      move.goto_previous_start("@parameter.outer")
    end, { desc = "Go to previous parameter start (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[c", function()
      move.goto_previous_start("@comment.outer")
    end, { desc = "Go to previous comment start (outer)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[b", function()
    --   move.goto_previous_start("@block.outer")
    -- end, { desc = "Go to previous block start (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[l", function()
      move.goto_previous_start("@class.outer")
    end, { desc = "Go to previous class start (outer)" })
    --
    -- vim.keymap.set({ "n", "x", "o" }, "[r", function()
    --   move.goto_previous_start("@frame.outer")
    -- end, { desc = "Go to previous frame start (outer)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[t", function()
    --   move.goto_previous_start("@attribute.outer")
    -- end, { desc = "Go to previous attribute start (outer)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[e", function()
    --   move.goto_previous_start("@scopename.outer")
    -- end, { desc = "Go to previous scope name start (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "[[m", function()
      move.goto_previous_start("@function.inner")
    end, { desc = "Go to previous function start (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "[[f", function()
      move.goto_previous_start("@call.inner")
    end, { desc = "Go to previous function call start (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "[[d", function()
      move.goto_previous_start("@conditional.inner")
    end, { desc = "Go to previous conditional start (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "[[o", function()
      move.goto_previous_start("@loop.inner")
    end, { desc = "Go to previous loop start (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "[[r", function()
      move.goto_previous_start("@parameter.inner")
    end, { desc = "Go to previous parameter start (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[[b", function()
    --   move.goto_previous_start("@block.inner")
    -- end, { desc = "Go to previous block start (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "[[l", function()
      move.goto_previous_start("@class.inner")
    end, { desc = "Go to previous class start (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[[r", function()
    --   move.goto_previous_start("@frame.inner")
    -- end, { desc = "Go to previous frame start (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[[t", function()
    --   move.goto_previous_start("@attribute.inner")
    -- end, { desc = "Go to previous attribute start (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[[e", function()
    --   move.goto_previous_start("@scopename.inner")
    -- end, { desc = "Go to previous scope name start (inner)" })

    vim.keymap.set({ "n", "x", "o" }, "[M", function()
      move.goto_previous_end("@function.outer")
    end, { desc = "Go to previous function end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[F", function()
      move.goto_previous_end("@call.outer")
    end, { desc = "Go to previous function call end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[D", function()
      move.goto_previous_end("@conditional.outer")
    end, { desc = "Go to previous conditional end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[O", function()
      move.goto_previous_end("@loop.outer")
    end, { desc = "Go to previous loop end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[S", function()
      move.goto_previous_end("@statement.outer")
    end, { desc = "Go to previous statement end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[A", function()
      move.goto_previous_end("@parameter.outer")
    end, { desc = "Go to previous parameter end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[C", function()
      move.goto_previous_end("@comment.outer")
    end, { desc = "Go to previous comment end (outer)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[B", function()
    --   move.goto_previous_end("@block.outer")
    -- end, { desc = "Go to previous block end (outer)" })
    vim.keymap.set({ "n", "x", "o" }, "[L", function()
      move.goto_previous_end("@class.outer")
    end, { desc = "Go to previous class end (outer)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[R", function()
    --   move.goto_previous_end("@frame.outer")
    -- end, { desc = "Go to previous frame end (outer)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[T", function()
    --   move.goto_previous_end("@attribute.outer")
    -- end, { desc = "Go to previous attribute end (outer)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[E", function()
    --   move.goto_previous_end("@scopename.outer")
    -- end, { desc = "Go to previous scope name end (outer)" })

    vim.keymap.set({ "n", "x", "o" }, "[[M", function()
      move.goto_previous_end("@function.inner")
    end, { desc = "Go to previous function end (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "[[F", function()
      move.goto_previous_end("@call.inner")
    end, { desc = "Go to previous function call end (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "[[D", function()
      move.goto_previous_end("@conditional.inner")
    end, { desc = "Go to previous conditional end (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "[[O", function()
      move.goto_previous_end("@loop.inner")
    end, { desc = "Go to previous loop end (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "[[A", function()
      move.goto_previous_end("@parameter.inner")
    end, { desc = "Go to previous parameter end (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[[B", function()
    --   move.goto_previous_end("@block.inner")
    -- end, { desc = "Go to previous block end (inner)" })
    vim.keymap.set({ "n", "x", "o" }, "[[L", function()
      move.goto_previous_end("@class.inner")
    end, { desc = "Go to previous class end (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[[R", function()
    --   move.goto_previous_end("@frame.inner")
    -- end, { desc = "Go to previous frame end (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[[T", function()
    --   move.goto_previous_end("@attribute.inner")
    -- end, { desc = "Go to previous attribute end (inner)" })
    -- vim.keymap.set({ "n", "x", "o" }, "[[E", function()
    --   move.goto_previous_end("@scopename.inner")
    -- end, { desc = "Go to previous scope name end (inner)" })

    -- Repeat movement with ; and ,
    local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

    -- vim.keymap.set(
    --   { "n", "x", "o" },
    --   ";",
    --   repeat_move.repeat_last_move,
    --   { expr = true, desc = "Repeat last textobject movement forward" }
    -- )
    -- vim.keymap.set(
    --   { "n", "x", "o" },
    --   ",",
    --   repeat_move.repeat_last_move_opposite,
    --   { expr = true, desc = "Repeat last textobject movement in reverse" }
    -- )
    -- vim.keymap.set( { "n", "x", "o" }, ";", repeat_move.repeat_last_move, { expr = true, desc = "Repeat last textobject movement forward" })
    -- vim.keymap.set( { "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous, { expr = true, desc = "Repeat last textobject movement backward" })
    --

    vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next, { expr = true })

    vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous, { expr = true })

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true, desc = "Repeatable built-in f" })
    vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true, desc = "Repeatable built-in F" })
    vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true, desc = "Repeatable built-in t" })
    vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true, desc = "Repeatable built-in T" })
  end,
}
