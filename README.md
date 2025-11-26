# nvrush

<p align="center">
  <a href="https://dotfyle.com/nvrush/nvrush">
    <img src="https://dotfyle.com/nvrush/nvrush/badges/plugins?style=flat-square&colorA=1e1e2e&colorB=89b4fa" alt="Plugins">
  </a>
  <a href="https://dotfyle.com/nvrush/nvrush">
    <img src="https://dotfyle.com/nvrush/nvrush/badges/leaderkey?style=flat-square&colorA=1e1e2e&colorB=f38ba8" alt="Leader Key">
  </a>
  <a href="https://dotfyle.com/nvrush/nvrush">
    <img src="https://dotfyle.com/nvrush/nvrush/badges/plugin-manager?style=flat-square&colorA=1e1e2e&colorB=a6e3a1" alt="Plugin Manager">
  </a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.10+-57A143?style=flat-square&logo=neovim&logoColor=white" alt="Neovim">
  <img src="https://img.shields.io/badge/License-MIT-89b4fa?style=flat-square" alt="License">
  <img src="https://img.shields.io/github/stars/nvrush/nvrush?style=flat-square&color=f9e2af&logo=github&logoColor=white" alt="Stars">
</p>

<div align="center">

https://github.com/user-attachments/assets/65301e67-8b47-4cf6-b998-cde671436aa7

![Screenshot_20251125_072755](https://github.com/user-attachments/assets/b0ad4069-4c9e-40f7-a000-423205d2420e)

</div>

A feature-rich Neovim configuration with 88 carefully curated plugins and 83 beautiful themes. Transform your Neovim into a powerful IDE while keeping it fast and customizable.

## ✨ Highlights

- 🎨 **83 stunning themes** - Switch between colorschemes to match your mood
- ⚡ **88 powerful plugins** - Carefully selected for productivity and performance
- 🔧 **Easy customization** - Add your own plugins and configurations
- 📦 **Mason support** - Install LSP servers, formatters, and linters with ease
- 🚀 **Modern features** - LSP, debugging, fuzzy finding, Git integration, and more

## 📋 Requirements

- Neovim 0.10 or higher
- Git
- ~200 MB of disk space for initial setup

## 🚀 Installation

**Clone and install:**

```sh
mkdir -p ~/.config/nvrush
cd ~/.config/nvrush
git clone https://github.com/nvrush/nvrush.git .
NVIM_APPNAME=nvrush nvim
```

**Create a convenient alias:**

```sh
# For Bash users
echo "alias nvr='NVIM_APPNAME=nvrush nvim'" >> ~/.bashrc
source ~/.bashrc

# For Zsh users
echo "alias nvr='NVIM_APPNAME=nvrush nvim'" >> ~/.zshrc
source ~/.zshrc
```

Now you can launch nvrush with just `nvr`!

> **Note:** On first launch, you may need to reload your colorscheme with `:colorscheme gruvbox-baby` if themes appear dull.

## 🗑️ Uninstall

```sh
rm -rf ~/.config/nvrush/
rm -rf ~/.local/share/nvrush/
```

## 🎨 Featured Plugins

### Core Features

**Plugin Management**
- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim) - Fast and modern plugin manager

**File Navigation**
- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim) - Fuzzy finder for files, buffers, and more
- [nvim-tree/nvim-tree.lua](https://dotfyle.com/plugins/nvim-tree/nvim-tree.lua) - File explorer
- [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim) - Edit your filesystem like a buffer
- [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon) - Quick file navigation

**Code Intelligence**
- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig) - LSP configuration
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp) - Autocompletion
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter) - Advanced syntax highlighting
- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim) - LSP server installer

**Debugging**
- [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap) - Debug Adapter Protocol
- [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui) - Beautiful debugging UI

**Git Integration**
- [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim) - Git interface

**UI Enhancements**
- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim) - Statusline
- [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim) - Buffer tabs
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim) - Enhanced UI
- [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim) - Terminal integration

**Session Management**
- [stevearc/resession.nvim](https://dotfyle.com/plugins/stevearc/resession.nvim) - Session management
- [rmagatti/auto-session](https://dotfyle.com/plugins/rmagatti/auto-session) - Automatic session saving

### Popular Themes Included

Choose from 83 themes including:
- [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
- [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
- [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
- [ellisonleao/gruvbox.nvim](https://dotfyle.com/plugins/ellisonleao/gruvbox.nvim)
- [rose-pine/neovim](https://dotfyle.com/plugins/rose-pine/neovim)
- [sainnhe/everforest](https://dotfyle.com/plugins/sainnhe/everforest)
- [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)
- And 76 more!

[View full plugin list →](#full-plugin-list)

## ⚙️ Customization

### Adding Custom Language Servers

Edit `~/.config/nvrush/lua/user/config/LspBatch/lsp.lua` and add your server to the table.

**Preconfigured servers include:**
- C/C++ (clangd)
- CMake, Go (gopls), Lua (lua_ls)
- Web (HTML, CSS, JS/TS via vtsls)
- Markdown (marksman), PHP (phpactor)
- TOML (taplo), GDScript
- And more!

> **Note:** nvrush provides configurations only. Download and install LSP servers yourself via Mason or your package manager.

### Adding Custom Snippets

Add snippet files to `~/.config/nvrush/lua/user/Snippets/` using VSCode-style JSON format. Name files after the language (e.g., `c.json`, `python.json`).

## 📚 Full Plugin List

<details>
<summary><strong>Click to expand complete plugin list</strong></summary>

### Bars and Lines
- [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)

### Code Runner
- [stevearc/overseer.nvim](https://dotfyle.com/plugins/stevearc/overseer.nvim)

### Colorschemes
83 themes including catppuccin, tokyonight, nord, gruvbox variants, rose-pine, kanagawa, everforest, and many more!

### Comments
- [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)

### Completion
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### Debugging
- [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
- [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
- [theHamsta/nvim-dap-virtual-text](https://dotfyle.com/plugins/theHamsta/nvim-dap-virtual-text)

### Diagnostics
- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### Editing Support
- [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
- [folke/snacks.nvim](https://dotfyle.com/plugins/folke/snacks.nvim)
- [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)

### File Explorers
- [nvim-tree/nvim-tree.lua](https://dotfyle.com/plugins/nvim-tree/nvim-tree.lua)
- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)
- [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)

### Formatting
- [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

### Fuzzy Finders
- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
- [jvgrootveld/telescope-zoxide](https://dotfyle.com/plugins/jvgrootveld/telescope-zoxide)

### Icons
- [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
- [echasnovski/mini.icons](https://dotfyle.com/plugins/echasnovski/mini.icons)

### Indentation
- [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### Keybindings
- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### Project Management
- [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)
- [nvim-telescope/telescope-project.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope-project.nvim)
- [natecraddock/workspaces.nvim](https://dotfyle.com/plugins/natecraddock/workspaces.nvim) *(under development)*

### Scrolling
- [karb94/neoscroll.nvim](https://dotfyle.com/plugins/karb94/neoscroll.nvim)

### Snippets
- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
- [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)

### Split and Window
- [beauwilliams/focus.nvim](https://dotfyle.com/plugins/beauwilliams/focus.nvim)

### Startup
- [nvimdev/dashboard-nvim](https://dotfyle.com/plugins/nvimdev/dashboard-nvim)
- [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)

### Statusline
- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
- [rebelot/heirline.nvim](https://dotfyle.com/plugins/rebelot/heirline.nvim)

### Syntax
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
- [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)

### Utilities
- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- [leath-dub/snipe.nvim](https://dotfyle.com/plugins/leath-dub/snipe.nvim)
- [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)

</details>

## 📝 License

This project is licensed under the MIT License. You're free to use, modify, and distribute it!

## 🙏 Credits

- README generated by [Dotfyle](https://dotfyle.com)
- Built with love using plugins from the amazing Neovim community
- Special thanks to all plugin authors who make configurations like this possible

---

<p align="center">
  <strong>Star this repo if you find it useful!</strong> ⭐
</p>
