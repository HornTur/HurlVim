# Codeootus
![BCO 2ade9fd7-19fd-405d-8be3-9bcf3a23e4c](https://github.com/user-attachments/assets/800826c3-92a8-4980-b1d8-7b2eb83e46c5)

<video src="https://github.com/user-attachments/assets/65301e67-8b47-4cf6-b998-cde671436aa7" autoplay loop muted playsinline></video>

![Screenshot_20251125_072755](https://github.com/user-attachments/assets/b0ad4069-4c9e-40f7-a000-423205d2420e)

## About
Codeotus is a more focused & fast IDE built for Neovim with Lua. It is faat enough for multilingual coding , multisessions & gives you full control over Neovim in a modern way. 

Is vibe coded only
Is actively maintained.
Feature Rich & Fast enough for Coding.
For novice and For Professionals.
Comes with ~85 Themes & is configured well for Gruvbox all Warm Themes.
Better Motions & many lazy keybindings with which-key.
Is mostly Zen Mode like.
Is MIT licensed & you are free to do all edits. 

## Open-Selling Point
Full supoort for most major themes & you will get ~85 themes.
Daily & Manually maintained with the help of Claude & Chatgpt.
Only the most relevant features you would like.
Reduced Distraction with Modern themeing & Plugin support.
Easy to edit , add & remove plugins.
Plugin powerhouse & easy plugin integration & easy to edit plugins.
Better Keymaps for Lazy people.
Easy to edit , add & remove key mappings.
Preconfigured lsps and easier tabular workflow.
Major Completion engine support.

## Open-Weakness Point
1. Since Codeotus is an Opensource IDE or Preconfigured Terminal Integrated space you may find it to have many features un-available if you are coming from an IDE , that is beacuse Codeotus is aimed to enhance Neovim's features via .lua configuration files & most features are just too complex for a Solo Devloper to add. However I am kept on trying to add everything that can enhace Neovim but I have already given a lot by spending not just weeks but months on this! Don't worry Neovim do already have most features & I am sure you probably be never mastering the whole command line in this life. Just enjoy!

2. Codeotus have no Human contributors except me & only LLMs based contributors like Calude & Chat-gpt hence some features might take 1-2 days to popup.

3. No version control on github - you will only get what I feels good to git.

4. Since it is a bigger Configured Integrated Enviroment (CIE) hence lerning curves could be bigger for intial phase until & unless you get used to Leader Key Bindings.

##  Requirements

1. Neovim 0.10 or higher
2. Git
3. ~200 MB of disk space + Bandwidth for initial setup

## Hots 
blink-cmp.nvim

## ToDo
1. Fix Bloated unwanted plugins 
2  Fix Keymappings
3. Add Workspace
 
##  Installation

**Clone and install:**

```sh
mkdir -p ~/.config/Codeotus
cd ~/.config/Codeotus
git clone https://github.com/Codeotus/Codeotus.git .
NVIM_APPNAME=Codeotus nvim
```

**Create a convenient alias:**

```sh
# For Bash users
echo "alias cod='NVIM_APPNAME=Codeotus nvim'" >> ~/.bashrc
source ~/.bashrc

# For Zsh users
echo "alias cod='NVIM_APPNAME=Codeotus nvim'" >> ~/.zshrc
source ~/.zshrc
```

Now you can launch Codeotus with just `cod`!

> **Note:** On first launch, you may need to reload your colorscheme with `:colorscheme gruvbox-baby` if themes appear dull.

##  Uninstall

```sh
rm -rf ~/.config/Codeotus/
rm -rf ~/.local/share/Codeotus/
```

##  Featured Plugins

### Core Features
Plugin Managers = Lazy.nvim (main) & Mason (Secondary)
File Navigation = oil.nvim telescope.nvim harpoon.nvim arrow.nvim snipe.nvim nvim-tree.nvim 
Lsp = nvim-lspconfig
Autocompletion Engines = nvim-cmp.nvim & blink-cmp.lua
Treesitters = nvim-treesitter (download with :TSInstall language_name)
DAP = nvim-dap & nvim-dap-ui (Under maintainance)
Git = lazygit.nvim 
Statusline = lualine 
Bufferline = bufferline.nvim
Notification = Mostly mini.notify + nvim-notify && use snacks.nvim as backend if mini fails.
Surround = surround.nvim 
Comment = comment.nvim
Terminal = toggleterm.nvim
Session = resession.nvim 
IBL = indent-blankline.nvim 
Diagonastics = trouble.nvim
Autopairs = nvim-autopairs
Formatting = conform.nvim
Keybindings = which-key.nvim
Scrolling = neoscroll.nvim 
Snippets = LuaSnip + Per extension Json based snippet support
Dashboard = Ascii + Dashboard plugin

### Popular Themes Included
Choose from 85 themes including:
1. Rose-pine
2. Catppuccin
3. Gruvbox 
4. Biscuit
5. Bamboo
6. Melange
7. Github
8. Tokyonight
9. Kangawa 
10. Nord
- And 75 more!

##  Customization

### Adding Custom Language Servers

Edit `~/.config/Codeotus/lua/user/config/LspBatch/lsp.lua` and add your server to the table.

**Preconfigured servers include:**
- C/C++ (clangd)
- CMake, Go (gopls), Lua (lua_ls)
- Web (HTML, CSS, JS/TS via vtsls)
- Markdown (marksman), PHP (phpactor)
- TOML (taplo), GDScript
- And more!

> **Note:** Codeotus provides configurations only. Download and install LSP servers yourself via Mason or your package manager.

### Adding Custom Snippets

Add snippet files to `~/.config/Codeotus/lua/user/Snippets/` using VSCode-style JSON format. Name files after the language (e.g., `c.json`, `python.json`).

## To Delete : 
heirline.nvim 

## 📝 License

This project is licensed under the MIT License. You're free to use, modify, and distribute it!

## 🙏 Credits

- Special thanks to all plugin authors who make configurations like this possible
- Previously README generated by [Dotfyle](https://dotfyle.com) 
- New one is generated by Claude -free tier
- Built with love using plugins from the amazing Neovim community
---

<p align="center">
  <strong>Star this repo if you find it useful!</strong> ⭐
</p>
