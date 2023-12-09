return {

  -- Tweak Noice
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })
      opts.commands = {
        all = {
          -- Options for the message history of ':Noice'
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })
      opts.presets.lsp_doc_border = true
    end,
  },

  -- Change notification timeout
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  -- Add file names for each pane
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#eb6f92", guifg = "#191724" },
            InclineNormalNC = { guibg = "#6e6a86", guifg = "#e0def4" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- Buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = true,
      },
    },
  },

  -- Color column
  {
    "Bekaboo/deadcolumn.nvim",
  },
  -- Logo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
          ______  __    __  .______       __       _______.___________. __       ___      .__   __. 
         /      ||  |  |  | |   _  \     |  |     /       |           ||  |     /   \     |  \ |  | 
        |  ,----'|  |__|  | |  |_)  |    |  |    |   (----`---|  |----`|  |    /  ^  \    |   \|  | 
        |  |     |   __   | |      /     |  |     \   \       |  |     |  |   /  /_\  \   |  . `  | 
        |  `----.|  |  |  | |  |\  \----.|  | .----)   |      |  |     |  |  /  _____  \  |  |\   | 
         \______||__|  |__| | _| `._____||__| |_______/       |__|     |__| /__/     \__\ |__| \__| 
                                                                                                    
                      _______. __    __       _______.___________.    ___   ____    ____            
                     /       ||  |  |  |     /       |           |   /   \  \   \  /   /            
                    |   (----`|  |  |  |    |   (----`---|  |----`  /  ^  \  \   \/   /             
                     \   \    |  |  |  |     \   \       |  |      /  /_\  \  \_    _/              
                 .----)   |   |  `--'  | .----)   |      |  |     /  _____  \   |  |                
                 |_______/     \______/  |_______/       |__|    /__/     \__\  |__|                
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
