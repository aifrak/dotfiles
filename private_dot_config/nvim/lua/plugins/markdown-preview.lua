return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  -- "git restore ." to avoid some git changes that make the Lazy checks fails
  build = "cd app && yarn install && git restore .",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  config = function()
    -- Basic behavior
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_command_for_global = 0
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_open_ip = ''
    vim.g.mkdp_browser = ''
    vim.g.mkdp_echo_preview_url = 0
    vim.g.mkdp_browserfunc = ''

    -- Rendering options
    vim.g.mkdp_preview_options = {
      mkit = {},
      katex = {},
      uml = {},
      maid = {},
      disable_sync_scroll = 0,
      sync_scroll_type = 'middle',
      hide_yaml_meta = 1,
      sequence_diagrams = {},
      flowchart_diagrams = {},
      content_editable = false,
      disable_filename = 0,
      toc = {},
    }

    -- Custom styles
    vim.g.mkdp_markdown_css = ''
    vim.g.mkdp_highlight_css = ''

    -- Server settings
    vim.g.mkdp_port = ''
    vim.g.mkdp_page_title = '「${name}」'
    vim.g.mkdp_images_path =  (os.getenv("HOME") or os.getenv("USERPROFILE")) .. "/.markdown_images"

    -- Filetypes
    vim.g.mkdp_filetypes = { "markdown" }

    -- Theme
    vim.g.mkdp_theme = 'dark'

    -- Combine preview windows
    vim.g.mkdp_combine_preview = 0
    vim.g.mkdp_combine_preview_auto_refresh = 1

    -- Keyboard mappings
    -- vim.keymap.set("n", "<C-s>", "<Plug>MarkdownPreview", { desc = "Start Markdown Preview" })
    vim.keymap.set("n", "<M-s>", "<Plug>MarkdownPreviewStop", { desc = "Stop Markdown Preview" })
    vim.keymap.set("n", "<C-p>", "<Plug>MarkdownPreviewToggle", { desc = "Toggle Markdown Preview" })

  end,
}
