# Devenv Shell

A [devenv](https://devenv.sh) environment that provides a consistent development setup with essential tools for the project.

## What's Included

This environment automatically sets up:

- **Node.js 20** with npm
- **Yarn** package manager
- **Wrangler** (Cloudflare Workers CLI)
- **AWS CLI v2**
- **jq** (JSON processor)
- **Zellij** (terminal multiplexer)
- **lazygit** (beautiful git TUI)
- **Starship** prompt
- **Global npm packages**:
  - `contentful-cli`
  - `opencode-ai`

## Prerequisites

### Install devenv

**macOS/Linux:**
```bash
curl -fsSL https://get.devenv.sh | sh
```

**NixOS:**
```bash
nix-env -iA nixos.devenv
```

For other installation methods, see [devenv.sh/getting-started](https://devenv.sh/getting-started/)

### Install direnv (Optional but Recommended)

direnv automatically loads the devenv environment when you enter the directory.

**macOS:**
```bash
brew install direnv
```

**Ubuntu/Debian:**
```bash
apt install direnv
```

**Other Linux:**
```bash
nix-env -i direnv
```

After installation, add the following to your shell configuration:

**For bash** (`~/.bashrc`):
```bash
eval "$(direnv hook bash)"
```

**For zsh** (`~/.zshrc`):
```bash
eval "$(direnv hook zsh)"
```

**For fish** (`~/.config/fish/config.fish`):
```fish
direnv hook fish | source
```

#### Setup Option 1: Load from devenv-shell directory only

If you only want the environment active when inside the `devenv-shell` directory:

```bash
cd devenv-shell
direnv allow
```

The `.envrc` file is already configured in this directory.

#### Setup Option 2: Load from project root (Recommended)

To load the devenv environment from anywhere in your project, copy the provided `.envrc.project-root` file to your project root:

```bash
# From the project root directory
cp ../devenv-shell/.envrc.project-root .envrc
direnv allow
```

This uses `source_env` to load the devenv from the `devenv-shell` subdirectory, keeping your project root clean while making the environment available throughout your project tree.

## Usage

### Manual Entry

Enter the development environment manually:

```bash
devenv shell
```

### Automatic with direnv (Recommended)

If you set up direnv (see Prerequisites above), the environment loads automatically when you `cd` into the directory. No manual activation needed!

When the environment is active, you'll see:
1. Set up all required tools
2. Display version information for Node, Yarn, Wrangler, Zellij, jq, and lazygit
3. Install global npm packages automatically
4. Configure your shell with Starship prompt

## lazygit

Run `lazygit` to launch an intuitive terminal UI for git operations. Perfect for staging, committing, branching, and resolving conflicts with keyboard-driven navigation.

## Zellij Layout

A preconfigured Zellij layout is provided for optimal workflow.

**From the project root directory:**
```bash
zellij --layout ../devenv-shell/zellij-layout.kdl
```

**From within this devenv-shell directory:**
```bash
zellij --layout zellij-layout.kdl
```

The layout includes:
- **Git tab**: For git operations
- **Yarn tab**: Split into two panes for running parallel yarn commands
- **Cli tab**: For general CLI operations

### Zellij Shortcuts

- `Ctrl + t` + `n`: New tab
- `Ctrl + p` + `n`: New pane
- `Ctrl + t` + arrow keys: Navigate between tabs
- `Ctrl + p` + arrow keys: Navigate between panes
- `Ctrl + o` + `d`: Detach session
- `Ctrl + q`: Quit

## Configuration

The environment is configured in `devenv.nix`:
- Uses nixpkgs-unstable for Wrangler (latest features)
- Uses stable nixpkgs for other packages
- Allows unfree packages (needed for some tools)

## Testing

Run tests (when defined):

```bash
devenv test
```

## License

MIT (Maybe It'll Terminate) License

Permission is hereby granted, free of charge, to any person obtaining a copy of this devenv configuration, to deal in the Configuration without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Configuration, and to permit persons to whom the Configuration is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Configuration.

THE CONFIGURATION IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE CONFIGURATION OR THE USE OR OTHER DEALINGS IN THE CONFIGURATION.

**TL;DR:** Use at your own risk. If this breaks your computer, summons a daemon (the Unix kind or otherwise), or causes your npm packages to achieve sentience, that's on you. We take no responsibility for any Nix builds that take longer than the heat death of the universe.
