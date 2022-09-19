local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

-- Don't auto commnenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor location when file is opened
autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- format
autocmd("BufWritePre", {
  pattern =  "*.go" ,
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 500)
  end,
})

autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local clients = vim.lsp.buf_get_clients()
    for _, client in pairs(clients) do

      local params = vim.lsp.util.make_range_params(nil, client.offset_encoding)
      params.context = {only = {"source.organizeImports"}}

      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 5000)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
          else
            vim.lsp.buf.execute_command(r.command)
          end
        end
      end
    end
  end
})
