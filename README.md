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

- Install [devenv](https://devenv.sh/getting-started/)

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

A preconfigured Zellij layout is provided for optimal workflow:

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
