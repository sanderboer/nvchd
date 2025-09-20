AGENTS: Neovim config operational & style guide.
Build/Run: no compile step; start with `nvim` (lazy bootstraps plugins).
Lua Format: `stylua .` (column_width=120, indent=2 spaces, double quotes).
Python Tools (via null-ls/mason): `black .`; types: `mypy .`; LSP: `pyright`.
Single File Format: `stylua path/to/file.lua`; Python file: `black file.py`.
Tests: none present; if adding, put in `tests/` and run `pytest -q`; single test: `pytest tests/test_mod.py::TestClass::test_case`.
Do NOT edit `lazy-lock.json` manually; let lazy.nvim manage.
Requires: cache `require` results in locals (e.g. `local lspconfig = require "lspconfig"`).
Import Ordering: stdlib/builtin, then external plugins, then local modules.
Naming: lower_snake_case for locals, UPPER for constants, `M` table for module exports.
Strings: prefer double quotes (Stylua AutoPreferDouble); single quotes only if clearer.
Function Calls: omit parentheses for single-string arg per `call_parentheses=None`.
Tables: trailing commas allowed; keep one key per line when multiline.
Line Length: keep ≤120 chars; wrap earlier if readability improves.
Keymaps: use `vim.keymap.set` with `{ desc = "..." , silent = true }`.
Error Handling: use `pcall(require, "mod")` for optional deps; avoid broad `pcall` swallowing.
Avoid Globals: only set via `vim.g` / `vim.opt`; return tables (`return M`) from config files.
Python: stick to Black defaults (line length 88); type with PEP484; prefer explicit imports.
Security: never commit secrets/API keys; no network credentials in repo.
No cursor/copilot rule files found; follow these guidelines & least surprise principle.