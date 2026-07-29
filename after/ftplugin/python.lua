local function python_run_cmd()
  local venv = vim.env.VIRTUAL_ENV
  if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
    return vim.fn.shellescape(venv .. "/bin/python") .. " %"
  end

  local local_venv = vim.fn.getcwd() .. "/.venv/bin/python"
  if vim.fn.executable(local_venv) == 1 then
    return vim.fn.shellescape(local_venv) .. " %"
  end

  if vim.fn.executable("uv") == 1 then
    return "uv run python %"
  end

  return "python3 %"
end

vim.keymap.set("n", "<Leader>x", function()
  vim.cmd("!" .. python_run_cmd())
end, { buffer = true, desc = "Run current Python file" })

vim.wo.wrap = false
vim.bo.textwidth = 120
