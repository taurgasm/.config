return {
  {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim", "willothy/wezterm.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
          vim.g.molten_auto_open_output = false -- cannot be true if molten_image_provider = "wezterm"
          vim.g.molten_output_show_more = true
          vim.g.molten_image_provider = "image.nvim"
          vim.g.molten_output_virt_lines = true
          vim.g.molten_split_direction = "right" --direction of the output window, options are "right", "left", "top", "bottom"
          vim.g.molten_split_size = 40 --(0-100) % size of the screen dedicated to the output window
          vim.g.molten_virt_text_output = true
          vim.g.molten_use_border_highlights = true
          vim.g.molten_virt_lines_off_by_1 = true
          vim.g.molten_auto_image_popup = false
          vim.g.python3_host_prog=vim.fn.expand("~/git_projects/EQ_trackers/.venv/bin/python3")
        end,
    },
    {
        -- see the image.nvim readme for more information about configuring this plugin
        "3rd/image.nvim",
        -- backend = 'ueberzug',
        opts = {
            backend = "ueberzug", -- whatever backend you would like to use
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
  }
}
