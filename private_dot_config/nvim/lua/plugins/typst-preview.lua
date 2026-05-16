-- Typst Web Preview

return {
  "chomosuke/typst-preview.nvim",
  lazy = false,
  version = "1.*",

  config = function()
    require("typst-preview").setup({})

    -- Add your OpenPdf command here
    vim.api.nvim_create_user_command("OpenPdf", function()
      local filepath = vim.api.nvim_buf_get_name(0)

      if filepath:match("%.typ$") then
        local pdf_path = filepath:gsub("%.typ$", ".pdf")

        local opener
        -- macOS
        if vim.fn.has("mac") == 1 then
          opener = "open"
        -- Windows
        elseif vim.fn.has("win32") == 1 then
          opener = "start"
        -- Linux + WSL
        else
          opener = "xdg-open"
        end

        vim.system({ opener, pdf_path })
      end
    end, {})
  end,
}
