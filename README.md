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

Then create a `.envrc` file in this directory:
```bash
echo "use devenv" > .envrc
direnv allow
```

Now the environment will load automatically when you `cd` into this directory!

## Usage

Enter the development environment:

```bash
devenv shell
```

This will:
1. Set up all required tools
2. Display version information for Node, Yarn, Wrangler, Zellij, and jq
3. Install global npm packages automatically
4. Configure your shell with Starship prompt

## Zellij Layout

A preconfigured Zellij layout is provided for optimal workflow.

**From the project root directory:**
```bash
zellij --layout devenv-shell/zellij-layout.kdl
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

[Add your license here]
