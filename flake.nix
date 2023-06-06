{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mesa-git = {
      url = "git+https://gitlab.freedesktop.org/mesa/mesa?ref=main";
      flake = false;
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs = inputs: {

    # System configurations and modules
    nixosConfigurations = import ./Global/configurations inputs;
    nixosModules = import ./Global/modules inputs;

    # Home-manager configurations and modules
    homeConfigurations = import ./Home/configurations inputs;
    homeModules = import ./Home/modules inputs;

    # Custom library functions
    lib = import ./Global/lib inputs;

    # Packages to build
    packages = import ./Global/packages inputs;
  };
}
