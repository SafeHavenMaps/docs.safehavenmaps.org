{
  description = "A Nix flake for SafeHaven dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    alejandra,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
        # NodeJS environment
        fixedNode = pkgs.nodejs_20;
        fixedNodePackages = pkgs.nodePackages.override {
          nodejs = fixedNode;
        };
      in
        with pkgs; {
          devShells.default = mkShell {
            buildInputs = [ fixedNode ];
          };
        }
    );
}
