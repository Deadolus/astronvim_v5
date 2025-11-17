-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          --["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<leader>bD"] = {
            function()
              require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<leader>b"] = { name = "Buffers" },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
          --['<leader>?'] = {require('plugins.configs.telescope').oldfiles, desc = '[?] Find recently opened files' },
          ['<leader><space>'] = { function() require('telescope.builtin').buffers() end, desc = 'Find existing buffers'},
          --['<leader>fM'] = { function() require('telescope.builtin').marks() end, desc = 'Find existing marks'},
          --['<leader>fg'] = { function() require('telescope.builtin').live_grep() end, desc = 'Find existing marks'},
          --['<leader>fb'] = { function() require('telescope.builtin').current_buffer_fuzzy_find() end, desc = 'Fuzzy find in current file'},
          --['<leader>fB'] = { function() require('telescope.builtin').buffers() end, desc = 'Find buffers'},
          --['<leader>fT'] = { function() require('telescope.builtin').tags() end, desc = 'Find tags'},
          --['<leader>fl'] = { function() require('telescope.builtin').resume() end, desc = 'Resume last search'},
          ["gt"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
          ["gT"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },
          ["<leader>tn"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
          -- Open file in browser
          ["<leader>uf"] = { ":exe ':silent !firefox %'<cr>", desc = "Run Browser" },
          ["<leader>b."] = { ":b#<cr>", desc = "Last accessed buffer"},
          ["<leader>bn"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<leader>bp"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["<leader>bl"] = {
            function() require("astronvim.utils.buffer").prev() end,
            desc = "Last buffer in tabline",
          },
          --["<leader><leader>bp"] = "prev_source",
          --["<leader><leader>bn"] = "next_source",
          --["<leader>s"] = { "<Plug>(easymotion-overwin-f)", desc = "Search easymotion"},
          ["<leader>v"] = { "<cmd>vsplit<cr>", desc = "Vertical Split", noremap = true },
          ["<leader>h"] = { "<cmd>split<cr>", desc = "Horizontal Split", noremap = true },
          [",s"] = { ":HopChar1MW<CR>", desc = "Hop bi-char"},
          [",b"] = { ":HopChar2MW<CR>", desc = "Hop bi-char"},
          ["ö"] = { function() require("which-key").show("`") end, desc = "Marks", nowait = true},
          [",fw"] = { ":HopWord<CR>", desc = "Hop word"},
          [",fl"] = { ":HopLine<CR>", desc = "Hop Line"},
          [",ff"] = { ":HopPattern<CR>", desc = "Hop pattern"},
          ["w"] = { "<Plug>CamelCaseMotion_w", desc = "CamelCase word"},
          ["b"] = { "<Plug>CamelCaseMotion_b", desc = "CamelCase word"},
          ["e"] = { "<Plug>CamelCaseMotion_e", desc = "CamelCase word"},
          ["<leader>ag"] = { ":Ag ", desc = "Start silversearcher"},
          ["<leader>fA"] = { ":Ag <c-r><c-w><CR>", desc = "Search current word with silversearcher"},
          ["<leader>lq"] = {":lua vim.diagnostic.setqflist()<CR>", desc = "Fill quickfix list with diagnostic"},
          ["<leader>uL"] = {":set list!<CR>", desc = "Toggle display of whitespace (list) characters"},
          ["<C-ö>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal" },
          ["<leader><leader>t"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal" },
          ["<leader>dl"] = { ":Dispatch<Up><cr><cr>", desc = "Last dispatch command" },
          ["<leader>rtw"] = { ":%s/\\s\\+$/<CR>", desc = "Remove trailing whitespace" },

          ["<leader>lc"] = { ":CodeCompanionChat<CR>", desc = "Code companion chat" },
          ["|"] = false, -- This disables the vertical split mapping
          ["<leader><leader>h"] = {
            function()
              local wins = vim.api.nvim_tabpage_list_wins(0)
              if #wins > 1 and vim.api.nvim_get_option_value("filetype", { win = wins[1] }) == "neo-tree" then
                vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
              end
              require("alpha").start(false, require("alpha").default_config)
            end,
            desc = "Home Screen",
          },
        },
        -- visual mode
        v = {
          ["<leader>l"] = { "", desc = "Code companion" },
          ["<leader>lc"] = { ":CodeCompanionChat<CR>", desc = "Code companion chat" },
          ["<leader>ld"] = {  callback = function()
            require("codecompanion").prompt("doxydocumentation")
          end,
            desc = "Code companion chat" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
          ["<C-ö>"] = { "<C-\\><C-n><C-w>l", desc = "Hide terminal" },
          ["<leader><leader>t"] = { "<C-\\><C-n><C-w>l", desc = "Hide terminal" },
          -- C-ö is received as ; inside tmux
        },
      },
    },
  },
}
