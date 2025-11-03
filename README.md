# dotfiles

Personal dotfiles configuration for macOS.

## Prerequisites

- macOS
- Git
- zsh (comes pre-installed on macOS)
- Neovim (install via Homebrew: `brew install neovim`)

## Quick Start

1. **Clone the repository with submodules:**

   ```bash
   git clone --recurse-submodules <repository-url> ~/dev/personal/dotfiles
   ```

   Or if you've already cloned without submodules:

   ```bash
   cd ~/dev/personal/dotfiles
   git submodule update --init --recursive
   ```

2. **Follow the manual setup steps below** to symlink configuration files.

## Manual Setup

### 1. Clone Repository with Submodules

The repository uses Git submodules for zsh plugins. Make sure to clone with submodules:

```bash
git clone --recurse-submodules <repository-url> ~/dev/personal/dotfiles
```

If you've already cloned without submodules, initialize them:

```bash
cd ~/dev/personal/dotfiles
git submodule update --init --recursive
```

### 2. Setup Zsh Configuration

1. **Symlink Oh My Zsh:**

   ```bash
   ln -s ~/dev/personal/dotfiles/oh-my-zsh ~/.oh-my-zsh
   ```

2. **Symlink zshrc:**

   ```bash
   ln -s ~/dev/personal/dotfiles/zshrc ~/.zshrc
   ```

3. **Make zsh your default shell** (if not already):

   ```bash
   chsh -s $(which zsh)
   ```

4. **Restart your terminal** or run:

   ```bash
   zsh
   ```

#### Zsh Plugins (Git Submodules)

The following zsh plugins are included as Git submodules:

- `oh-my-zsh` - Framework for managing zsh configuration
- `zsh-custom/plugins/zsh-autosuggestions` - Fish-like autosuggestions
- `zsh-custom/plugins/zsh-syntax-highlighting` - Syntax highlighting
- `zsh-custom/plugins/zsh-completions` - Additional completions

These are automatically loaded by the `zshrc` configuration. To update all submodules:

```bash
git submodule update --remote --recursive
```

Or use the alias:

```bash
update_submodules
```

### 3. Setup Neovim Configuration

1. **Install vim-plug for Neovim:**

   ```bash
   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

2. **Symlink Neovim config:**

   ```bash
   mkdir -p ~/.config
   ln -s ~/dev/personal/dotfiles/nvim ~/.config/nvim
   ```

3. **Install Neovim plugins:**

   ```bash
   nvim +PlugInstall +qa
   ```

   Or open Neovim and run `:PlugInstall`

See `nvim/README.md` for more details.

### 4. Setup Git Configuration

1. **Symlink gitconfig:**

   ```bash
   ln -s ~/dev/personal/dotfiles/gitconfig ~/.gitconfig
   ```

2. **Symlink gitignore:**

   ```bash
   ln -s ~/dev/personal/dotfiles/gitignore ~/.gitignore
   ```

3. **Create personal gitconfig** (optional, referenced in main gitconfig):

   ```bash
   touch ~/.gitconfig.user
   ```

### 5. Setup Other Tools (Optional)

#### Homebrew Packages

Install packages from `Brewfile`:

```bash
brew bundle
```

#### iTerm2 Profile

Import the profile:

- Open iTerm2 → Preferences → Profiles
- Click "Other Actions..." → "Import JSON Profiles"
- Select `iterm2-profile.json`

## Configuration Files

| File | Location | Description |
|------|----------|-------------|
| `zshrc` | `~/.zshrc` | Zsh shell configuration |
| `gitconfig` | `~/.gitconfig` | Git configuration |
| `gitignore` | `~/.gitignore` | Global Git ignore patterns |
| `nvim/init.vim` | `~/.config/nvim/init.vim` | Neovim configuration |
| `oh-my-zsh/` | `~/.oh-my-zsh` | Oh My Zsh framework |
| `zsh-custom/` | Referenced directly | Custom zsh themes and plugins |

## Useful Aliases

- `nvimconfig` - Edit Neovim configuration
- `zshconfig` - Edit zsh configuration
- `update_submodules` - Update all Git submodules

## Updating Dotfiles

1. **Pull latest changes:**

   ```bash
   cd ~/dev/personal/dotfiles
   git pull
   ```

2. **Update submodules:**

   ```bash
   git submodule update --remote --recursive
   ```

   Or use the alias:

   ```bash
   update_submodules
   ```

## Troubleshooting

### Submodules not loading

If zsh plugins aren't working, ensure submodules are initialized:

```bash
cd ~/dev/personal/dotfiles
git submodule update --init --recursive
```

### Zsh plugins not found

Check that `zsh-custom` path is correct in your `zshrc`. It should be:

```bash
ZSH_CUSTOM=$HOME/dev/personal/dotfiles/zsh-custom
```

### Neovim plugins not installing

Ensure vim-plug is installed and the Neovim config is symlinked correctly. Check:

```bash
ls -la ~/.config/nvim
ls -la ~/.local/share/nvim/site/autoload/plug.vim
```

## Editor

This repository uses **Neovim** as the primary editor. Configuration is located in `nvim/init.vim`.

- See `nvim/README.md` for Neovim setup instructions
- Use `nvimconfig` alias to edit Neovim configuration
- Git is configured to use `nvim` as the editor

## Shell

Uses **Oh My Zsh** with custom theme and plugins. Configuration in `zshrc`.

- Use `zshconfig` alias to edit zsh configuration
- Custom functions are in `zsh-custom/functions/`
- Plugins are managed as Git submodules

## Other Tools

- **iTerm2**: Profile configuration
- **Homebrew**: Package management via `Brewfile`
