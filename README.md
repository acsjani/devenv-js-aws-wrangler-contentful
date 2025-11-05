# Devenv Shell

A [devenv](https://devenv.sh) environment that provides a consistent development setup with essential tools for the project.

## What's Included

This environment automatically sets up:

- **Node.js 20** with npm
- **Yarn** package manager
- **Wrangler** (Cloudflare Workers CLI)
- **AWS CLI v2**
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
2. Display version information for Node, Yarn, and Wrangler
3. Install global npm packages automatically
4. Configure your shell with Starship prompt

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
