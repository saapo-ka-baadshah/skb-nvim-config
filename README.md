# skb-nvim-config
My centralised NVIM configuration to maintain my NeoVim IDE features within all my machines.

## Prerequisites
Following softwares and platforms are required:
- NeoVim (>= v0.11.6)
- linux or mac

## Usage
Run following command to get the neovim configuration:
```shell
bash <(curl -fsSL https://raw.githubusercontent.com/saapo-ka-baadshah/skb-nvim-config/refs/heads/main/setup.sh)
```
Press `Y` to continue.

## How it works?
This repository is cloned into your NeoVim config directory,
Default: `~/.config/nvim`

This way we can be assured that, we maintain the same NeoVim configurations accross all the machines.

## Plugins

### Plugin Manager
- **[folke/lazy.nvim](https://github.com/folke/lazy.nvim)** - Plugin manager for Neovim

### Editor Enhancements
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Tree-sitter integration for syntax highlighting and code parsing

### File Explorer
- **[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer as a sidebar tree view
- **[nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File type icons for various plugins

### Terminal
- **[akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)** - Floating terminal with keybindings for window navigation
- **[norcalli/nvim-terminal.lua](https://github.com/norcalli/nvim-terminal.lua)** - Terminal wrapper for markdown preview

### Intellisense (LSP & Completions)
- **[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - Language Server Protocol configuration
- **[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)** - LSP/DAP/Linter installer
- **[williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** - Mason integration with LSP config
- **[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Code completion engine
- **[hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)** - LSP source for nvim-cmp
- **[hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)** - Buffer source for nvim-cmp
- **[hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)** - Path source for nvim-cmp
- **[saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)** - LuaSnip source for nvim-cmp
- **[L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine
- **[rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)** - Pre-configured snippets collection
- **[onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim)** - VSCode-like icons for LSP completions

### Markdown
- **[mrjones2014/mdpreview.nvim](https://github.com/mrjones2014/mdpreview.nvim)** - Live markdown preview

### Status Line
- **[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Status line with branch, diagnostics, and lazy updates indicator

### Splash Screen
- **[goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)** - Customizable welcome screen with ASCII art and quick actions

### AI Integration
- **[nickjvandyke/opencode.nvim](https://github.com/nickjvandyke/opencode.nvim)** - AI coding assistant with inline suggestions and commands
- **[folke/snacks.nvim](https://github.com/folke/snacks.nvim)** - Optional dependency for opencode.nvim picker integration

### Custom Plugins
- **[saapo-ka-baadshah/default_editor_plugin.nvim](https://github.com/saapo-ka-baadshah/default_editor_plugin.nvim)** - Custom default editor plugin

## Library Structure

```
lua/
├── ai-client/
│   ├── init.lua        # OpenCode AI client setup
│   └── aiclient.lua    # OpenCode plugin configuration with keymaps
├── floatterminal/
│   └── init.lua        # Floating terminal with toggleterm.nvim
├── intellisense/
│   ├── init.lua        # Intellisense module aggregator
│   ├── lsp.lua         # LSP servers: clangd, csharp_ls, ts_ls, pyright, lua_ls, bashls
│   ├── cmp.lua         # nvim-cmp completion setup with snippets
│   └── ui.lua          # Mason UI configuration
├── lualine-wrapper/
│   └── init.lua        # Lualine status line with custom sections
├── markdown-preview/
│   └── init.lua        # Markdown preview configuration
├── nvimtree/
│   ├── init.lua        # NvimTree module aggregator
│   └── tree.lua        # File tree explorer configuration
└── splash/
    ├── init.lua        # Splash module aggregator
    └── alpha.lua       # Alpha welcome screen with ASCII art
```

### Module Pattern
Each module in `lua/` follows a lazy-loading pattern:
1. The `init.lua` serves as an aggregator that collects specs from submodules
2. Each submodule exports a table of plugin specs compatible with lazy.nvim
3. Plugins are configured with lazy-loading options (`ft`, `event`, `keys`)

### Supported Languages
The LSP configuration includes support for:
- C/C++ (clangd)
- C# (csharp_ls)
- TypeScript/JavaScript (ts_ls)
- Python (pyright)
- Lua (lua_ls)
- Bash/Shell (bashls)

## Keybindings

| Keybinding | Action |
|------------|--------|
| `<leader>ft` | Toggle floating terminal |
| `<leader>e` | Toggle NvimTree file explorer |
| `<leader>fe` | Find current file in NvimTree |
| `<leader>md` | Toggle markdown preview |
| `<leader>oc` | Toggle OpenCode AI assistant |
| `<C-a>` | Ask OpenCode about selection/buffer |
| `<C-x>` | Open OpenCode picker |
| `gd` | Go to LSP definition |
| `K` | Show LSP hover documentation |
| `<leader>rn` | LSP rename |
| `<leader>ac` | LSP code action |
| `gr` | LSP references |
| `<leader>df` | Show diagnostic float |



