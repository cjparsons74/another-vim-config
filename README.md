# Clean before switching to this config
```
rm -Rf ~/.local/share/nvim/
rm -Rf ~/.local/state/nvim/
rm -R  ~/.cache/nvim/
rm -R  ~/.cache/pyright-python/
```

# Language servers
## Management
Configs for LSP client, handles attaching to servers per-language etc.

https://github.com/neovim/nvim-lspconfig

## Python
### Ruff-lsp for formatting and linting
https://github.com/astral-sh/ruff-lsp

```
pip install ruff-lsp
```

### Pyright for definitions, function signatures
https://microsoft.github.io/pyright/#/installation

```
pip install pyright
```

## Bash
https://github.com/bash-lsp/bash-language-server

```
npm i -g bash-language-server
brew install shellcheck
```

## Lua
```
brew install lua-language-server
```

# Use a pyproject.toml

Put a pyproject.toml in the root of the project to stop pyright searching
your whole home directory for workspace files.

Basic content:

```
[project]
name = "my-project"
```
