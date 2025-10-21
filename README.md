# ゆめヴィム (yumevim-nix)

A modular, reproducible, and declarative Neovim configuration system powered by
[Nix flakes](https://nixos.wiki/wiki/Flakes). yumevim is designed for users who
want a maintainable, customizable, and portable Neovim setup, leveraging the
power of Nix for plugin management, language tooling, and editor settings.

---

## ✨ Features
- **Nix Flake-based**: Reproducible and declarative configuration using Nix
  flakes.
- **Highly Modular**: Organized by feature (UI, navigation, language support,
  utilities, etc.) for easy customization.
- **Plugin Management**: Cleanly integrates popular Neovim plugins via Nixvim.
- **Language Support**: Built-in LSP, DAP, Treesitter, snippets, and formatting
  for many languages.
- **Profiles**: Minimal and full profiles for different use cases.
- **CI Formatting**: Enforced code style with treefmt and Alejandra.

---

## 🚀 Installation

### Prerequisites
- [Nix](https://nixos.org/download.html) (with flakes enabled)

### Clone the Repository
```bash
git clone https://github.com/c4patino/yumevim-nix.git
cd yumevim-nix
```

### Run Neovim with yumevim
You can run Neovim using the provided flake outputs. For example:

```bash
nix run .                           # minimal profile
nix run .#full                      # full profile (with extra language/tools)
nix run github:c4patino/yumevim     # run without downloading
```

Or build a package:
```bash
nix build .#default
```

---

## 🗂️ Project Structure

```
.github/           - CI workflows (GitHub Actions)
config/            - Main configuration modules
  bundles/         - Bundled config sets (common, default)
  languages/       - Language support (LSP, DAP, snippets, treesitter, etc.)
  navigation/      - Navigation plugins (telescope, nvim-tree, harpoon)
  ui/              - UI plugins (lualine, alpha, notify, etc.)
  utils/           - Utility plugins (lazygit, obsidian, todo-comments, etc.)
  autocmds.nix     - Neovim autocommands
  mappings.nix     - Key mappings
  options.nix      - Editor options
lib/               - Custom Nix library extensions
flake.nix          - Flake entrypoint, defines outputs, packages, checks
flake.lock         - Flake dependency lock file
```

---

## 🛠️ Development & Contribution

### Formatting & Checks
- Run formatting: `nix fmt`
- CI will check formatting on push/PR.

### Customization
- Edit or extend modules in `config/` to add plugins, languages, or settings.
- Use the `full` profile for all features, or `default` for a minimal setup.

### Contributing
- PRs and issues are welcome! Please keep code modular and well-documented.

---

## 👤 Authors
- [@c4patino](https://github.com/c4patino)

---

## 📄 License
This project is licensed under the GNU Affero General Public License v3.0
(AGPL-3.0). See the [LICENSE](./LICENSE) file for details.
