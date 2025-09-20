AGENTS: Neovim config operational & style guide (Python, TypeScript, SCSS, Rust, Go).
Run: open with `nvim` (lazy bootstraps); no build step here.
Lua Format: `stylua .` (width 120, 2-space indent, double quotes, no parens single-string calls).
Python: format `black .`; type check `mypy .`; LSP `pyright` (Black line length 88).
Other Lang LSPs: ts (typescript-language-server), rust (rust-analyzer), go (gopls), scss (cssls); ensure binaries via mason.
Single File: `stylua file.lua`; `black file.py`; add language-specific formatters if introduced.
Tests: none; add in `tests/`; run all: `pytest -q`; single test: `pytest tests/test_mod.py::TestClass::test_case`.
Lockfile: never edit `lazy-lock.json` manually.
Requires: assign `local mod = require "mod"`; cache modules in locals.
Imports Order: stdlib/builtin first, then external plugins, then local modules.
Naming: lower_snake_case locals; UPPER constants; export via `M` table; avoid globals (use `vim.g`, `vim.opt`).
Strings: prefer double quotes; single only when clearer or escaping heavy.
Tables: one key per line when multiline; allow trailing commas.
Line Length: <=120 Lua; wrap earlier for clarity.
Keymaps: use `vim.keymap.set(..., { desc = "...", silent = true })`.
Error Handling: `pcall(require, "mod")` for optional deps; avoid broad silent catches.
LSP Setup: migrated to `vim.lsp.start` (Neovim 0.11 style); do NOT use deprecated `require("lspconfig").X.setup`.
Python Types: use PEP484 annotations; explicit imports over wildcard.
Security: no secrets/API keys committed; no credentials in repo.
AI Plugins: Copilot/Codeium present; no cursor/copilot rule files—follow least surprise & these guidelines.