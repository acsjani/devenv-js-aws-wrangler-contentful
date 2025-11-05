{ pkgs, lib, config, inputs, ... }:
let
  pkgs-unstable =
    import inputs.nixpkgs-unstable { system = pkgs.stdenv.system; };
  pkgs-stable = import inputs.nixpkgs-stable { system = pkgs.stdenv.system; };
in {
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ pkgs-unstable.wrangler pkgs.awscli2 pkgs.jq pkgs.zellij ];

  # https://devenv.sh/languages/
  languages.javascript = {
    enable = true;
    yarn = {
      enable = true;
      package = pkgs.yarn;
    };
    package = pkgs.nodejs_20;
  };

  starship.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  enterShell = ''
    hello
    echo "Node version:"
    node --version
    echo "Yarn version:"
    yarn --version
    echo "Wrangler version:"
    wrangler --version
    echo "Zellij version:"
    zellij --version
    echo "jq version:"
    jq --version
    echo "installing global npm packages..."
    yarn global add contentful-cli
    yarn global add opencode-ai@latest
    export PATH="$(yarn global bin):$PATH"
    echo ""
    echo "Tip: Run 'zellij --layout devenv-shell/zellij-layout.kdl' from your project root"
    echo "     or 'zellij --layout zellij-layout.kdl' from this directory"
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests... oh, no tests defined yet!"
  '';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
