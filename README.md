
# 🚀 HurlVim

> **A paradise for lazy developers** — Experience the power of a blazing-fast, offline IDE with the elegance of Vim/Neovim. All the features you love, none of the bloat.

<div align="center">
  <img width="800" alt="HurlVim Preview" src="https://github.com/user-attachments/assets/dca2972c-bca1-48e3-9fea-a5b53666ad76" />
</div>

---

## ✨ Why HurlVim?

HurlVim delivers the perfect balance between functionality and minimalism:

- ⚡ **Blazing Fast** — Lightning-quick startup and response times
- 🎨 **Beautiful Themes** — Eye-catching UI powered by Lua
- 📦 **Minimal Footprint** — Only ~6MB, yet feature-complete
- 🔌 **Offline First** — No internet required, complete privacy
- 🎯 **IDE-like Experience** — All the modern features without the weight
- 🛠️ **Pre-configured** — Ready to use out of the box

**[IMPORTANT]** HurlVim is 1000x better than bloated online editors while maintaining the soul of Vim/Neovim.

---

## 📥 Installation

### Quick Install

```bash
# Create your custom config directory
mkdir -p ~/.config/hv

# Navigate to the directory
cd ~/.config/hv

# Clone HurlVim
git clone https://github.com/HornTur/HurlVim.git ~/.config/hv

# Launch HurlVim for the first time
NVIM_APPNAME=hv nvim

# Optional add to zshrc or bashrc and after that source it 
# alias hv='NVIM_APPNAME=hv nvim'



```

**[NOTE!]** Replace `hv` with your preferred directory/launcher name (e.g., `hurlvim`, `hv`, or `mynvim`).

### Setting Up an Alias (Optional but Recommended)

Add this to your shell configuration file (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
alias hv='NVIM_APPNAME=hv nvim'
```

Then reload your shell:

```bash
source ~/.bashrc  # or ~/.zshrc for Zsh users
```

**[NOTE!]** After the first launch, plugins will install automatically. This may take a minute — be patient and let the magic happen! ✨

---

## 🚦 Getting Started

### First Launch

1. **Initial Setup** — Run `hv` (or your custom alias) for the first time
2. **Plugin Installation** — Wait for automatic plugin installation to complete
3. **Ready to Code** — Start editing with your new supercharged setup!

[IMPORTANT!]:
> The `NVIM_APPNAME` environment variable ensures HurlVim runs independently from your main Neovim configuration. This means you can test HurlVim without affecting your existing setup!

### Launch Commands

```bash
# Using the full command
NVIM_APPNAME=hv nvim

# Using your alias (if configured)
hv

# Open a specific file
hv myfile.lua
```

---

## 💎 Features

### What You Get

- **Smart Autocompletion** — Intelligent code suggestions
- **Syntax Highlighting** — Beautiful, accurate code coloring
- **File Explorer** — Intuitive file navigation
- **Fuzzy Finding** — Lightning-fast file and text search
- **Git Integration** — Seamless version control
- **LSP Support** — Full language server protocol integration
- **Terminal Integration** — Built-in terminal access
- **Custom Keybindings** — Optimized for productivity

### Performance

- **Startup Time** — Launches in milliseconds
- **Memory Usage** — Incredibly lightweight
- **Responsive** — Smooth editing even with large files

---

## ⚖️ Pros & Cons

### Pros ✅

You already know them — that's why you're here! 😉

### Cons ⚠️

Go ahead and find them — we dare you! If you discover any, feel free to contribute or open an issue.

---

## 🤝 Contributing

Found a bug or have a feature request? Contributions are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📜 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🌟 Support

If HurlVim makes your development life easier, consider:

- ⭐ **Starring** the repository
- 🐛 **Reporting** bugs and issues
- 💡 **Suggesting** new features
- 📢 **Sharing** with fellow developers

---

<div align="center">
  <sub>Built with ❤️ for developers who value speed, elegance, and simplicity</sub>
</div>
