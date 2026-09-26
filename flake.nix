{
  description = "Homebrew tap development tools";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nixpkgsIntel.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";

  outputs =
    { nixpkgs, nixpkgsIntel, ... }:
    let
      packagesFor =
        system: (if system == "x86_64-darwin" then nixpkgsIntel else nixpkgs).legacyPackages.${system};
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      formatter = forAllSystems (system: (packagesFor system).nixfmt);

      devShells = forAllSystems (
        system:
        let
          pkgs = packagesFor system;
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              curl
              gh
              git
              nixfmt
              ruby
            ];
          };
        }
      );
    };
}
