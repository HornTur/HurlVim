# 🚀 NvRush
> [!Important]
> **A paradise for lazy developers** — Experience the power of a blazing-fast, offline IDE with the elegance of Vim/Neovim. All the features you love, none of the bloat.

<div align="center">
<img width="800" height="800" alt="NvRush's Logo" src="https://github.com/user-attachments/assets/b96db7fd-6aa8-47e7-a360-71f3b1152ac7" />
</div>

---

## ✨ Why NvRush?

NvRush delivers the perfect balance between functionality and minimalism:

- ⚡ **Blazing Fast** — Lightning-quick startup and response times
- 🪶 **Featherweight** — Only ~6MB, incredibly light on resources
- 🎯 **Efficient Like IDEs** — Modern features without the heavyweight baggage
- ✏️ **Fully Integrated Editing** — Seamless workflow from start to finish
- 🔄 **Workflow Made Easy** — Optimized keybindings and smart defaults
- 🎨 **Beautiful Themes** — Eye-catching UI powered by Lua
- 🔌 **Offline First** — No internet required, complete privacy guaranteed
- 🛠️ **Pre-configured** — Ready to use out of the box, zero hassle
- 🧠 **Smart & Intuitive** — Learn once, productive forever
- 🔧 **Highly Customizable** — Bend it to your will with simple Lua configs

> [!IMPORTANT]
> NvRush is 1000x better than bloated online editors while maintaining the soul of Vim/Neovim.

---

## 📥 Installation

### Quick Install

```bash
# Create your custom config directory
mkdir -p ~/.config/rv

# Navigate to the directory
cd ~/.config/rv

# Clone NvRush
git clone https://github.com/HornTur/NvRush.git ~/.config/rv

# Launch NvRush for the first time
NVIM_APPNAME=rv nvim

# Optional: add to zshrc or bashrc and then source it 
# alias rv='NVIM_APPNAME=rv nvim'
```

> [!NOTE]
> Replace `rv` with your preferred directory/launcher name (e.g., `nvrush`, `rv`, or `mynvim`).

### Setting Up an Alias (Optional but Recommended)

Add this to your shell configuration file (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
alias rv='NVIM_APPNAME=rv nvim'
```

Then reload your shell:

```bash
source ~/.bashrc  # or ~/.zshrc for Zsh users
```

> [!NOTE]
> After the first launch, plugins will install automatically. This may take a minute — be patient and let the magic happen! ✨

---

## 🚦 Getting Started

### First Launch

1. **Initial Setup** — Run `rv` (or your custom alias) for the first time
2. **Plugin Installation** — Wait for automatic plugin installation to complete
3. **Ready to Code** — Start editing with your new supercharged setup!

> [!IMPORTANT]
> The `NVIM_APPNAME` environment variable ensures NvRush runs independently from your main Neovim configuration. This means you can test NvRush without affecting your existing setup!

### Launch Commands

```bash
# Using the full command
NVIM_APPNAME=rv nvim

# Using your alias (if configured)
rv

# Open a specific file
rv myfile.lua
```

---

## 💎 Features

### What You Get

- **Smart Autocompletion** — Intelligent code suggestions powered by advanced engines
- **Syntax Highlighting** — Beautiful, accurate code coloring with Treesitter
- **File Explorer** — Intuitive file navigation with visual indicators
- **Fuzzy Finding** — Lightning-fast file and text search across your entire project
- **Git Integration** — Seamless version control with visual diff and blame
- **LSP Support** — Full language server protocol integration for multiple languages
- **Terminal Integration** — Built-in terminal access without leaving your editor
- **Custom Keybindings** — Optimized for productivity and muscle memory
- **Snippet Support** — Quick code templates for common patterns
- **Diagnostic Display** — Inline error and warning messages
- **Auto-formatting** — Keep your code clean with automatic formatting
- **Split Windows** — Work on multiple files simultaneously with ease

### Performance

- **Startup Time** — Launches in milliseconds, not seconds
- **Memory Usage** — Incredibly lightweight, runs smoothly even on modest hardware
- **Responsive** — Smooth editing even with large files and complex projects
- **Battery Friendly** — Efficient resource usage extends laptop battery life

---

## 🎯 Perfect For

- **Minimalists** — Who want power without complexity
- **Speed Demons** — Who demand instant response times
- **Privacy Advocates** — Who prefer offline-first solutions
- **Vim Enthusiasts** — Who love modal editing and efficiency
- **Resource-Conscious Devs** — Working on older or lower-spec machines
- **Terminal Lovers** — Who live in the command line

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

This project is open source and available under the [GPLv3.0 License](LICENSE).

---

## 🌟 Support

If NvRush makes your development life easier, consider:

- ⭐ **Starring** the repository
- 🐛 **Reporting** bugs and issues
- 💡 **Suggesting** new features
- 📢 **Sharing** with fellow developers
- 💬 **Joining** discussions and helping others

---

<div align="center">
  <sub>Built with ❤️ for developers who value speed, elegance, and simplicity</sub>
</div>
