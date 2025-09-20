-- LSP setup (Neovim 0.11+ style: avoids deprecated require("lspconfig").server.setup)
local base = require "nvchad.configs.lspconfig"
local on_attach = base.on_attach
local on_init = base.on_init
local capabilities = base.capabilities

-- Only pull in specific lspconfig utilities (does NOT trigger deprecated framework warning)
local util = require "lspconfig.util"

local function mk_root(patterns, fallback)
  return function(fname)
    return util.root_pattern(unpack(patterns))(fname) or fallback or util.path.dirname(fname)
  end
end

-- Server specifications (preserve original broad filetype set; refine if desired)
local servers = {
  html = {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "typescript", "vue", "javascript", "python" },
    root_dir = mk_root { "package.json", ".git" },
  },
  cssls = {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "html", "typescript", "vue", "javascript", "python" },
    root_dir = mk_root { "package.json", ".git" },
  },
  ts_lsp = { -- previously "ts_lsp" in config; custom name retained
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "html", "typescript", "vue", "javascript", "python" },
    root_dir = mk_root { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  },
  pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = mk_root { "pyproject.toml", "setup.cfg", "setup.py", "requirements.txt", ".git" },
  },
}

-- Build reverse index: filetype -> servers
local ft_index = {}
for name, spec in pairs(servers) do
  for _, ft in ipairs(spec.filetypes) do
    ft_index[ft] = ft_index[ft] or {}
    table.insert(ft_index[ft], name)
  end
end

local group = vim.api.nvim_create_augroup("UserLspAutoStart", { clear = true })

local make_config = vim.lsp.config or function(cfg) return cfg end -- fallback if older minor version

local function start_server(name, spec, bufnr)
  if vim.fn.executable(spec.cmd[1]) == 0 then
    return -- silently skip if binary missing; mason can install later
  end
  local cfg = vim.tbl_deep_extend("force", {
    name = name,
    cmd = spec.cmd,
    root_dir = spec.root_dir(vim.api.nvim_buf_get_name(bufnr)),
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = spec.filetypes,
  }, spec.extra or {})
  vim.lsp.start(make_config(cfg))
end

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local list = ft_index[ft]
    if not list then return end
    for _, name in ipairs(list) do
      start_server(name, servers[name], args.buf)
    end
  end,
})

-- Manual start for already-loaded buffers (e.g., config sourced after open files)
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) then
    local ft = vim.bo[buf].filetype
    local list = ft_index[ft]
    if list then
      for _, name in ipairs(list) do
        start_server(name, servers[name], buf)
      end
    end
  end
end
