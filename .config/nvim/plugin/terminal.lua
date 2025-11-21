local state = {
  terminal = {
    win = -1,
    buf = -1,
  },
}

local function create_terminal(opts)
  opts = opts or {}

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    height = math.floor(vim.o.lines * 0.25),
    style = "minimal",
    split = "below",
    win = -1,
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)
  if vim.bo[buf].buftype ~= "terminal" then
    vim.fn.jobstart(vim.o.shell, { term = true })
  end

  return { buf = buf, win = win }
end

local function toggle_terminal()
  if not vim.api.nvim_win_is_valid(state.terminal.win) then
    state.terminal = create_terminal({ buf = state.terminal.buf })
  else
    vim.api.nvim_win_hide(state.terminal.win)
  end
end

vim.api.nvim_create_user_command("ToggleHorizontalTerminal", toggle_terminal, {})
